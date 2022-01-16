/*global assert*/

var rfs = require("../lib/rfs");

exports.name = "fork-blockquote-cite";
exports.landscape = "W3C HTML attributes different semantics to <code><a href='#the-cite-element'>cite</a></code>" +
                    " inside <code><a href='#the-blockquote-element'>blockquote</a></code>.";
exports.transform = function (tmpl) {
    for (var k in tmpl) assert("Section: " + k, $("#" + k).parent()).replaceWith(tmpl[k]);
};
exports.params = function () {
    return [{
        "the-cite-element":         rfs("res/the-cite-element.html")
    ,   "the-blockquote-element":   rfs("res/the-blockquote-element.html")
    }];
};
