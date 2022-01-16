
// munge-raw
// Use this as the first step when updating the raw data in order to obtain clean data which can be
// maintained.
// Unlikely to be needed again (it overwrites the edited data) but included in case

// The raw data was produced from:
//  http://www.w3.org/html/wg/drafts/html/CR/references.html
// by running the following console script under jQuerify
//  var res = {};
//  $("dt").each(function () { var $dt = $(this), cnt = [], $cur = $dt; while \
//      ($cur.next().is("dd")) { cnt.push($cur.next().html()); $cur = $cur.next(); } \
//      res[$dt.text().replace(/[\[\]]/g, "")] = cnt.join("\n"); })
//  copy(JSON.stringify(res, null, 4))

var fs = require("fs")
,   pth = require("path")
,   jn = pth.join
,   rel = function (path) { return jn(__dirname, path); }
,   rfs = function (f) { return fs.readFileSync(f, { encoding: "utf8" }); }
,   wfs = function (f, data) { return fs.writeFileSync(f, data, { encoding: "utf8" }); }
,   raw = JSON.parse(rfs(rel("raw-data-20140716.json")))
,   res = {}
;

// eliminate non-normative
for (var k in raw) {
    if (raw.hasOwnProperty(k) && !/non-normative/i.test(raw[k])) {
        var html = raw[k]
        ,   ref = {
                html:   html
            ,   urls:   []
            ,   titles: []
            ,   type:   "unknown"
            ,   notes:  "XXX"
            ,   stable: false
            }
        ;
        if (/<a/i.test(html)) {
            html.replace(/<a\s+href="([^"]*)"\s*>(.*?)<\/a>/gi, function (m, p1, p2) {
                if (/^http/.test(p2)) return;
                ref.urls.push(p1);
                ref.titles.push(p2);
            });
        }
        else {
            ref.titles.push(html.replace(/.*<cite>(.*)<\/cite>.*/, "$1"));
        }
        res[k] = ref;
    }
}

wfs(rel("data.json"), JSON.stringify(res, null, 4));
