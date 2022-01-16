
// extract the ToC from a document

var fs = require("fs")
,   pth = require("path")
,   jsdom = require("jsdom")
,   source = "http://www.w3.org/html/wg/drafts/html/CR/Overview.html"
;

function walkTree ($, $el, list) {
    $el.find("> li").each(function () {
        var $li = $(this)
        ,   $a = $li.find("> a").first()
        ;
        // skip sections that don't have a number
        if (!/^\s*\d+/.test($a.text())) return;
        var href = $a.attr("href").replace(/^.*#/, "")
        ,   def = {
                id: href
            ,   testDir: href.toLowerCase()
                             .replace(/[^a-z0-9\-]/g, "-")
                             .replace(/\-{2,}/g, "-")
                             .replace(/(?:^\-|\-$)/g, "")
            ,   title:  $a.clone().find("ol").remove().end().text()
            }
        ,   $ol = $li.find("> ol").first()
        ;
        if ($ol.length) {
            def.children = [];
            walkTree($, $ol, def.children);
        }
        list.push(def);
    });
}

function extractSections (spec, cb) {
    jsdom.env(
        spec
    ,   function (err, window) {
            if (err) return cb(err);
            jsdom.jQueryify(window,
                            "https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js",
                            function (window, $) {
                                if (!$) return cb("$ was not defined");
                                var $root = $("body > ol.toc").first()
                                ,   tree = []
                                ;
                                walkTree($, $root, tree);
                                cb(null, tree);
                            }
        );
    });
}

extractSections(source, function (err, toc) {
    if (err) return console.log("ERROR: " + err);
    fs.writeFileSync(pth.join(__dirname, "toc.json"), JSON.stringify(toc, null, 4), "utf8");
});
