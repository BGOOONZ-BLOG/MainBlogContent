/*global assert*/

var rfs = require("../lib/rfs");

exports.name = "fork-tz-warning";
exports.landscape = "W3C HTML has an “health note” about conversions to/from incremental time in the" +
                    " <a href='#global-dates-and-times'>Global dates and times</a> section.";
exports.transform = function (data) {
    assert("Valid normalised forced UTC... section",
    $("#valid-normalised-forced-utc-global-date-and-time-string"))
        .parent()
        .before(data.warning)
    ;
};
exports.params = function () {
    return [{
        warning: rfs("res/global-dates-and-times/tz-warning.html")
    }];
};
