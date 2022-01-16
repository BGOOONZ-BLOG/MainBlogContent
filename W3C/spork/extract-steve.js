#!/usr/bin/env node

var Nightmare = require("nightmare")
,   data = {}
,   fs = require("fs")
,   jn = require("path").join
// ,   rfs = function (file) { return fs.readFileSync(jn(__dirname, file), "utf8"); }
,   wfs = function (file, content) { return fs.writeFileSync(file, content, "utf8"); }
;

var nm = new Nightmare();
nm.on("callback", function (msg) {
    if (msg.elData) {
        data[msg.elData.name] = {
            role:   msg.elData.role
        ,   attr:   msg.elData.attr
        };
    }
    else if (msg.info) {
        console.log(msg.info);
    }
});
nm.goto("http://www.w3.org/html/wg/drafts/html/master/single-page.html");
nm.evaluate(
    function () {
        window.info = function (str) { window.callPhantom({ info: str }); };
        var forEach = Array.prototype.forEach;
        forEach.call(document.querySelectorAll("dl.element"), function (dl) {
            var h = dl.previousElementSibling
            ,   aria = {};
            if (!/^h\d$/i.test(h.localName)) {
                window.info("Failed to find proper previous element: " + h.textContent);
                return;
            }
            aria.name = h.id;
            forEach.call(dl.querySelectorAll("dt"), function (dt) {
                var dds = []
                ,   nxt = dt.nextElementSibling
                ;
                while (nxt && nxt.localName.toLowerCase() === "dd") {
                    dds.push(nxt.innerHTML);
                    nxt = nxt.nextElementSibling;
                }
                if (/Allowed\s+ARIA\s+role\s+attribute\s+value/i.test(dt.textContent)) aria.role = dds;
                if (/Allowed\s+ARIA\s+State\s+and\s+Property\s+Attribute/i.test(dt.textContent)) aria.attr = dds;
            });
            if (!aria.name || !aria.role || !aria.attr) {
                window.info("Failed to find all fields for element: " + JSON.stringify(aria, null, 4));
                return;
            }
            window.callPhantom({ elData: aria });
        });
        return { ok: true };
    }
,   function (res) {
        if (res.ok) console.log("Processing ok");
        if (res.error) console.error(res.error);
    }
);

nm.run(function (err) {
    if (err) console.error(err);
    wfs(jn(__dirname, "res/steve-data.json"), JSON.stringify(data, null, 4));
    console.log("Ok!");
});
