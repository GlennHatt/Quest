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

  <body  >


    <div class="mdl-tabs mdl-js-tabs mdl-js-ripple-effect">
      <div class="mdl-tabs__tab-bar">
          <a href="#starks-panel" class="mdl-tabs__tab is-active">Quest Testing Center</a>
          <a href="#lannisters-panel" class="mdl-tabs__tab">R.P.G. Team</a>
      </div>
    
        <!-- Quest panel -->
      <div class="mdl-tabs__panel is-active" id="starks-panel" style=" background-image: url('../Assets/Images/mountains.jpg'); background-position: center;
   background-size: cover;
   background-repeat: no-repeat;
   background-attachment:fixed; margin-top: -10%;" >
        
          <style>
              *{
                 color: 	#606060; 
                  
              }

          .demo-card-wide.mdl-card {
    width: 58%;
    margin: 0 auto;
    margin-top:10%;
  }
          
    .featureCard {
    width: 25%;
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

    .demo-card-wide > .mdl-card__RPG {
    height: 400px;


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

          <div>
          <!-- Mobile card -->
          <div class="mdl-card mdl-shadow--3dp  featureCard">
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
          <!-- Mobile card -->
          <div class="mdl-card mdl-shadow--3dp  featureCard">
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
          
      </div>


        <!-- RPG Panel -->
      <div class="mdl-tabs__panel" id="lannisters-panel" class="mdl-tabs__panel is-active" id="starks-panel" style=" 
          background: 
    linear-gradient(
      rgba(255, 255, 255, 0.2), 
      rgba(255, 255, 255, 0.2)
    ),
    /* bottom, image */
    url(../Assets/Images/mountainwoods.jpg);
    /*background-image: url('../Assets/Images/mountainwoods.jpg');*/ background-position: center;
   background-size: cover;
   background-repeat: no-repeat;
   background-attachment:fixed; margin-top: -10%;">
           <div class="mdl-card mdl-shadow--3dp demo-card-wide ">
                                    <div class="mdl-card__RPG">        
                            
                    <div class="mdl-card__supporting-text " style="text-align: center">
                        <img src="../Assets/Images/transparent%20-%20Copy.png" style="height:300px; width:300px" />
                        <p style="font-size: 175%;">
                            R.P.G. (Royal Programming Gentleman)
                        </p>

                    </div>
                    </div>
                </div>
          <br />

           <div class="mdl-card mdl-shadow--3dp demo-card-wide ">
                                    <div class="mdl-card__RPGInfo">        
                            
                    <div class="mdl-card__supporting-text " style="text-align: center">
                        <br />
                        <br />
                        <p style="font-size: 175%;">
                           R.P.G. was founded in 2016. This group of gentleman have been hand-picked to create an online testing center.   
                        </p>

                    </div>
                    </div>
                </div>
          <br />

          <div class="mdl-card mdl-shadow--3dp demo-card-wide ">
                                    <div class="mdl-card__Glenn">        
                            
                    <div class="mdl-card__supporting-text" style="width: 78% ">
                        <img src="../Assets/Images/glenn.jpg" style="height:300px; width:300px"/>
                        <div style="font-size: 175%; float:right">
                            <div style="font-size: 175%; float:left"> <u>Glenn Hatt</u></div> 
                            <br />
                            <ul style="font-size:100%">
                            <li>Project Manager</li>
                            <li>Enjoys long walks on the beach</li>
                            <li>Database Expert</li>
                            <li>Part-time Youth Pastor</li>
                            <li>Part-time Barbie dress designer</li>
                            </ul>
                        </div>

                    </div>
                    </div>
                </div>
          <br />

                    <div class="mdl-card mdl-shadow--3dp demo-card-wide ">
                                    <div class="mdl-card__Ryan">        
                            
                    <div class="mdl-card__supporting-text" style="width: 75% ">
                        <img src="../Assets/Images/Ryan.jpg" style="height:300px; width:300px"/>
                        <div style="font-size: 175%; float:right">
                            <div style="font-size: 175%; float:left"><u>Ryan Carroll</u></div> 
                            <br />
                            <ul style="font-size:100%">
                            <li>Assistant Project Manager</li>
                            <li>Design Expert</li>
                            <li>A+ Certified</li>
                            <li>Drinks 3 gallons of water a day</li>
                            <li>Weekend bingo manager</li>
                            </ul>
                        </div>
                    </div>
                    </div>
                </div>
          <br />
          
           <div class="mdl-card mdl-shadow--3dp demo-card-wide ">
                                    <div class="mdl-card__Jesse">        
                            
                    <div class="mdl-card__supporting-text " style="width: 78% ">
                        <img src="../Assets/Images/Jesse.jpg" style="height:300px; width:300px"/>
                        <div style="font-size: 175%; float:right">
                            <div style="font-size: 175%; float:left"><u>Jesse Upchurch</u></div>
                            <br />
                            <ul style="font-size:100%">
                            <li>Secretary</li>
                            <li>Back-end Genuis</li>
                            <li>Working out is REQUIRED</li>
                            <li>D.C. Reppin</li>
                            <li>Part-time dog surfing instructor</li>
                            </ul>
                        </div>
                    </div>
                    </div>
                </div>
          <br />
          
          <div class="mdl-card mdl-shadow--3dp demo-card-wide ">
                                    <div class="mdl-card__Lorenzo" style="width: 94% ">        
                            
                    <div class="mdl-card__supporting-text">
                        <img src="../Assets/Images/zo.jpg" style="height:300px; width:300px"/>
                        <div style="font-size: 175%; float:right">
                            <div style="font-size: 175%; float:left"><u>Lorenzo Lewis</u></div>
                            <br />
                            <ul style="font-size:100%">
                            <li>Scheduler</li>
                            <li>A Poet</li>
                            <li>5'5 and proud</li>
                            <li>In and Out Burger ALL DAY, EveryDay. </li>
                            <li>Part-time horseback rider</li>
                            </ul>
                        </div>
                    </div>
                    </div>
                </div>
          <br />

                    <div class="mdl-card mdl-shadow--3dp demo-card-wide ">
                                    <div class="mdl-card__Yousef">        
                            
                    <div class="mdl-card__supporting-text" style="width: 75% ">
                        <img src="../Assets/Images/you.jpg" style="height:300px; width:300px"/>
                        <div style="font-size: 175%; float:right">
                        <div style="font-size: 175%; float:left"><u>Yousef Khoury</u></div> 
                            <br />
                            <ul style="font-size:100%">
                            <li>Team Member 5</li>
                            <li>Ball is life</li>
                            <li>Jerusalem is his crib</li>
                            <li>Ball is life</li>
                            <li>Part-time fortune cookie writer </li>
                            </ul>
                        </div>
                    </div>
                    </div>
                </div>
          <br />
      </div>
    </div>
  </body>
</html>