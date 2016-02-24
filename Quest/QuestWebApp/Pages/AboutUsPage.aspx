<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUsPage.aspx.cs" Inherits="QuestWebApp.Pages.AboutUsPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About Us</title>
</head>>

    <!-- Material Design Lite -->
    <script src="https://code.getmdl.io/1.1.1/material.min.js"></script>
    <link rel="stylesheet" href="https://code.getmdl.io/1.1.1/material.indigo-pink.min.css"/>
    <!-- Material Design icon font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

  <body>
    <div class="mdl-tabs mdl-js-tabs mdl-js-ripple-effect">
      <div class="mdl-tabs__tab-bar">
          <a href="#starks-panel" class="mdl-tabs__tab is-active">Quest Testing Center</a>
          <a href="#lannisters-panel" class="mdl-tabs__tab">RPG Team</a>
      </div>
    
      <div class="mdl-tabs__panel is-active" id="starks-panel">
        <ul>
          <li>Eddard</li>
          <li>Catelyn</li>
          <li>Robb</li>
          <li>Sansa</li>
          <li>Brandon</li>
          <li>Arya</li>
          <li>Rickon</li>
        </ul>
      </div>
      <div class="mdl-tabs__panel" id="lannisters-panel">
        <ul>
          <li>Tywin</li>
          <li>Cersei</li>
          <li>Jamie</li>
          <li>Tyrion</li>
        </ul>
      </div>
      <div class="mdl-tabs__panel" id="targaryens-panel">
        <ul>
          <li>Viserys</li>
          <li>Daenerys</li>
        </ul>
      </div>
    </div>
  </body>
</html>