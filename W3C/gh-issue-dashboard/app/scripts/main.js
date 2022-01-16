var main = document.getElementsByTagName('main')[0];

var queryParams = {repo:"",template:""};
var queryParamList = location.search.slice(1).split('&');
queryParamList.forEach(function(kv) { var k = kv.split('=')[0]; var v = kv.split('=')[1]; queryParams[k] = decodeURIComponent(v);});

function get(url) {
    return new Promise(function(resolve, reject) {
        var req = new XMLHttpRequest();
        req.open('GET', url);

        req.onload = function() {
            if (req.status == 200) {
                var pageLinks = req.getResponseHeader("Link") || "";
                var nextLink = !pageLinks ? undefined : pageLinks.split(",").filter(function (l) {
                    var values = l.split(";") ;
                    return values[1].indexOf("next") !== -1;
                })[0];
                if (nextLink) {
                    var nextUrl = nextLink.split(';')[0].replace(/[<>]/g,'');
                    get(nextUrl).then(function(responses) {
                        responses.push(req.response)
                        resolve(responses);
                    });
                } else {
                    resolve([req.response]);
                }
            } else {
                reject(Error(req.statusText));
            }
        };

        req.onerror = function() {
            reject(Error("Network Error"));
        };

        req.send();
    });
}

function sortIssues(a, b) {
  var now = new Date(),
      aDate = new Date(Date.parse(a.updated_at)),
      bDate = new Date(Date.parse(b.updated_at)),
      aScore = 0,
      bScore = 0;

  // flag bugs with long idle time
  var aScore = ((now-aDate)/1000)/(60*60*24),
      bScore = ((now-bDate)/1000)/(60*60*24);

  // push bugs with less activity to the top
  aScore += b.comments - a.comments,
  bScore += a.comments - b.comments;

  // push enhancements down on priority list
  a.labels.forEach(function(label){
    if (label.name == 'enhancement') { aScore -= 100 }
  })
  b.labels.forEach(function(label){
    if (label.name == 'enhancement') { bScore -= 100 }
  })

  if (aScore < bScore)
    return 1;
  if (aScore > bScore)
    return -1;
  return 0;
}

function getIssues(spec, cb) {
    get('https://api.github.com/repos/' + spec.repo + '/issues').then(
        function(responses) {
            spec.issues = [].concat.apply([], responses.map(JSON.parse)).sort(sortIssues);
            spec.unassigned_issues = spec.issues.filter(function(issue) { return issue.assignee == null;});
            spec.assigned_issues = spec.issues.filter(function(issue) { return issue.assignee  !== null;});

            cb(spec);
        },
        function(error) {
            spec.error = error;
            cb(spec);
        }
    );
}


Handlebars.registerHelper('pluralize', function(number, single, plural) {
  if (number === 1) { return single; }
  else { return plural; }
});

Handlebars.registerHelper('ifCond', function (v1, operator, v2, options) {
    switch (operator) {
        case '==':
            return (v1 == v2) ? options.fn(this) : options.inverse(this);
        case '===':
            return (v1 === v2) ? options.fn(this) : options.inverse(this);
        case '<':
            return (v1 < v2) ? options.fn(this) : options.inverse(this);
        case '<=':
            return (v1 <= v2) ? options.fn(this) : options.inverse(this);
        case '>':
            return (v1 > v2) ? options.fn(this) : options.inverse(this);
        case '>=':
            return (v1 >= v2) ? options.fn(this) : options.inverse(this);
        case '&&':
            return (v1 && v2) ? options.fn(this) : options.inverse(this);
        case '||':
            return (v1 || v2) ? options.fn(this) : options.inverse(this);
        default:
            return options.inverse(this);
    }
});

Handlebars.registerHelper('dateFormat', function(time) {
  return moment(time).fromNow()
});

function makeFilter(params) {
    var filters = params.map(function(param) {
        var maybeNot = function(x) { return x;};
        var valueTest = function(x) { return x[param] != null};
        if (param[0] === "!") {
            param = param.slice(1);
            maybeNot = function(x) { return !x;};
        }
        if (param.indexOf(":") !== -1) {
            var comp = param.split(":");
            var param = comp[0];
            var value = comp[1];
            switch(param) {
                case "label":
                valueTest = function(x) { return x["labels"].map(function(x) { return x.name}).indexOf(value) !== -1;};
                break;
                default:
                valueTest = function(x) { return x[param] == value;};

            }
        }
        return function(x) {
            return maybeNot(valueTest(x));
        };
    });
    return filters.reduce(function(acc, f) { return function(x) { return acc(x) && f(x);}}, function() { return true;});
}

Handlebars.registerHelper('filter', function() {
    var list = arguments[0];
    var opts = arguments[arguments.length - 1];
    var filters = [].splice.call(arguments,1,arguments.length - 2);
    var filtered = list.filter(makeFilter(filters));
    return opts.fn({list:filtered});
});

Handlebars.registerHelper('groupby', function(list, groupby, opts) {
    var groups = list.map(function (x) { return typeof x === "object" ? x[groupby].id : x;}).filter(function (x, i, arr) { return arr.indexOf(x) == i;});
    var grouped = {};
    var groupees = {};
    groups.forEach(function (g) {
        grouped[g] = list.filter(function(x) { return x[groupby].id === g});
        groupees[g] = grouped[g][0][groupby];
    });
    return opts.fn({list:groups.map(function(x) { return {groupby: groupees[x], list:grouped[x]};})});
});

