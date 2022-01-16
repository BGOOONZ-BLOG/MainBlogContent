/*global assert*/

var rfs = require("../lib/rfs");

exports.name = "fork-header";
exports.landscape = "W3C HTML has different representations for <code><a href='#the-header-element'>header</a></code> elements.";
exports.transform = function (data) {
    assert("1st § in <header>",
    $("#the-header-element")
        .parent()
        .find("> p:first"))
        .replaceWith(data.header)
    ;
};
exports.params = function () {
    return [{
        header: rfs("res/the-header-element/header.html")
    }];
};
