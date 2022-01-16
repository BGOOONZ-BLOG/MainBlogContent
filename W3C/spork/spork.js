#!/usr/bin/env node
/*jshint -W054 */

var Nightmare = require("nightmare")
,   phantomjs = require("phantomjs")
,   fs = require("fs-extra")
,   pth = require("path")
,   jn = pth.join
,   rfs = function (file) { return fs.readFileSync(jn(__dirname, file), "utf8"); }
,   wfs = function (file, content) { return fs.writeFileSync(file, content, "utf8"); }
,   spawn = require("child_process").spawn
;

function run (profile, config, reporter) {
    var processResources = true
    ,   logger = require("./lib/logger").getLog(config)
    ,   copy = {}
    ,   fails = {}
    ,   dangles = []
    ,   specFiles = [] // the first one gets to be the index
    ,   otherFiles = []
    ,   die = function (str) {
            // XXX here is where reporting takes place if needed
            logger.error(str);
            process.exit(1);
        }
    ,   hasFailure = function () {
            return Object.keys(fails).length || dangles.length;
        }
    ;
    logger.info("Loading " + profile.url);
    
    // building up the injection script
    var sporkCode = "";
    sporkCode += rfs("node_modules/jquery/dist/jquery.js") + "\n";
    // Phantom doesn't support new URL(), Rodney to the rescue!
    sporkCode += rfs("node_modules/URIjs/src/URI.js") + "\n";
    sporkCode += "try {\n";
    sporkCode += rfs("lib/injected-helpers.js") + "\n";
                 
    
    profile.rules.forEach(function (rule) {
        sporkCode += "window.info('~~~~~~~~~~~ " + rule.name + " ~~~~~~~~~~');\n";
        if (rule.transform) {
            sporkCode += "curRule = '" + rule.name + "';\n";
            sporkCode += "(";
            sporkCode += rule.transform.toString();
            sporkCode += ")(";
            if (rule.params) {
                sporkCode += rule.params(profile.configuration)
                                .map(function (prm) {
                                    return JSON.stringify(prm, null, 4);
                                })
                                .join(", ")
                ;
            }
            sporkCode += ");\n";
        }
        if (rule.landscape) sporkCode += "window.info(\"" + rule.landscape + "\");\n";
        sporkCode += "window.info('___________ /" + rule.name + " ___________');\n";
        if (rule.copy) for (var k in rule.copy) copy[k] = rule.copy[k];
    });
    sporkCode += "return { ok: true };\n";
    sporkCode += "} catch (e) { return { error: e }; }\n";
    
    var nm = new Nightmare({
        cookieFile:     jn(__dirname, "data/cookies.txt")
    ,   phantomPath:    pth.dirname(phantomjs.path) + "/"
    });
    nm.on("callback", function (msg) {
        if (msg.info) logger.info(msg.info);
        else if (msg.dangling) dangles.push(msg.dangling);
        else if (msg.assert) {
            logger.warn("Assertion failed in " + msg.curRule + ": " + msg.assert);
            if (!fails[msg.curRule]) fails[msg.curRule] = [];
            fails[msg.curRule].push(msg);
        }
        else if (msg.source) {
            if (hasFailure()) return logger.warn("There are errors, not saving despite request.");
            logger.info("Saving source for " + msg.file);
            if (msg.file === "Overview.html") specFiles.unshift("Overview.html");
            else specFiles.push(msg.file);
            wfs(jn(config.outDir, msg.file), msg.source);
        }
        else if (msg.unplug) processResources = false;
        else if (msg.idMap) {
            var idMap = msg.idMap
            ,   data = {}
            ,   dir = jn(config.outDir, "id-maps")
            ,   key = function (str) { return str.replace(/^#/, "").substr(0, 5).replace(/\W/g, "_"); }
            ;
            for (var k in idMap) {
                var file = key(k);
                if (!data[file]) data[file] = {};
                data[file][k] = idMap[k];
            }
            fs.mkdirp(dir, function (err) {
                if (err) throw err;
                for (var k in data) wfs(jn(dir, k + ".json"), JSON.stringify(data[k]));
            });
        }
    });
    if (profile.resources) nm.on("resourceRequested", function (res) {
        if (processResources) profile.resources(res);
    });
    nm.goto(profile.url);
    // wfs(jn(__dirname, "debug-script.js"), sporkCode);
    nm.evaluate(
        new Function(sporkCode)
    ,   function (res) {
            if (res.ok) logger.info("Injection ok");
            if (res.error) logger.error(res.error);
        }
    );
    
    var done = function () {
            if (Object.keys(fails).length) {
                var str = ["There were assertion errors during processing."];
                for (var k in fails) {
                    str.push("Rule " + k + ":");
                    fails[k].forEach(function (msg) {
                                str.push("\t" + msg.assert +
                                         " (Expected " + msg.expected +
                                         ", got " + msg.got + ")");
                            });
                }
                logger.error(str.join("\n"));
                reporter("[spork] Assertion errors", str.join("\n"));
            }
            if (dangles.length) {
                logger.error("Dangling IDs:\n" + dangles.map(function (id) { return "\t" + id; }).join("\n"));
                reporter("[spork] Dangling IDs", dangles.map(function (id) { return "  • " + id; }).join("\n"));
            }
            else {
                if (profile.finalise) {
                    profile.finalise(
                        config
                    ,   specFiles
                    ,   otherFiles
                    ,   reporter
                    );
                }
                else reporter();
            }
        }
    ;
    
    nm.run(function (err) {
        if (err) die(err);
        // don't bother downloading if we have failures
        if (hasFailure()) return done();
        logger.info("There are " + Object.keys(profile.configuration.downloads).length + " items to download");
        var curlFile = Object.keys(profile.configuration.downloads) // XXX here we could filter out resource we have
                        .map(function (it) {
                            otherFiles.push(profile.configuration.downloads[it]);
                            return  'url = "' + it + '"\n' +
                                    'output = "' + jn(config.outDir, profile.configuration.downloads[it]) + '"\n' +
                                    'create-dirs';
                        }).join("\n\n")
        ;
        // change the second and third "pipe" to 1, 2 to get stdout/stderr back out to the console
        if (curlFile) {
            var curl = spawn("curl", ["-L", "--config", "-"], { stdio: ["pipe", "pipe", "pipe"] });
            curl.stdin.end(curlFile);
            curl.on("exit", function () {
                logger.info("Copying");
                for (var k in copy) {
                    otherFiles.push(copy[k]);
                    fs.copySync(jn(__dirname, "res", k), jn(config.outDir, copy[k]));
                }
                // curl creates directories with minimal permissions
                var chmod = spawn("find", [config.outDir, "-type", "d", "-exec", "chmod", "755", "{}", "+"]);
                chmod.on("exit", done);
            });
        }
        else done();
    });
}

exports.run = function (profile, config, reporter) {
    if (profile.setup) {
        profile.setup(function (err) {
            if (err) throw(err);
            run(profile, config, reporter);
        });
    }
    else return run(profile, config, reporter);
};

// running directly
if (!module.parent) {
    var profile = process.argv[2]
    ,   config = process.argv[3]
    ;
    if (!profile || !config) console.error("Usage: spork profile config");
    try         {
        profile = require("./profiles/" + profile);
        config = require(config);
    }
    catch (e)   {
        console.error("Profile or configuration failed to load.\n" + e);
        process.exit(1);
    }
    exports.run(profile, config, function (str) {
        if (str) console.error("[REPORTER]", str);
        else console.log("Ok!");
    });
}
