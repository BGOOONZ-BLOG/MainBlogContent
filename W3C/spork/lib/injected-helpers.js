window.info = function (str) {
    window.callPhantom({ info: str });
};
window.saveSource = function (file, source) {
    window.callPhantom({ file: file, source: source });
};
window.unplugResources = function () {
    window.callPhantom({ unplug: true });
};
window.escSel = function (sel) {
    return sel.replace(/([ #;?%&,.+*~':\"!^$[\]()=>|\/@])/g,'\\$1');
};
var curRule = '';
var assert = function (desc, $el, num) {
    var report = function () {
        window.callPhantom({
            assert:     desc
        ,   curRule:    curRule
        ,   expected:   num
        ,   got:        $el.length
        });
    };
    if (typeof num === 'undefined') num = 1;
    if (num === '+') {
        if (!$el.length) report();
    }
    else if ($el.length !== num) report();
    return $el;
};
window.danglingID = function (id) {
    window.callPhantom({ dangling: id });
};
