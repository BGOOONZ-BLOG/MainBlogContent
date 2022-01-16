
var fs = require("fs")
,   pth = require("path")
;

module.exports = function (file) { return fs.readFileSync(pth.join(__dirname, "..", file), "utf8"); };

