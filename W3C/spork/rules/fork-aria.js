/*global assert*/

var rfs = require("../lib/rfs");

exports.name = "fork-aria";
exports.landscape = "W3C HTML has a completely different <a href='#wai-aria'>ARIA section</a>.";
exports.transform = function (data) {
    assert("#wai-aria",
    $("#wai-aria")
        .parent())
        .replaceWith(data.main)
    ;
};
exports.params = function () {
    return [{
        main: rfs("res/aria/mappings.html")
    }];
};
