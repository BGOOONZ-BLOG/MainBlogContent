
var fs = require("fs")
,   jn = require("path").join
,   rsync = require("../lib/rsync")
;

module.exports = require("./html");
module.exports.name = "HTML-WD";
module.exports.configuration.title = "HTML 5.1";
module.exports.configuration.specStatus = "WD";

module.exports.finalise = function (config, specFiles, otherFiles, cb) {
    var content = specFiles.join("\n") + "\n" + otherFiles.map(function (it) { return it.replace(/^\//, ""); }).join("\n") + "\n";
    fs.writeFileSync(jn(config.outDir, "manifest.txt"), content, "utf8");
    rsync.rsync(config, cb);
};
