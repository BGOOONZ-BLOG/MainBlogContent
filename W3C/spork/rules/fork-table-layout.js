/*global assert*/

exports.name = "fork-table-layout";
exports.landscape = "W3C HTML considers that <a href='#the-table-element'>table</a> layout SHOULD NOT be used (instead of MUST NOT).";
exports.transform = function () {
    var $p = assert("§ under <table> talking of 'layout aids'",
                $("#the-table-element")
                    .parent()
                    .find("p:contains('layout aids')"))
    ;
    $p.html($p.html().replace(/must\s+not/, "should not"));
};
