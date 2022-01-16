/*global assert*/

var rfs = require("../lib/rfs");

exports.name = "fork-link-rel-url";
exports.landscape = "URL allowed in <code>link[rel]</code> in W3C HTML " +
                    "(<a href='https://github.com/w3c/html/commit/954203e085e601122a2df38207bfdd6d852a0963'>https://github.com/w3c/html/commit/954203e085e601122a2df38207bfdd6d852a0963</a>).";
exports.transform = function (data) {
    assert("Microdata in extensibility",
    $("#extensibility ~ ul")
            .first()
            .find("li:contains('This is also used by microformats')"))
            .append(document.createTextNode(data.extensibility))
    ;
    var $p = assert("Effects on in Other link types", $("#other-link-types ~ p:contains('\"Effect on...\" field, whereas values')"));
    $p.html($p.html().replace(/"Effect\s+on\.\.\."\sfield[\s\S]*?Conformance\s+checkers\s+may\s+cache\s+this/
                            , data.effect));
    $p.after(data.note);
};
exports.params = function () {
    return [{
        extensibility:  rfs("res/link-rel-url/extensibility.txt")
    ,   effect:         rfs("res/link-rel-url/effect.txt")
    ,   note:           rfs("res/link-rel-url/note.html")
    }];
};
