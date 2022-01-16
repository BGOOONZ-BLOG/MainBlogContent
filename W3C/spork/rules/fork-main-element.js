/*global assert*/

var rfs = require("../lib/rfs");

exports.name = "fork-main-element";
exports.landscape = "W3C HTML has a different definition for the <code><a href='#the-main-element'>main</a></code> element.";
exports.transform = function (data) {
    assert("<main>",
    $("#the-main-element")
        .parent())
        .replaceWith(data.main)
    ;
    // body isn't the main content
    var $p = assert("<p> with 'main' in <body>", $("#the-body-element").parent().find("> p:contains('main'):first"));
    $p.html($p.html().replace("main", ""));
};
exports.params = function () {
    return [{
        main: rfs("res/the-main-element.html")
    }];
};
