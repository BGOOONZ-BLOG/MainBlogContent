/*global assert*/

exports.name = "fork-no-ping";
exports.landscape = "The <code>ping</code> attribute is not implemented and does not seem to have a future, it is therefore dropped.";
exports.transform = function () {
    // #dynamic-changes-to-base-urls
    //      drop paragraph that mentions it
    assert("§ on @ping in Dynamic changes",
    $("#dynamic-changes-to-base-urls")
        .parent("section")
        .find("p:contains('If the hyperlink has a ping')"))
        .remove();

    // drop paragraph with the dfn
    assert("@ping dfn §", $("#ping").parent()).remove();

    // HTTP headers
    assert("Ping-From section", $("#ping-from").parent()).remove();
    assert("Ping-To section", $("#ping-to").parent()).remove();

    // paragraph about informing about ping
    assert("Hyperlink auditing in Links, forms...",
    $("#links\\,-forms\\,-and-navigation\\:hyperlink-auditing").parent()).remove();

    // <a> and <area> are quite similar
    var elDesc = function (id) {
            assert("URLs to ping in: " + id, $("#" + id + " + dl.element > dd:contains('URLs to ping')")).remove();
            var $idl = assert("IDL in: " + id, $("#" + id + " + dl.element pre.idl"));
            $idl.html($idl.html().replace(/\[PutForwards[\s\S]*?;\s+/, ""));
        }
    ,   linkList = function (id, removalType) {
            assert("Reference to @ping in: " + id,
            $("#" + id)
                .parent()
                .find("a[href='#ping']"), removalType.length)
                .each(function (idx) {
                    var $a = $(this).parent()
                    ,   $p = $a.parent();
                    if (removalType[idx] === "midlist") {
                        $a.remove();
                        $p.html($p.html().replace(/,\s+,/, ","));
                    }
                    else if (removalType[idx] === "last") {
                        var $prev = assert("<code> before mention of @ping", $a.prevAll("code").first());
                        $a.remove();
                        $p.html($p.html().replace(/,\s+and/, ""));
                        $prev.before(document.createTextNode("and "));
                    }
                })
            ;
        }
    ,   dfn = function (id) {
            var $dfn = assert("ID=" + id, $("#" + id))
            ,   $dfnP = $dfn.parent("p")
            ;
            $dfn.remove();
            $dfnP.html($dfnP.html().replace(/,\s+,/, ","));
        }
    ;
    // <a> element
    //      attr
    //      IDL
    //      listed x3 in paragraphs
    elDesc("the-a-element");
    linkList("the-a-element", ["midlist", "last"]);
    dfn("dom-a-ping");

    // #hyperlink-auditing (drop)
    assert("Hyperlink auditing section", $("#hyperlink-auditing").parent()).remove();

    // <area> element
    //      attr
    //      IDL
    //      listed x3 in paragraphs
    elDesc("the-area-element");
    linkList("the-area-element", ["last", "midlist"]);
    dfn("dom-area-ping");

    // text/ping section (that's its ID)
    assert("text/ping section", $("#text\\/ping").parent()).remove();

    // #elements-3
    //      in table for 'a', 'area'
    assert("@ping as attribute in elements table",
    $("#elements-3")
        .parent()
        .find("table:first a[href='#ping']"), 2)
        .each(function () {
            var $a = $(this).parent()
            ,   $cell = $a.parent()
            ;
            $a.remove();
            $cell.html($cell.html().replace(/;\s+;/, ";"));
        });

    // #attributes-3
    //      in table
    assert("@ping in attributes table", $("#attributes-1 th:contains('ping')").parent()).remove();

    // #mime-types-2
    //      drop from dl
    var $dt = assert("text/ping in MIME types table",
                $("#mime-types-2")
                    .parent("section")
                    .find("dt:contains('text/ping')"))
    ;
    assert("<dd> after text/ping", $dt.next("dd")).remove();
    $dt.remove();
};
