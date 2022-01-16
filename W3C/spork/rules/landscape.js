/*global assert*/

var rfs = require("../lib/rfs");

module.exports = function (profile) {
    return {
        name:       "landscape"
    ,   landscape:  null
    ,   transform:  function (data) {
            assert("The introduction section",
            $("#introduction").parent())
                .append(data.section);

            assert("The landscape <ul>",
            $("#landscape").parent().find("ul:first"))
                .append(data.LIs);
        }
    ,   params: function () {
            var listItems = "";
            profile.rules.forEach(function (rule) {
                if (!rule.landscape) return;
                listItems += "<li>" + rule.landscape + "</li>\n";
            });
            return [{
                section:    rfs("res/landscape.html")
            ,   LIs:        listItems
            }];
        }
    };
};
