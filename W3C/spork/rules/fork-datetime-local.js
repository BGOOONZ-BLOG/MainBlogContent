/*global assert*/

exports.name = "fork-datetime-local";
exports.landscape = "W3C HTML has dropped <code>&lt;input type=datetime-local></code>.";
exports.transform = function () {
    // drop section #local-date-and-time-state-(type=datetime-local)
    assert("datetime-local section", $("#local-date-and-time-state-\\(type\\=datetime-local\\)").parent()).remove();

    // drop row in table #the-input-element
    assert("datetime-local in <input> table",
    $("#the-input-element")
        .parent()
        .find("table:first td:contains('datetime-local')")
        .parent())
        .remove()
    ;
    
    // section #date-and-time-state-(type=datetime) has an example with two § to drop
    assert("datetime-local example in Date and time state",
    $("#date-and-time-state-\\(type\\=datetime\\)")
        .parent()
        .find("div.example p:contains('datetime-local')"), 2)
        .remove()
    ;
    
    // #the-input-element-as-domain-specific-widgets drop from style and § below
    var $css = assert("datetime-local in <input> CSS <pre>",
                $("#the-input-element-as-domain-specific-widgets")
                    .parent()
                    .find("pre.css:first"))
    ;
    $css.html($css.html().replace(/\s+input\[type=datetime-local[\s\S]*?}/));
    assert("datetime-local § in <input> CSS",
    $("#the-input-element-as-domain-specific-widgets")
        .parent()
        .find("p:contains('input-datetime-local')"))
        .remove()
    ;
    
    // #input-type-attr-summary needs a column excised
    assert("datetime-local th in <input> summary",
    $("#input-type-attr-summary")
        .find("thead:first th:eq(7)")).remove().end()
        .find("tbody tr")
        .each(function () {
            if ($(this).find("td").length < 7) return;
            assert("datetime-local cell for each <input> summary row",
            $(this).find("td:eq(6)")).remove();
        })
    ;
    assert("colspan=16 in <input> summary",
    $("#input-type-attr-summary th[colspan=16]"), 3)
        .each(function () {
            $(this).attr("colspan", "15");
        })
    ;
    
    // #implicit-submission:local-date-and-time-state-(type=datetime-local)
    var $mention = $("#implicit-submission\\:local-date-and-time-state-\\(type\\=datetime-local\\)")
    ,   $parent = $mention.parent()
    ;
    assert("Mention in Implicit submission", $mention);
    $mention.remove();
    $parent.html($parent.html().replace(/,\s*,/, ", "));
};
