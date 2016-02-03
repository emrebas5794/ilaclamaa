/// <reference path="C:\Users\emine_000\Documents\GitHub\CozumleyenlerIlaclama\CozumleyenlerIlaclama\CozumleyenIlaclama\Scripts/jquery-2.1.4.js" />

Globalize.culture("tr-TR");

var topMenuItems = [];

$(document).on("ajaxError", function (e, jqxhr, ajaxOptions, error) {
    if (jqxhr.status == 460) {
        window.location.href = "http://localhost:14940/Main/Login";
    } 
});

$(document).ready(function () {
    paintTopMenu();
});

$(document).on("click", ".x-li-sub", function (e) {
    $(this).next(".x-li-submenu").slideToggle();
    $(this).children(".m-arrow").toggleClass("fa-chevron-down fa-chevron-up");
});

function paintTopMenu() {
    $.each(topMenuItems, function (i, item) {
        var kutu = $("<div>").addClass("kutu"),
            icon = $("<div>").addClass("t-icon fa " + item.icon),
            capt = $("<div>").addClass("t-caption").text(item.caption)
        capt2 = $("<div>").addClass("t-caption2").text(item.caption2)
        kutu.appendTo(".rightside .topmenu").append(icon).append(capt).append(capt).on("click", item.onclick);
    });
}

$(document).on("click", ".leftmenu li:not(.x-li-sub,.x-li-submenu)", function () {

    window.location = "../../" + $(this).attr("x-target");
});