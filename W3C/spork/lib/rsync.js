
var exec = require("child_process").exec;

exports.rsync = function (config, cb) {
    if (config.rsync) {
        var cmd = "rsync -avze ssh " + config.rsync.local + " " + config.rsync.remote;
        // console.log("Running:", cmd);
        exec(cmd, { maxBuffer: 1000*1024 }, function (err, stdout, stderr) {
            if (err) throw err;
            if (stdout) console.log(stdout);
            if (stderr) console.error(stderr);
            cb();
        });
    }
    else cb();
};
