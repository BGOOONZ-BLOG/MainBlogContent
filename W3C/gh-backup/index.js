
var sua = require("superagent")
,   fs = require("fs-extra")
,   pth = require("path")
,   winston = require("winston")
,   async = require("async")
,   exec = require("child_process").exec
;

exports.loadConfiguration = function (path) {
  var conf
  ,   transports = [];
  try {
    conf = require(path);
  }
  catch (e) {
    throw new Error("Configuration file not found or not valid JSON at " + path);
  }
  // the configuration holds a log
  if (conf.console) {
    transports.push(
      new (winston.transports.Console)({
              handleExceptions:                   true
          ,   colorize:                           true
          ,   maxsize:                            200000000
          ,   humanReadableUnhandledException:    true
      })
    );
  }
  if (conf.logFile) {
    transports.push(
      new (winston.transports.File)({
              filename:                           conf.logFile
          ,   handleExceptions:                   true
          ,   timestamp:                          true
          ,   humanReadableUnhandledException:    true
      })
    );
  }
  conf.log = new (winston.Logger)({ transports: transports });
  return conf;
}

function ensureDir (dir) {
  if (!fs.existsSync(dir)) fs.mkdirSync(dir);
}

function fetchRepo (conf, repo, cb) {
  var repoDir = pth.join(conf.dataDir, repo);
  if (!fs.existsSync(repoDir)) return cloneRepo(conf, repo, cb);
  exec("git fetch", { cwd: repoDir }, function (err) {
    if (err) return cb("Error fetching " + repo + " inside " + repoDir + ": " + err);
    conf.log.info("Updated " + repo + " in " + repoDir);
    cb();
  });
}

function cloneRepo (conf, repo, cb) {
  var repoDir = pth.join(conf.dataDir, repo);
  if (fs.existsSync(repoDir)) return fetchRepo(conf, repo, cb);
  exec("git clone --mirror https://github.com/w3c/" + repo + ".git " + repoDir, function (err) {
    if (err) return cb("Error cloning repository: " + repo + ", " + err);
    conf.log.info("Cloned " + repo + " to " + repoDir);
    cb();
  });
}

function storeLastUpdate (conf) {
  var d = new Date()
  ,   key = [d.getUTCFullYear(), d.getUTCMonth() + 1, d.getUTCDate(),
              d.getUTCHours(), d.getUTCMinutes(), d.getUTCSeconds(),
              d.getUTCMilliseconds()]
  fs.writeFileSync(pth.join(conf.dataDir, "last.json"), JSON.stringify(key), "utf8");
  conf.log.info("Stored last update: " + key.join(","));
}

function makeIgnoreErrorCB (conf, cb) {
  return function (err) {
    if (err) conf.log.error(err);
    cb();
  };
}

// these keep calling the next page until there are no results left
function getRepoPage (page, cb) {
  sua.get("https://api.github.com/orgs/w3c/repos?type=public&page=" + page)
      .accept("json")
      .end(function (err, res) {
        if (err) return cb(err);
        cb(null, res.body);
      });
}
function getFullRepoList (cb) {
  var page = 1
  ,   res = []
  ,   handler = function (err, repos) {
        if (err) return cb(err);
        if (repos.length) {
          res = res.concat(repos);
          page++;
          getRepoPage(page, handler);
        }
        else cb(null, res);
      }
  ;
  getRepoPage(page, handler);
}

// set up all known public repositories
exports.init = function (conf) {
  if (!conf.dataDir) return conf.log.error("Missing configuration field: dataDir.");
  ensureDir(conf.dataDir);
  storeLastUpdate(conf);
  getFullRepoList(function (err, repos) {
    if (err) return conf.log.error("Error setting up: " + err);
    if (conf.debug) conf.log.info(repos.map(function (it) { return it.name; }));
    var funcs = [];
    repos
        .map(function (it) { return it.name; })
        .forEach(function (it) { funcs.push(function (cb) { cloneRepo(conf, it, makeIgnoreErrorCB(conf, cb)); }) });
    if (conf.debug) funcs = funcs.slice(0, 5);
    async.series(
      funcs
    , function (err) {
        conf.log.info("init: done");
      }
    );
  })
}

// get a list of updated repos and update the backup
exports.update = function (conf) {
  var lastUpdateFile = pth.join(conf.dataDir, "last.json");
  if (!fs.existsSync(lastUpdateFile)) return conf.log.error("Cannot find last update file: have you forgotten to init?");
  var lastUpdate = JSON.parse(fs.readFileSync(lastUpdateFile, "utf8"));
  sua.get(conf.pheme + "api/events-updates/" + lastUpdate.join(","))
      .accept("json")
      .end(function (err, res) {
        if (err) return conf.log.error("Error getting updates: " + err);
        if (conf.debug) conf.log.info(res.body.map(function (it) { return it.repo; }));
        storeLastUpdate(conf);
        var temp = {}
        ,   funcs = []
        ;
        res.body.forEach(function (it) { temp[it.repo.replace("w3c/", "")] = true; });
        Object.keys(temp)
              .forEach(function (it) { funcs.push(function (cb) { cloneRepo(conf, it, makeIgnoreErrorCB(conf, cb)); }) });
        if (conf.debug) funcs = funcs.slice(0, 5);
        async.series(
          funcs
        , function (err) {
            conf.log.info("update: done");
          }
        );
      })
}
