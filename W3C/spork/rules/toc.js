/*global assert*/

exports.name = "toc";
exports.landscape = null;
exports.transform = function () {
    var numStack = [0]
    ,   $fullToC = $("<ol class='brief toc'></ol>")
    ,   $toc = $("<ol class='toc'></ol>")
    ,   tocStack = [$toc] // managed as a reverse stack shift/unshift
    ;
    $("section").each(function () {
        var $s = $(this)
        ,   $hn = assert("Section heading", $s.children("h2, h3, h4, h5, h6").first())
        ,   id = $hn.attr("id")
        ,   depth = $s.parents("section").length
        ,   noNum = $hn.hasClass("no-num")
        ,   noToC = $hn.hasClass("no-toc")
        ;
        if (noToC) return;
        if (depth + 1 > numStack.length) {
            var $ol = $("<ol></ol>");
            tocStack[0].find("li").last().append($ol);
            tocStack.unshift($ol);
            numStack.push(0);
        }
        else if (depth + 1 < numStack.length) {
            while (tocStack.length > depth + 1) tocStack.shift();
            numStack.length = depth + 1;
        }
        numStack[depth]++;
        if (!noNum) {
            var newNum = numStack.join(".") + " ";
            if (/^\s*?(?:[0-9]+\.)*[0-9]+\s+/.test($hn.html())) {
                $hn.html(
                    $hn.html().replace(/^\s*?(?:[0-9]+\.)*[0-9]+\s+/, newNum)
                );
            }
            else {
                $hn.html(newNum + $hn.html());
            }
        }
        // remove <a> and <dfn> from inside headers
        var $hnClone = $hn.clone();
        $hnClone.find("a, dfn").each(function () {
            var $el = $(this);
            $el.replaceWith($el.contents());
        });
        $hnClone.find("[id]").each(function () {
            $(this).removeAttr("id");
        });
        var $li = $("<li><a></a></li>")
                    .find("a")
                        .attr("href", "#" + id)
                    .html($hnClone.html())
                    .end()
                    .appendTo(tocStack[0]);
        if (depth === 0) {
            $("<li><a></a></li>")
                .find("a")
                    .attr("href", "#toc-" + id)
                    .html($hnClone.html())
                .end()
                .appendTo($fullToC);
            $li.attr("id", "toc-" + id);
        }
    });
    assert("Brief ToC", $("ol.brief.toc").first()).replaceWith($fullToC);
    assert("Long ToC", $("ol.toc").not(".brief").first()).replaceWith($toc);

    // fix titles
    assert("Heading for brief ToC", $("#table-of-contents")).text("Table of Contents");
    assert("Heading for long ToC", $("#contents")).text("Full Table of Contents");

    window.info("updated ToC");
};
