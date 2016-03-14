function changeUserCardSize(cardID, SmButtonID, LrgButtonID) {

    //document.writeln("test");
    if (document.getElementById(LrgButtonID).disabled == false) {
        document.getElementById(cardID).className = "mdl-cell mdl-cell--12-col";
        document.getElementById(LrgButtonID).disabled = true;
        document.getElementById(SmButtonID).disabled = false;
    }
    else {
        document.getElementById(cardID).className = "mdl-cell mdl-cell--4-col";
        document.getElementById(LrgButtonID).disabled = false;
        document.getElementById(SmButtonID).disabled = true;
    }

    return false;
}