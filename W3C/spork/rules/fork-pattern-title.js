/*global assert*/

var rfs = require("../lib/rfs");

exports.name = "fork-pattern-title";
exports.landscape = "W3C HTML advises against using solely <code>title</code> to describe <code><a href='#the-pattern-attribute'>pattern</a></code>.";
exports.transform = function (data) {
    assert("First § in the pattern attribute",
    $("#the-pattern-attribute")
        .parent()
        .find("div.example:first"))
        .before(data.warning)
    ;
};
exports.params = function () {
    return [{
        warning: rfs("res/the-pattern-attribute/title-warning.html")
    }];
};
