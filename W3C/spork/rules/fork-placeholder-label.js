/*global assert*/

var rfs = require("../lib/rfs");

exports.name = "fork-placeholder-label";
exports.landscape = "W3C HTML warns more strongly about using <code><a href='#the-placeholder-attribute'>placeholder</a></code> for labelling.";
exports.transform = function (data) {
    assert("Second § in the placeholder attribute",
    $("#the-placeholder-attribute")
        .parent()
        .find("p:eq(1)"))
        .replaceWith(data.warning)
    ;
};
exports.params = function () {
    return [{
        warning: rfs("res/the-placeholder-attribute/label-warning.html")
    }];
};
