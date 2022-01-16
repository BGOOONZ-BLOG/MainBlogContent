/*global assert*/

var rfs = require("../lib/rfs");

exports.name = "fork-nav-list";
exports.landscape = "W3C HTML suggests using lists in <code><a href='#the-nav-element'>nav</a></code> elements.";
exports.transform = function (data) {
    assert("1st § of <nav>",
    $("#the-nav-element").parent().find("p:first")).after(data.note);
};
exports.params = function () {
    return [{
        note: rfs("res/the-nav-element/note.html")
    }];
};
