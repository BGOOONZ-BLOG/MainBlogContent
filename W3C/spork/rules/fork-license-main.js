/*global assert*/

var rfs = require("../lib/rfs");

exports.name = "fork-license-main";
exports.landscape = "W3C HTML has a SHOULD requirement on indication of link type " +
                    "'<a href='#link-type-license'>license</a>' scope in text and a different code example using the main element.";
exports.transform = function (data) {
    assert("1st example in rel=license",
    $("#link-type-license")
        .parent()
        .find("div.example:first")).remove()
    ;
    assert("3rd § in rel=license",
    $("#link-type-license")
        .parent()
        .find("p:eq(2)"))
        .replaceWith(data.main)
    ;
};
exports.params = function () {
    return [{
        main: rfs("res/link-type-license/main.html")
    }];
};
