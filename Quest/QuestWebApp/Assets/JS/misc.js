function changeUserCardSize(cardID, SmButtonID, LrgButtonID) {

    //document.writeln("test");
    if (document.getElementById(LrgButtonID).disabled == false) {
        document.getElementById(cardID).className = "mdl-cell mdl-cell--12-col";
        document.getElementById(LrgButtonID).disabled = true;
        document.getElementById(SmButtonID).disabled = false;
        //document.getElementById('myTest').focus();
        //getFocused(cardID);
        // All links must have an ID of the ID of the card + Link
        document.getElementById(cardID + 'Link').click();

    }
    else {
        document.getElementById(cardID).className = "mdl-cell mdl-cell--4-col";
        document.getElementById(LrgButtonID).disabled = false;
        document.getElementById(SmButtonID).disabled = true;
    }

    return false;
}

function getFocused(id)
{
    $(document).ready(function () {
        $("#" + id).focus();
        // document.getElementById("test").focus();
    });

}

// Reset the sizing buttons on page refresh
function pageResetSmall()
{
    for (var i = 0; i < arguments.length; i++) {
        document.getElementById(arguments[i]).disabled = true;
    }
}

function pageResetLarge() {
    for (var i = 0; i < arguments.length; i++) {
        document.getElementById(arguments[i]).disabled = false;
    }
}

function showQuestionCard() {
    document.getElementById('cardQuestionType').setAttribute("display", "none");

    //if (document.getElementById("txtAddWeight")) {
    //div.setAttribute("visibility", "none");
    //}
   
}