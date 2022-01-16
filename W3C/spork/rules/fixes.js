/*global assert*/

exports.name = "fixes";
exports.landscape = null;
exports.transform = function () {
    assert("Parsing overview image", $("img[src$='parsing-model-overview.svg']"))
        .attr("alt", "An overview of the parsing model.")
    ;
    var $if = assert("Silly embedded HTML", $("iframe[src^='data:text/html']"));
    $if.attr("src", $if.attr("src").replace(/\"/g, "%22"));
};
