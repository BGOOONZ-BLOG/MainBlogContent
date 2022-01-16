/*global assert*/

var rfs = require("../lib/rfs");

exports.name = "aria-steve";
exports.landscape = "Extra information concerning ARIA is added to every single element summary.";
exports.transform = function (data) {
    assert("Checking number of elements matches expectations", $("dl.element"), Object.keys(data).length);
    for (var k in data) {
        var $lastDT = $("#" + window.escSel(k)).parent()
                                .find("dl.element")
                                .find("dt")
                                .last()
        ;
        if (!$lastDT.length) {
            window.info("No DL found for " + k);
            return;
        }
        $lastDT.before("<dt>Allowed <a href='#aria-role-attribute'>ARIA role attribute</a> values:</dt>");
        data[k].role.forEach(function (it) { $lastDT.before($("<dd></dd>").html(it)); });
        $lastDT.before("<dt>Allowed <a href='#state-and-property-attributes'>ARIA State and Property Attributes</a>:</dt>");
        data[k].attr.forEach(function (it) { $lastDT.before($("<dd></dd>").html(it)); });
    }
    window.info("Injected all ARIA information into elements. Thanks Steve!");
};
exports.params = function () {
    return [JSON.parse(rfs("res/steve-data.json"))];
};
