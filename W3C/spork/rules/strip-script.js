/*global assert*/

exports.name = "strip-script";
exports.landscape = null;
exports.transform = function () {
    // remove some interactive parts we don't need
    assert("Interactive parts", $("#alert, div.status, #updatesStatus"), "+").remove();

    $("script, link[rel='stylesheet'], link[rel='icon'], style").remove();
    window.info("removed all script and style elements");

    // remove on*
    var res = document.evaluate("//*[@*[starts-with(local-name(), 'on')]]", document, null, 7, null);
    for (var i = 0, n = res.snapshotLength; i < n; i++) {
        var el = res.snapshotItem(i)
        ,   attrs = el.attributes
        ;
        for (var i = 0, n = attrs.length; i < n; i++) {
            if (!attrs[i]) continue;
            var att = attrs[i].name.toLowerCase();
            if (att.indexOf("on") === 0) {
                el.removeAttribute(att);
            }
        }
    }
    
    // convert object to img (it's all SVG)
    $("object").each(function () {
        var $obj = $(this);
        $obj.empty();
        $obj.replaceWith($("<img>").attr({
            width:  $obj.attr("width")
        ,   height: $obj.attr("height")
        ,   src:    $obj.attr("data")
        }));
    });
    
    // the slow version in case XPath doesn't work
    // $("*").each(function () {
    //     var attrs = this.attributes;
    //     for (var i = 0, n = attrs.length; i < n; i++) {
    //         if (!attrs[i]) continue;
    //         var att = attrs[i].name.toLowerCase();
    //         if (att.indexOf("on") === 0) this.removeAttribute(att);
    //     }
    // });
    window.info("removed all on* attributes");
};
