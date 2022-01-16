/*global assert*/

var rfs = require("../lib/rfs");

exports.name = "fork-table-border";
exports.landscape = "<code><a href='#attr-table-border'>table@border</a></code> is only obsolete in WHATWG HTML.";
exports.transform = function (data) {
    var $dl = assert("Element description in <table>", $("#the-table-element").parent().find("dl.element:first"));

    // border table in obsolete section
    assert("table@border in obsolete section", $("#attr-table-border").parent()).remove();

    // add attribute under the-table-element
    assert("<dd> after 'Content attribute' in <table>",
    $dl.find("dt:contains('Content attributes')")
        .next("dd"))
        .after('<dd><code><a href="#attr-table-border">border</a></code></dd>')
    ;
    
    // add it to IDL
    var $pre = assert("IDL in <table>", $dl.find("pre.idl"));
    $pre.html($pre.html().replace(/};/, '           attribute DOMString <a href="#dom-table-border">border</a>;\n};'));
    
    // § "the border attribute" with dfn
    assert("Second note in <table>",
    $dl.nextAll("p.note:eq(1)")).after(data.note);
    
    // the table right underneath, drop "non-conforming" x2
    var $table = assert("First table in <table>", $("#the-table-element").parent().find("table:first"));
    assert("First table in <table> has rows about non-conforming border",
    $table.find("td:contains('non-conforming border')"), 2)
            .each(function () {
                $(this).html($(this).html().replace(/non-conforming/, ""));
            })
    ;
    
    // add § at the end of #non-conforming-features
    assert("Non-conforming features section",
    $("#non-conforming-features").parent()).append(data.nonconforming);

    // drop from IDL and description in #requirements-for-implementations
    var $idl = assert("HTMLTableElement partial", $("#HTMLTableElement-partial")).parent();
    $idl.html($idl.html().replace(/\s+attribute\s+DOMString\s+[\s\S]+?border[\s\S]+?;\s+/, ""));
    
    // #elements-3 add to table line in table
    assert("Fifth cell in elements table row about <table>",
    $("#elements-3")
        .parent()
        .find("table:first th:contains('table')")
        .parent()
        .find("td:eq(4)"))
        .append(document.createTextNode("; "))
        .append('<code><a href="#attr-table-border">border</a></code>')
    ;
};
exports.params = function () {
    return [{
        note:           rfs("res/the-table-element/note.html")
    ,   nonconforming:  rfs("res/the-table-element/nonconforming.html")
    }];
};
