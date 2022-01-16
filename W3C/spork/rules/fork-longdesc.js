/*global assert*/

exports.name = "fork-longdesc";
exports.landscape = "W3C HTML does not consider <code><a href='#attr-img-longdesc'></a>longdesc</code> to be obsolete.";
exports.transform = function () {
    // remove from obsolete
    var $ldDT = assert("img@longdesc", $("#attr-img-longdesc").parent())
    ,   $dd = assert("<dd> after img@longdesc", $ldDT.next("dd"))
    ;
    $dd.html($dd.html().replace(/,[\s\S]+\./, "."));
    $ldDT.remove();
};
