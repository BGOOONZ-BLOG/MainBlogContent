/* jshint -W100 */

var $tbody = $("#data tbody");

$.getJSON("data.json", function (data) {
    $.each(data, function (ref, info) {
        var $tr = $("<tr><th></th></tr>")
                    .addClass(info.type)
                    .addClass(info.stable ? "stable" : "unstable")
                    .find("th")
                        .text(ref)
                    .end()
        ,   $td = $("<td></td>")
        ,   titles = []
        ;
        if (info.urls.length) {
            for (var i = 0, n = info.urls.length; i < n; i++) {
                titles.push("<a href='" + info.urls[i] + "'>" + info.titles[i] + "</a>");
            }
        }
        else {
            titles = info.titles;
        }
        $td.clone()
            .html(titles.join("<br>"))
            .appendTo($tr)
        ;
        $td.clone().text(info.type).addClass("type").appendTo($tr);
        $td.clone().text(info.stable ? "✓" : "☠").addClass("stability").appendTo($tr);
        $td.clone().html(info.notes).appendTo($tr);
        $tbody.append($tr);
    });
    
    // sorting
    $("body").on("click", ".sortable", function (ev) {
        var $th = $(ev.target)
        ,   column = $th.prevAll("th").length
        ,   colVal = function (el) { return $(el).find("td, th")[column].textContent; }
        ,   rows = $tbody.find("tr")
                            .clone()
                            .sort(function (a, b) {
                                if (colVal(a) < colVal(b)) return -1;
                                if (colVal(a) > colVal(b)) return 1;
                                return 0;
                            })
        ;
        $tbody.empty().append(rows);
        $(".sorting").removeClass("sorting").addClass("sortable");
        $th.removeClass("sortable").addClass("sorting");
    });
});

