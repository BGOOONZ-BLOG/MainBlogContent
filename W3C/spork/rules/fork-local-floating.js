/*global assert*/

var rfs = require("../lib/rfs");

exports.name = "fork-local-floating";
exports.landscape = "W3C HTML has “local” date terminology renamed to “<a href='#floating-dates-and-times'>floating</a>”.";
exports.transform = function (data) {
    // #local-dates-and-times has all instances of local replaced with floating
    var $sec = assert("Local dates and times", $("#local-dates-and-times").parent());
    $sec.html($sec.html().replace(/local/g, "floating").replace(/Local/g, "Floating"));

    // append a § stating that floating can also be called <dfn>local</dfn> (for all dfns)
    $sec.append(data.map);
};
exports.params = function () {
    return [{
        map: rfs("res/local-dates-and-times/floating-map.html")
    }];
};
