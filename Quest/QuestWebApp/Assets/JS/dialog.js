//Variables
var fab = $(".fab");
var content = $(".cntt-wrapper");
var submit = $("#submit");
var cancel = $("#cancel");
var protect = $(".protect");
var fabIcon = $("svg");

//fab click
fab.on('click', function (event) {
    event.preventDefault();
    protect.css("background", "hsla(0, 100%, 0%, 0.3)");
    fabIcon.css("display", "none");
    fab.addClass('active');
    content.css('display', 'block');
});

//Hide if click outside the fab
$(document).mouseup(function (e) {
    if (!fab.is(e.target) && fab.has(e.target).length === 0) {
        fab.removeClass('active');
        fabIcon.css('display', 'block');
        content.css('display', 'none')
        protect.css('background', 'none')
    }
});

