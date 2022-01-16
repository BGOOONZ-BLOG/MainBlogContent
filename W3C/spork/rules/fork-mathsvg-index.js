/*global assert*/

var rfs = require("../lib/rfs");

exports.name = "fork-mathsvg-index";
exports.landscape = "Add math and svg elements in the element index";
exports.transform = function (data) {
    assert("mark",
      $("#elements-3\\:the-mark-element")).parent().parent()
      .after(data.math);
    assert("sup",
      $("#elements-3\\:the-sub-and-sup-elements-2")).parent().parent()
      .after(data.svg);
};
exports.params = function () {
    return [{
        math: rfs("res/math-element-index.html"),
        svg: rfs("res/svg-element-index.html")
    }];
};
