/*global assert*/

var rfs = require("../lib/rfs")
,   fs = require("fs")
,   jn = require("path").join
;

exports.name = "references";
exports.landscape = "Unused bibliographical references are dropped; some are changed to match W3C preferences.";
exports.transform = function (data) {
    // drop unused references
    assert("Reference <dt> with IDs",
    $("#ref-list dt[id]"), "+").each(function () {
        var $dt = $(this)
        ,   $dd = $dt.next("dd")
        ,   id = $dt.attr("id")
        ;
        if (!id) return;
        if (!$("a[href='#" + id + "']").length) {
            $dt.remove();
            $dd.remove();
            window.info("Dropping reference " + $dt.text());
        }
    });
    window.info("dropped unused references");
    
    // update or insert new references
    for (var k in data) {
        var id = "refs" + k
        ,   $existing = $("#" + id)
        ;
        if ($existing.length) $existing.next("dd").replaceWith(data[k]);
        else {
            var $anchor
            ,   $dt = $("<dt></dt>").attr("id", id).text("[" + k + "]")
            ;
            $("#ref-list dt").each(function () {
                // get the first that's alpha-higher
                if (this.id > id) {
                    $anchor = $(this);
                    return false;
                }
            });
            if ($anchor.length) $anchor.before($dt).before(data[k]);
            else $("#ref-list").after($dt).after(data[k]);
        }
    }
    window.info("updated and inserted references");
};
exports.params = function () {
    var data = {}
    ,   refsDir = jn(__dirname, "../res/refs")
    ;
    fs.readdirSync(refsDir)
        .forEach(function (file) {
            data[file.replace(".html", "")] = rfs("res/refs/" + file);
        })
    ;
    
    return [data];
};
