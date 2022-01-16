/*global assert*/

var rfs = require("../lib/rfs");

exports.name = "fork-links-in-labels";
exports.landscape = "W3C HTML warns against links in <a href='#the-label-element'>labels</a>";
exports.transform = function (tmpl) {
    assert("1st example for <label>",
    $("#the-label-element")
        .parent()
        .find("div.example:first"))
        .after(tmpl.links)
    ;
};
exports.params = function () {
    return [{
        links: rfs("res/the-label-element/links-in-labels.html")
    }];
};
