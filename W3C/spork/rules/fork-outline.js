/*global assert*/

var rfs = require("../lib/rfs");

exports.name = "fork-outline";
exports.landscape = "W3C HTML features a warning about the <a href='#outlines'>outline algorithm</a>'s actual usability.";
exports.transform = function (data) {
    assert("Creating an outline",
    $("#outlines")
        .parent())
        .prepend(data.warning)
    ;
};
exports.params = function () {
    return [{
        warning:    rfs("res/outline-warning.html")
    }];
};
