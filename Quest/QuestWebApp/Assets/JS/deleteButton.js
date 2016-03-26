//var btn = document.querySelector('.btn');
var btn;

var btnFront,
    btnYes,
    btnNo;

//btnFront.addEventListener('click', function (event) 

function doStuff(event, mySender)
{
    var mx = event.clientX - btn.offsetLeft,
        my = event.clientY - btn.offsetTop;

    var w = btn.offsetWidth,
        h = btn.offsetHeight;

    var directions = [
      { id: 'top', x: w / 2, y: 0 },
      { id: 'right', x: w, y: h / 2 },
      { id: 'bottom', x: w / 2, y: h },
      { id: 'left', x: 0, y: h / 2 }
    ];

    directions.sort(function (a, b) {
        return distance(mx, my, a.x, a.y) - distance(mx, my, b.x, b.y);
    });

    btn.setAttribute('data-direction', directions.shift().id);
    // added for IE compatibility
    btnFront.setAttribute("style", "display: none;");
    btn.classList.add('is-open');

}//);

//btnYes.addEventListener('click', function (event) {
//    btn.classList.remove('is-open');
//});

//btnNo.addEventListener('click', function (event) {
//    btn.classList.remove('is-open');
//});

function distance(x1, y1, x2, y2) {
    var dx = x1 - x2;
    var dy = y1 - y2;
    return Math.sqrt(dx * dx + dy * dy);
}

function setElements(mySender, event)
{
    myEvent = event;
    //mySender.
    //console.log(window.event.target.tag.toString());
    btn = mySender;
    btnFront = btn.querySelector('.btn-front'),
    btnYes = btn.querySelector('.btn-back .yes'),
    btnNo = btn.querySelector('.btn-back .no');

    doStuff(myEvent, mySender);

    btnYes.addEventListener('click', function (event) {
        btn.classList.remove('is-open');
    });

    //btnNo.addEventListener('click', function (event) {
    //    // maybe display of show?
    //    btn.classList.remove('is-open');
    //});
}

function closeBox(mySender, event)
{
    btn = this.parent.parent.parent;
    btn.classList.remove('is-open');

    return false;
}