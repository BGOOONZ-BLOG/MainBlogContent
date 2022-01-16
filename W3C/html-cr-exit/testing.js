
(function ($) {
    var data = {}
    ,   base = "http://www.w3.org/html/wg/drafts/html/CR/"
    ;
    function loadData (cb) {
        var sources = "toc atrisk needs priority numbers files informative reviewed".split(" ")
        ,   done = 0;
        $.each(sources, function (idx, src) {
            $.getJSON(src + ".json", function (json) {
                data[src] = json;
                done++;
                if (done === sources.length) cb();
            });
        });
    }
    function render (list, $ol, atrisk, needsTests, topPriority, nonNormative, reviewedItem) {
        $.each(list, function (idx, item) {
            var risk = data.atrisk[item.id] || atrisk
            ,   needs = data.needs[item.id] || needsTests
            ,   priority = data.priority[item.id] || topPriority
            ,   informative = data.informative[item.id] || nonNormative
            ,   reviewed = data.reviewed[item.id] || reviewedItem
            ,   number = data.numbers[item.id] || null
            ,   files = data.files[item.id] || null
            ,   $li = $("<li><a></a></li>")
                        .find("a")
                            .attr({
                                href:   base + "#" + item.id
                            ,   target: "_blank"
                            })
                            .text(item.title)
                        .end()
                        .appendTo($ol)
                        ;
            if (priority && informative) priority = false;
            if (needs && informative) needs = false;
            if (risk) {
                $li.addClass("risk");
                $("<span class='risk'>at risk</span>").appendTo($li);
            }
            if (needs) {
                $li.addClass("needs");
                $("<span class='needs'>needs testing</span>").appendTo($li);
            }
            if (priority) {
                $li.addClass("priority");
                $("<span class='priority'>priority</span>").appendTo($li);
            }
            if (informative) {
                $li.addClass("informative");
                $("<span class='informative'>informative</span>").appendTo($li);
            }
            if (reviewed) {
                $li.addClass("reviewed");
                $("<span class='reviewed'>✔</span>").appendTo($li);
            }
            var testStr = null;
            if (number !== null && files === null) testStr = number + " tests";
            if (number === null && files !== null) testStr = files + " test files";
            if (number !== null && files !== null)
                testStr = number + " tests in " + files + " files";
            if (testStr !== null) {
                $("<span class='number'></span>").text(testStr).appendTo($li);
            }
            if (!risk && !needs && !priority && !informative) {
                $li.addClass("ok");
            }
            if (item.children) {
                var $newOl = $("<ol></ol>").appendTo($li);
                render(item.children, $newOl, risk, needs, topPriority, informative, reviewed);
            }
        });
    }
    function renderToC () {
        render(data.toc, $("#toc"), false, false, false, false, false);
        filter();
    }
    function filter () {
        var $fil = $("#filter")
        ,   $els = $("#toc")
                    .find(".reviewed > a, .reviewed > span, .ok > a, .ok > span, .informative > a, .informative > span")
        ;
        if ($fil.is(":checked")) $els.hide();
        else $els.show();
    }
    $(function () {
        loadData(renderToC);
        $("#filter").change(filter);
    });
}(jQuery));
