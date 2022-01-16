/*global assert*/

var rfs = require("../lib/rfs");

exports.name = "fork-ruby";
exports.landscape = "W3C HTML has a <a href='#the-ruby-element'>ruby model</a> that matches both users' needs and implementations.";
exports.transform = function (data) {
    // remove from obsolete
    var $objDT = assert("<rb> in obsolete", $("#rb").parent());
    var $objRTC = assert("<rtc> in obsolete", $("#rtc").parent());
    assert("<dd> after #rtc", $objRTC.next("dd")).remove();
    $objRTC.remove();
    $objDT.remove();

    // replace element sections
    [
        "closing-elements-that-have-implied-end-tags"
    ,   "the-rp-element"
    ,   "the-rt-element"
    ,   "the-ruby-element"
    ].forEach(function (sec) { assert("Section " + sec, $("#" + sec).parent()).replaceWith(data[sec]); });
    assert("<ruby>", $("#the-ruby-element").parent()).after(data["the-rb-element"]);
    assert("<rt>", $("#the-rt-element").parent()).after(data["the-rtc-element"]);

    // various changes to the parsing algorithm
    var $og = assert("First <dt> with 'math' in parsing-main-inbody",
                $("#parsing-main-inbody")
                    .parent()
                    .find("dl.switch:first dt:contains('\"math\"'):first"))
    ;
    // remove previous variant
    assert("<dd> before the math <dt>", $og.prev("dd")).remove();
    assert("<dt> before the math <dt>", $og.prev("dt")).remove();
    $og.before(data.stRbRtc);
    $og.before(data.stRbRtcDD);
    $og.before(data.stRtRp);
    $og.before(data.stRtRpDD);

    var $eof = assert("First <dt> with 'end-of-file' in parsing-main-inbody",
                $("#parsing-main-inbody")
                    .parent()
                    .find("dl.switch:first dt:contains('end-of-file'):first"))
    ;
    assert("first ol>li in <dd> after eof", $eof.next("dd").find("ol li:first")).html(data.eof);
    assert("<dt> after eof containing 'body', 'html'", $eof.nextAll("dt:contains('body'):first, dt:contains('html'):first"), 2)
        .each(function () {
            $(this).next("dd").find("p:eq(1)").replaceWith(data.eofOtherwise);
        })
    ;

    // rendering
    var $phrasingCSS = assert("<pre> for phrasing CSS", $("#phrasing-content-3").parent().find("pre.css:first"));
    $phrasingCSS.html($phrasingCSS.html().replace(/ruby[\s\S]+?rt[\s\S]+?\}/, data.css));

    // table of elements
    var $qTR = assert("<tr> with 'Quotation' in elements table", $("#elements-3").parent().find("table:first tr:contains('Quotation')"));
    $qTR.after(data.elRB);
    assert("Third cell with 'ruby' two rows down from 'Quotation' <tr>",
    $qTR
        .next("tr")
        .next("tr") // rp
        .find("td:eq(2) code:contains('ruby')"))
        .after('<code><a href="#the-rtc-element">rtc</a></code>')
        .after(document.createTextNode("; "))
    ;
    var $rtTR = assert("Three rows down from 'Quotation'", $qTR.next("tr").next("tr").next("tr"));
    assert("Third cell with 'ruby' in <rt> row",
    $rtTR
        .find("td:eq(2) code:contains('ruby')"))
        .after('<code><a href="#the-rtc-element">rtc</a></code>')
        .after(document.createTextNode("; "))
    ;
    $rtTR.after(data.elRTC);
    assert("Fourth cell with 'rp' two rows down from <rt> row",
    $rtTR
        .next("tr")
        .next("tr") // ruby
        .find("td:eq(3) code:contains('rp')"))
        .after('<code><a href="#the-rb-element">rb</a></code>')
        .after(document.createTextNode("; "))
        .after('<code><a href="#the-rtc-element">rtc</a></code>')
        .after(document.createTextNode("; "))
    ;

    // table of interfaces
    var $rpTr = assert("Link to <rp> in interfaces table",
                $("#element-interfaces")
                    .parent()
                    .find("table:first a[href='#the-rp-element']"))
                    .parent().parent().parent()
    ;
    $rpTr.before(data.ifRB);
    assert("Row after <rp> in interfaces table", $rpTr.next("tr")).after(data.ifRTC);

    // usage summary
    assert("Row about 'ruby' in usage summary table",
    $("#usage-summary")
        .parent()
        .find("table:first tr:contains('ruby'):first"))
        .replaceWith(data.usage)
    ;

    // optional end tags
    var $ogp = assert("§ about 'optgroup' in optional end tags", $("#optional-tags").parent().find("p:contains('optgroup'):first"));
    assert("§ before 'optgroup' (1)", $ogp.prev("p")).remove();
    assert("§ before 'optgroup' (2)", $ogp.prev("p")).remove();
    $ogp.before(data.optionalRB);
    $ogp.before(data.optionalRT);
    $ogp.before(data.optionalRTC);
    $ogp.before(data.optionalRP);

    // HTMLUnknownElement
    // var $rb = assert("<rb> in other elements, etc.", $("#other-elements\\,-attributes-and-apis\\:rb"))
    // ,   $rbParent = $rb.parent()
    // ;
    // $rb.remove();
    // $rbParent.html($rbParent.html().replace(/,\s+,/, ", "));
};
exports.params = function () {
    return [{
    // sections
        "closing-elements-that-have-implied-end-tags":  rfs("res/ruby/closing-elements-that-have-implied-end-tags.html")
    ,   "the-rb-element":       rfs("res/ruby/the-rb-element.html")
    ,   "the-rp-element":       rfs("res/ruby/the-rp-element.html")
    ,   "the-rt-element":       rfs("res/ruby/the-rt-element.html")
    ,   "the-rtc-element":      rfs("res/ruby/the-rtc-element.html")
    ,   "the-ruby-element":     rfs("res/ruby/the-ruby-element.html")
    // parsing
    ,   stRbRtc:        rfs("res/ruby/st-rb-rtc.html")
    ,   stRbRtcDD:      rfs("res/ruby/st-rb-rtc-dd.html")
    ,   stRtRp:         rfs("res/ruby/st-rt-rp.html")
    ,   stRtRpDD:       rfs("res/ruby/st-rt-rp-dd.html")
    // optional tags
    ,   optionalRB:     rfs("res/ruby/optional-rb.html")
    ,   optionalRT:     rfs("res/ruby/optional-rt.html")
    ,   optionalRTC:    rfs("res/ruby/optional-rtc.html")
    ,   optionalRP:     rfs("res/ruby/optional-rp.html")
    // end-of-file
    ,   eof:            rfs("res/ruby/eof.html")
    ,   eofOtherwise:   rfs("res/ruby/eof-otherwise.html")
    // tables
    ,   usage:          rfs("res/ruby/usage.html")
    ,   ifRB:           rfs("res/ruby/if-rb.html")
    ,   ifRTC:          rfs("res/ruby/if-rtc.html")
    ,   elRB:           rfs("res/ruby/el-rb.html")
    ,   elRTC:          rfs("res/ruby/el-rtc.html")
    // rendering
    ,   css:            rfs("res/ruby/ruby.css")
    }];
};
exports.copy = {
    "ruby/images/composition.png":              "images/composition.png"
,   "ruby/images/group.png":                    "images/group.png"
,   "ruby/images/hokekyou.png":                 "images/hokekyou.png"
,   "ruby/images/group-double.png":             "images/group-double.png"
,   "ruby/images/mono-or-jukugo-double.png":    "images/mono-or-jukugo-double.png"
};
