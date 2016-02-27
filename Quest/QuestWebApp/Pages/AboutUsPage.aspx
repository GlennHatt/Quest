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
    <link href="../Assets/Styles/AboutUs.css" rel="stylesheet" />
    <link rel='stylesheet prefetch' href='http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.min.css'/>
    <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css'/>

</head>

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
          <div class="mdl-card mdl-shadow--3dp  featureCard" >
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
      <div class="mdl-tabs__panel" id="lannisters-panel" class="mdl-tabs__panel is-active" id="starks-panel" style=" background-image: url('../Assets/Images/woods.jpg'); background-position: center;
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

               <section class="container">
    <div class="row active-with-click">
        <div class="col-md-4 col-sm-6 col-xs-12">
            <article class="material-card Red">
                <h2>
                    <span>Glenn Hatt</span>
                    <strong>
                        <i class="fa fa-fw fa-star"></i>
                        The Database Expert
                    </strong>
                </h2>
                <div class="mc-content">
                    <div class="img-container">
                        <img class="img-responsive" src="../Assets/Images/glenn.jpg"/>
                    </div>
                    <div class="mc-description">
                        <ul>
                            <li>Project Manager</li>
                            <li>Enjoys long walks on the beach</li>
                            <li>Database Expert</li>
                            <li>Part-time Youth Pastor</li>
                            <li>Part-time Barbie dress designer</li>
                            </ul>
                        </div>
                    </div>
                <a class="mc-btn-action">
                    <i class="fa fa-bars"></i>
                </a>
                <div class="mc-footer">
                    <h4>
                        Social
                    </h4>
                    <a class="fa fa-fw fa-facebook"></a>
                    <a class="fa fa-fw fa-twitter"></a>
                    <a class="fa fa-fw fa-linkedin"></a>
                    <a class="fa fa-fw fa-google-plus"></a>
                    </div>
            </article>
                </div>
        <div class="col-md-4 col-sm-6 col-xs-12">
            <article class="material-card Pink">
                <h2>
                    <span>Ryan Carroll</span>
                    <strong>
                        <i class="fa fa-fw fa-star"></i>
                        Design Master
                    </strong>
                </h2>
                <div class="mc-content">
                    <div class="img-container">
                        <img class="img-responsive" src="../Assets/Images/Ryan.jpg"/>
                    </div>
                    <div class="mc-description">
                        <ul>
                            <li>Assistant Project Manager</li>
                            <li>Design Expert</li>
                            <li>A+ Certified</li>
                            <li>Drinks 3 gallons of water a day</li>
                            <li>Weekend bingo manager</li>
                            </ul>
                        </div>
                    </div>
                <a class="mc-btn-action">
                    <i class="fa fa-bars"></i>
                </a>
                <div class="mc-footer">
                    <h4>
                        Social
                    </h4>
                    <a class="fa fa-fw fa-facebook"></a>
                    <a class="fa fa-fw fa-twitter"></a>
                    <a class="fa fa-fw fa-linkedin"></a>
                    <a class="fa fa-fw fa-google-plus"></a>
                    </div>
            </article>
                </div>
        <div class="col-md-4 col-sm-6 col-xs-12">
            <article class="material-card Purple">
                <h2>
                    <span>Jesse Upchurch</span>
                    <strong>
                        <i class="fa fa-fw fa-star"></i>
                        Work-Out Junkie
                    </strong>
                </h2>
                <div class="mc-content">
                    <div class="img-container">
                        <img class="img-responsive" src="../Assets/Images/Jesse.jpg"/>
                    </div>
                    <div class="mc-description">
                        <ul>
                            <li>Secretary</li>
                            <li>Back-end Genuis</li>
                            <li>Working out is REQUIRED</li>
                            <li>D.C. Reppin</li>
                            <li>Part-time dog surfing instructor</li>
                            </ul>
                        </div>
                </div>
                <a class="mc-btn-action">
                    <i class="fa fa-bars"></i>
                </a>
                <div class="mc-footer">
                    <h4>
                        Social
                    </h4>
                    <a class="fa fa-fw fa-facebook"></a>
                    <a class="fa fa-fw fa-twitter"></a>
                    <a class="fa fa-fw fa-linkedin"></a>
                    <a class="fa fa-fw fa-google-plus"></a>
                    </div>
            </article>
                    </div>
        <div class="col-md-4 col-sm-6 col-xs-12">
            <article class="material-card Deep-Purple">
                <h2>
                    <span>Lorenzo Lewis</span>
                    <strong>
                        <i class="fa fa-fw fa-star"></i>
                        Zo
                    </strong>
                </h2>
                <div class="mc-content">
                    <div class="img-container">
                        <img class="img-responsive" src="../Assets/Images/zo.jpg"/>
                </div>
                    <div class="mc-description">
                        <ul>
                            <li>Scheduler</li>
                            <li>A Poet</li>
                            <li>5'5 and proud</li>
                            <li>In and Out Burger ALL DAY, EveryDay. </li>
                            <li>Part-time horseback rider</li>
                            </ul>
                        </div>
                </div>
                <a class="mc-btn-action">
                    <i class="fa fa-bars"></i>
                </a>
                <div class="mc-footer">
                    <h4>
                        Social
                    </h4>
                    <a class="fa fa-fw fa-facebook"></a>
                    <a class="fa fa-fw fa-twitter"></a>
                    <a class="fa fa-fw fa-linkedin"></a>
                    <a class="fa fa-fw fa-google-plus"></a>
                    </div>
            </article>
                    </div>
        <div class="col-md-4 col-sm-6 col-xs-12">
            <article class="material-card Indigo">
                <h2>
                    <span>Yousef Khoury</span>
                    <strong>
                        <i class="fa fa-fw fa-star"></i>
                        Security
                    </strong>
                </h2>
                <div class="mc-content">
                    <div class="img-container">
                        <img class="img-responsive" src="../Assets/Images/you.jpg"/>
                </div>
                    <div class="mc-description">
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
                <a class="mc-btn-action">
                    <i class="fa fa-bars"></i>
                </a>
                <div class="mc-footer">
                    <h4>
                        Social
                    </h4>
                    <a class="fa fa-fw fa-facebook"></a>
                    <a class="fa fa-fw fa-twitter"></a>
                    <a class="fa fa-fw fa-linkedin"></a>
                    <a class="fa fa-fw fa-google-plus"></a>
                </div>
            </article>
      </div>
    </div>
</section>
      <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
      <script src="../Assets/JS/AboutusJS.js"></script>
</html>