
var winston = require("winston")
,   logger
,   transports = []
;

exports.getLog = function (conf) {
    if (logger) return logger;
    if (!conf.quiet) {
        transports.push(new (winston.transports.Console)({
                                handleExceptions:   true
                            ,   colorize:           true
                            ,   maxsize:            200000000
                            })
        );
    }
    if (conf.email) {
        require("winston-mail");
        transports.push(new (winston.transports.Mail)(conf.email));
    }
    if (conf.logFile) {
        transports.push(new (winston.transports.File)({
                                filename:           conf.logFile
                            ,   handleExceptions:   true
                            ,   timestamp:          true
                            }));
    }
    logger = new (winston.Logger)({ transports: transports });
    return logger;
};
