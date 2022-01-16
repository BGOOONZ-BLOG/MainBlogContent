/*global assert*/

exports.name = "fork-link-types";
exports.landscape = "W3C HTML has no link types: <code>sidebar</code>, <code>external</code>, <code>pingback</code>.";
exports.transform = function () {
    // drop sections: link-type-{sidebar,external,pingback}
    assert("Link type: sidebar", $("#link-type-sidebar")).parent().remove();
    assert("Link type: external", $("#link-type-external")).parent().remove();
    assert("Link type: pingback", $("#link-type-pingback")).parent().remove();

    // drop § about "sidebar" in #following-hyperlinks
    assert("§ about sidebar in Following hyperlinks",
    $("#following-hyperlinks").parent().find("p:contains('sidebar')")).remove();
    
    // table row for each in #linkTypes
    var $tab = assert("Link types table", $("#linkTypes").parent().find("table:first"));
    assert("Row for external in link types table", $tab.find("tr:contains('external'):first")).remove();
    assert("Row for pingback in link types table", $tab.find("tr:contains('pingback'):first")).remove();
    assert("Row for sidebar in link types table", $tab.find("tr:contains('sidebar'):first")).remove();

    // drop p.note in #secondary-browsing-contexts
    $("#secondary-browsing-contexts").parent().find("p.note:first").remove();
};
