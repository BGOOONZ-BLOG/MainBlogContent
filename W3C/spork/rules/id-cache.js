
exports.name = "id-cache";
exports.landscape = null;
exports.transform = function () {
    window.idCache = {
        // bugs that don't resolve in the WHATWG spec
        "#webvtt":              "#refsWEBVTT"
        // this is fictitious but should be blacklisted anyway so we refer to WHATWG HTML for it
    ,   "#text/ping":   "https://html.spec.whatwg.org/#text/ping"
        // revisit when this has implementations
    ,   "#broadcastchannel":    "https://html.spec.whatwg.org/#broadcastchannel"
        // go see the extension spec
    ,   "#attr-img-longdesc":   "http://www.w3.org/TR/html-longdesc/#longdesc"
        // lots of references to Microdata
    ,   "#names:-the-itemprop-attribute":   "http://www.w3.org/TR/microdata/#attr-itemprop"
    };
    window.cacheID = function ($el, url) {
        $el.each(function () {
            $(this)
                .find("[id]")
                .each(function () {
                    var id = "#" + $(this).attr("id");
                    if (/:/.test(id)) return;
                    window.idCache[id] = url + id;
                });
        });
    };
};
