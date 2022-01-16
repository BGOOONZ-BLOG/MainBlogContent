/*global assert*/

exports.name = "id";
exports.landscape = null;
exports.transform = function () {
    // check for stray IDs after having remapped known ones
    var seen = {};
    assert("Local references", $("a[href^='#']"), "+")
        .each(function () {
            var $a = $(this)
            ,   id = $a.attr("href");
            if (window.idCache[id]) {
                $a.attr("href", window.idCache[id]);
                return;
            }
            if (seen[id]) return;
            seen[id] = true;
            if (!$("#" + window.escSel(id.replace("#", ""))).length) window.danglingID(id);
        })
    ;
};
