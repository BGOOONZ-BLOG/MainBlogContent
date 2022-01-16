/*global assert*/

exports.name = "drop-sections";
exports.landscape = "The sections '<em>Where does this specification fit?</em>', '<em>The 2D rendering context</em>', '<em>Is this HTML5?</em>', " +
                    "'<em>Web workers</em>', '<em>Web storage</em>', '<em>Communication</em>', and '<em>Microdata</em>' are not present in W3C HTML.";
exports.transform = function () {
    window.cacheID($("#2dcontext").parent(),     "http://www.w3.org/html/wg/drafts/2dcontext/master/");
    window.cacheID($("#workers").parent(),       "http://www.w3.org/TR/workers/");
    window.cacheID($("#webstorage").parent(),    "http://www.w3.org/TR/webstorage/");
    // #comms maps to many
    window.cacheID($("#the-messageevent-interfaces").parent(),   "http://www.w3.org/TR/webmessaging/");
    window.cacheID($("#server-sent-events").parent(),            "http://www.w3.org/TR/eventsource/");
    window.cacheID($("#network").parent(),                       "http://www.w3.org/TR/websockets/");
    window.cacheID($("#web-messaging").parent(),                 "http://www.w3.org/TR/webmessaging/");
    window.cacheID($("#channel-messaging").parent(),             "http://www.w3.org/TR/webmessaging/");
    // there's also #broadcasting-to-other-browsing-contexts under #comms, but it's not real ATM
    window.cacheID($("#microdata").parent(),     "http://www.w3.org/TR/microdata/");

    assert("Sections being dropped",
    $("#abstract, #is-this-html5\\?, #2dcontext, #workers, #webstorage, #comms, #microdata").parent(), 7).remove();
    
    // removing the intro text about the spec's structure
    assert("Mentions in Structure of this spec",
    $("#structure-of-this-specification")
        .parent()
        .find("dl:first")
        .find("dt:contains('Microdata'), dt:contains('Web workers'), dt:contains('The communication APIs'), dt:contains('Web storage')"), 4)
        .each(function () {
            var $dt = $(this);
            $dt.next("dd").remove();
            $dt.remove();
        })
    ;
    
    window.info("Removed sections published as separate specifications.");
};
