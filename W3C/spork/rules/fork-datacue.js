/*global assert*/

var rfs = require("../lib/rfs");

exports.name = "fork-datacue";
exports.landscape = "W3C HTML has <code><a href='#datacue'>DataCue</a></code> in text tracks.";
exports.transform = function (data) {
    // § at end of guidelines-for-exposing-cues-in-various-formats-as-text-track-cues
    assert("Guidelines, etc section",
    $("#guidelines-for-exposing-cues-in-various-formats-as-text-track-cues")
        .parent())
        .append(data.guidelines)
    ;
    
    // inject a complete section before #text-tracks-describing-chapters
    assert("Text tracks etc. section",
    $("#text-tracks-describing-chapters")
        .parent())
        .before(data.datacue)
    ;
    
    // in text-tracks
    assert("Text track rules etc. section",
    $("#text-track-rules-for-extracting-the-chapter-title")
        .parent())
        .before(data.dt)
        .before(data.dd)
    ;
};
exports.params = function () {
    return [{
        datacue:    rfs("res/datacue/datacue.html")
    ,   guidelines: rfs("res/datacue/guidelines.html")
    ,   dt:         rfs("res/datacue/dt.html")
    ,   dd:         rfs("res/datacue/dd.html")
    }];
};
