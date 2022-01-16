/*global assert*/

var rfs = require("../lib/rfs");

exports.name = "fork-alt";
exports.landscape = "W3C HTML has completely different <a href='#alt'>advice for image alternative text</a>.";
exports.transform = function (tmpl) {
    assert("Section: alt", $("#alt").parent()).replaceWith(tmpl.alt);
};
exports.params = function () {
    return [{
        "alt":         rfs("res/alt.html")
    }];
};
exports.copy = {};
("HTML5_Logo.png buttons1.png elo.png heart.png pip.gif shalott.jpg webplatform.png " +
 "altdetails-collapsed.png captcha.png euro.png home.png preview.png table.gif " +
 "altdetails-expanded.png clara.png face_small.png imagemap.png rating.png text.png " +
 "border.png co.gif fancyO.png inkblot1.png robin.png w3c_home.png " +
 "brokenimg.png crocoduck1.png figure1.png logo-with-text.png sale.png warning.png " +
 "browserShare.png crocoduck2.png flowchart.png lola.png search.png webcam1.png")
    .split(" ")
    .forEach(function (it) {
        exports.copy["alt/" + it] = "images/" + it;
    })
;
