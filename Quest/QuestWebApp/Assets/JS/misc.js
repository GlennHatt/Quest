function changeUserCardSize(cardID, SmButtonID, LrgButtonID) {

    //document.writeln("test");
    if (document.getElementById(LrgButtonID).disabled == false) {
        document.getElementById(cardID).className = "mdl-cell mdl-cell--12-col";
        document.getElementById(LrgButtonID).disabled = true;
        document.getElementById(SmButtonID).disabled = false;
        //document.getElementById('myTest').focus();
        //getFocused(cardID);
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