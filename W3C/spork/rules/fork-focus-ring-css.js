/*global assert*/

var rfs = require("../lib/rfs");

exports.name = "fork-focus-ring-css";
exports.landscape = "W3C HTML does not recommend using CSS to hide the <a href='#focus-management-apis'>focus ring</a>.";
exports.transform = function (data) {
    assert("Blur example in Focus management",
    $("#focus-management-apis")
        .parent()
        .find("dl.domintro:first dt:contains('blur')")
        .next("dd")
        .find("div.example")).remove().end()
        .find("p:last")
        .replaceWith(data.hide)
    ;
};
exports.params = function () {
    return [{
        hide: rfs("res/focus-management-apis/hide-css.html")
    }];
};
