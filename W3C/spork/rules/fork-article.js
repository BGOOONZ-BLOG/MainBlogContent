/*global assert*/

var rfs = require("../lib/rfs");

exports.name = "fork-article";
exports.landscape = "W3C HTML indicates that <a href='#the-article-element'>articles</a> should have a heading.";
exports.transform = function (data) {
    assert("§1 in <article>",
    $("#the-article-element")
        .parent()
        .find("p:first"))
        .append(data.sentence)
    ;
};
exports.params = function () {
    return [{
        sentence:    rfs("res/article-heading.html")
    }];
};
