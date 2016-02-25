<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUsPage.aspx.cs" Inherits="QuestWebApp.Pages.AboutUsPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About Us</title>


    <!-- Material Design Lite -->
    <script src="https://code.getmdl.io/1.1.1/material.min.js"></script>
    <link rel="stylesheet" href="https://code.getmdl.io/1.1.1/material.indigo-pink.min.css"/>
    <!-- Material Design icon font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons"/>
</head>

    

  <body>
    <div class="mdl-tabs mdl-js-tabs mdl-js-ripple-effect">
      <div class="mdl-tabs__tab-bar">
          <a href="#starks-panel" class="mdl-tabs__tab is-active">Quest Testing Center</a>
          <a href="#lannisters-panel" class="mdl-tabs__tab">RPG Team</a>
      </div>
    
      <div class="mdl-tabs__panel is-active" id="starks-panel" >
        
          <style>
              *{
                 color: 	#606060; 
                  
              }

          .demo-card-wide.mdl-card {
    width: 58%;
    margin: 0 auto;
    margin-top:10%;
  }
  .demo-card-wide > .mdl-card__title {
    height: 50px;
  }

  
  .demo-card-wide > .mdl-card__titleQuest {
    height: 400px;
    background: url('../Assets/Images/quest.png') center / cover;
  }

  .demo-card-wide > .mdl-card__menu {
    color: #fff;
  }
                </style>

                <div class="mdl-card mdl-shadow--3dp demo-card-wide ">
                                    <div class="mdl-card__titleQuest">
                                        
                                    
                            </div>
                    <div class="mdl-card__supporting-text " style="text-align: center">
                        
                        
                        <p style="font-size: 175%;">
                            This is Quest: the testing center made simple.
                        </p>
                    </div>
                    <div style="text-align: right">
                        <br />
                      
                    </div>
                </div>


          <div class="mdl-card mdl-shadow--3dp demo-card-wide ">
                                    <div class="mdl-card__title">
                                        
                                    
                            </div>
                     <div class="mdl-card__supporting-text " style="text-align: center">
                        <i class="material-icons noTest" style="font-size:800%;">phone_iphone</i>
                        <div style="font-size: 150%;  margin-top: 5%">Optimized for mobile devices so you're not bound to the desktop.</div>
                        
                    </div>
                    <div style="text-align: right">
                        <br />
                      
                    </div>
                </div>
          



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