Handlebars.registerHelper('dateColor', function(time) {
  var time = new Date(Date.parse(time)),
       now = new Date();

  if (((now-time)/1000)/(60*60*24) > 14) {
    return "color--red"
  } else {
    return "color--green"
  }
});

var templates = {};
var groups = {};

function getTemplates() {
    var templateCounter = 0;
    var templateUrls = ["templates/activityreport.html", "templates/label-state.html"];

    templateUrls.forEach(function(url) {
        var req = new XMLHttpRequest();
        req.open("GET", url)
        req.responseType = "document";
        req.onload = function() {
            templates[url] = {};
            templates[url].partials = {};
            templateCounter++;
            var doc = req.response;
            [].forEach.call(doc.querySelectorAll('script[type="text/x-handlebars-template"]'), function(t) {
                var id = t.id.split("-")[0];
                templates[url].partials[id] = t.innerHTML;
            });
            templates[url].main =  doc.getElementById("main").innerHTML;
            templates[url].doc =  doc.getElementById("doc").innerHTML;
            templates[url].title = doc.querySelector("title").textContent;
            if (templateCounter === templateUrls.length) {
                updateNav();
            }
        };
        req.send();
    });
}


function getRepos() {
    var baseUrl = "https://labs.w3.org/hatchery";
    get(baseUrl + "/ash-nazg/api/groups")
        .then(function(groupJSON) {
            var groupsData = JSON.parse(groupJSON[0]);
            groupsData.forEach(function(g) {
                groups[g.w3cid] = g;
                groups[g.w3cid].repos = [];
            });
            return get(baseUrl +  "/ash-nazg/api/repos");
        })
        .then(function(repoJSON) {
            var repos = JSON.parse(repoJSON[0]);
            repos.forEach(function(repo) {
                repo.groups.forEach(function(g) {
                    groups[g.w3cid].repos.push(repo);
                })
            });
            updateNav();
        })
        .catch(console.error.bind(console));
}

function render(repoPath, templateUrl) {
    if (Object.keys(templates).length) {
        Object.keys(templates[templateUrl].partials).forEach(function(id) {
        Handlebars.registerPartial(id, templates[templateUrl].partials[id]);
    });
        template = Handlebars.compile(templates[templateUrl].main);
        document.getElementById("doc").innerHTML = templates[templateUrl].doc;
        var specs = [];
        if (repoPath.indexOf(':') !== -1) {
            var id = repoPath.split(':')[1];
            specs = groups[id].repos.map(function(r) { return {name: r.fullName, repo: r.fullName};});
        } else {
            // Only read from well-known repos (i.e. in the w3c org,
            // or listed in ash-nazg)
            if (repoPath.match(/^w3c\//) || Object.keys(groups).filter(function(gid) { return groups[gid].repos.filter(function(r) { return r.fullName === repoPath;}).length > 0}).length > 0);
            specs.push({name: repoPath, repo: repoPath});
        }
        var counter = 0;
        specs.forEach(function(spec){
            getIssues(spec, function(issues) {
                counter++;
                spec.html = template(spec);
                if (counter == specs.length) {
                    display(specs);
                }
            });
        });
    }
}

function updateNav() {
    if (Object.keys(groups).length) {
        var repoSelector = document.getElementById("repo");
        repoSelector.innerHTML="";
        for (var id in groups) {
            if (groups[id].repos.length) {
                var optGroup = document.createElement("optgroup");
                optGroup.label = groups[id].name;
                var optionAll = document.createElement("option");
                optionAll.value = "id:" + id;
                optionAll.textContent = "All repos of " + groups[id].name;
                if (queryParams.repo === optionAll.value) {
                    optionAll.selected = true;
                }
                optGroup.appendChild(optionAll);
                groups[id].repos.forEach(function(r) {
                    var option = document.createElement("option");
                    option.value = r.fullName;
                    option.textContent = r.name;
                    optGroup.appendChild(option);
                    if (queryParams.repo === r.fullName) {
                        option.selected = true;
                    }
                });
                repoSelector.appendChild(optGroup);
            }
        }
    }
    if (Object.keys(templates).length) {
        var templateSelector = document.getElementById("template");
        templateSelector.innerHTML="";
        for (url in templates) {
            var option = document.createElement("option");
            option.value = url;
            option.textContent = templates[url].title;
            if (queryParams.template === url) {
                option.selected = true;
            }
            templateSelector.appendChild(option);
        }
    }

    if (Object.keys(templates).length && queryParams.template) {
        // for w3c/* repos, we don't need to wait for ash-nazg to display
        if (queryParams.repo.match(/^w3c\//) || Object.keys(groups).length) {
            render(queryParams.repo, queryParams.template);
        }
    }

    if (Object.keys(templates).length && Object.keys(groups).length) {
        document.getElementById("viewBtn").disabled = false;
    }
}

function display(specs) {
    main.innerHTML = "";
  specs.forEach(function(spec){
     main.innerHTML += spec.html;
  });
}

getTemplates();
getRepos();
