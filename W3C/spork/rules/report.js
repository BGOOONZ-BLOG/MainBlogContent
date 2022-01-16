/*globals assert*/

exports.name = "report";
exports.landscape = null;
exports.transform = function (data) {
    var scriptify = function (el) {
        // inject script
        var scr = el.ownerDocument.createElement("script");
        scr.src = "redirection.js";
        $("body", el).append(scr);
    };

    // save single-page
    window.info("Sending single-page to be saved.");
    window.saveSource("single-page.html", "<!DOCTYPE html>\n" + document.documentElement.outerHTML);
    
    // splitting happens here
    var sections = [
            "introduction"
        ,   "infrastructure"
        ,   "dom"
        ,   "semantics"
        ,   "editing"
        ,   "browsers"
        ,   "webappapis"
        ,   "syntax"
        ,   "the-xhtml-syntax"
        ,   "rendering"
        ,   "obsolete"
        ,   "iana"
        ,   "index"
        ,   "references"
        ,   "acknowledgments"
        ]
    ,   idMap = {}
    ;
    
    // rewrite all links
    sections.forEach(function (sec) {
        assert("Section " + sec, 
        $("#" + sec)
            .parent())
            .find("[id]")
            .each(function () {
                idMap["#" + $(this).attr("id")] = sec;
            })
        ;
    });
    window.callPhantom({ idMap: idMap });
    assert("Links to IDs",
    $("a[href^=#]"), "+").each(function () {
        var $a = $(this)
        ,   id = $a.attr("href")
        ;
        if ($a.parents(".brief.toc").length) return; // don't rewrite the top ToC
        $a.attr("href", idMap[id] + ".html" + id);
    });
    
    // save Overview
    var doc = document.documentElement.cloneNode(true);
    $("#contents", doc).parent().nextAll("section").remove();
    scriptify(doc);
    window.info("Sending Overview to be saved.");
    window.saveSource("Overview.html", "<!DOCTYPE html>\n" + doc.outerHTML);

    
    // process all sections
    sections.forEach(function (sec, idx) {
        var doc = document.documentElement.cloneNode(true)
        ,   $h = assert("Section " + sec, $("#" + sec, doc))
        ,   $sec = $h.parent()
        ;
        
        // add lateral navigation plus link up to Toc (at bottom too)
        var $nav = $("<nav class='prev_next'><a href='Overview.html#contents'>Table of contents</a></nav>", doc);
        if (idx !== 0) {
            $nav.prepend(" — ");
            $("#toc-" + sections[idx - 1], doc)
                .find("a:first")
                .clone()
                .prepend("← ")
                .prependTo($nav)
            ;
        }
        if (idx !== sections.length - 1) {
            $nav.append(" — ");
            $("#toc-" + sections[idx + 1], doc)
                .find("a:first")
                .clone()
                .append(" →")
                .appendTo($nav)
            ;
        }
        
        // keep only that section and ToC part
        $sec.prevAll("section").each(function () {
            var $s = $(this);
            if ($s.find("#contents").length) {
                var $li = assert("Toc group for " + sec, $s.find("#toc-" + sec));
                $li.prevAll("li").remove();
                $li.nextAll("li").remove();
                $s.find("#contents").text("Table of Contents");
                return;
            }
            $s.remove();
        });
        $sec.nextAll("section").remove();
        
        // drop all headers after the subtitle
        assert("Parts of div.head not the title", $("div.head > :not(header)", doc), 2).remove();
        
        // set the title to the section title + the spec title
        assert("There's a title", $("title", doc)).text($h.text() + " | " + data.title);
        
        // inject nav
        $("#contents", doc).parent().before($nav);
        $("body", doc).append($nav.clone());
        
        scriptify(doc);
        
        // save!
        window.info("Sending " + sec + " to be saved.");
        window.saveSource(sec + ".html", "<!DOCTYPE html>\n" + doc.outerHTML);
    });
};
exports.params = function (conf) {
    return [{
        title:  conf.title || ""
    }];
};
