<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="aboutUsPage.aspx.cs" Inherits="QuestWebApp.Pages.aboutUsPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About Us</title>


    <!-- Material Design Lite -->
    <script src="https://code.getmdl.io/1.1.1/material.min.js"></script>
    <link rel="stylesheet" href="https://code.getmdl.io/1.1.1/material.indigo-pink.min.css" />
    <!-- Material Design icon font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link href="../Assets/Styles/AboutUs.css" rel="stylesheet" />
    <link rel='stylesheet prefetch' href='http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.min.css' />
    <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css' />

</head>
<body>
    <form runat="server">
    <!-- Accent-colored raised button with ripple -->
    <asp:LinkButton CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" runat="server" id="btnbackToLogin" style="margin-bottom: -18px; right: 0px; position: absolute; height: 48px; top: 1px; width: 157px;" Text="Back To Login" OnClick="btnbackToLogin_Click">
    </asp:LinkButton>

    <div class="mdl-tabs mdl-js-tabs mdl-js-ripple-effect">
        <div class="mdl-tabs__tab-bar">
            <a href="#starks-panel" class="mdl-tabs__tab is-active">Quest Testing Center</a>
            <a href="#lannisters-panel" class="mdl-tabs__tab">R.P.G. Team</a>
        </div>

        <!-- Quest panel -->
        <div class="mdl-tabs__panel is-active" id="starks-panel" style="background: /* top, transparent red, faked with gradient */ 
    linear-gradient(
      rgba(255, 255, 255, 0.2), 
      rgba(255, 255, 255, 0.2)
    ),
    /* bottom, image */
    url(../Assets/Images/mountains.jpg); /*background-image: url('../Assets/Images/mountains.jpg'); */ background-position: center; background-size: cover; background-repeat: no-repeat; background-attachment: fixed; margin-top: -10%;">

            <style>
                * {
                    color: #606060;
                }

                .demo-card-wide.mdl-card {
                    width: 58%;
                    margin: 0 auto;
                    margin-top: 10%;
                }

                .featureCard {
                    width: 50%;
                    margin: 0 auto;
                    margin-top: 3%;
                }

                .demo-card-wide > .mdl-card__title {
                    height: 50px;
                }

                .demo-card-wide > .mdl-card__titleQuest {
                    height: 400px;
                    background: url('../Assets/Images/quest.png') center / cover  no-repeat;
                    background-size:contain;
                    
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

                <!-- Description card -->
                <div class="mdl-card mdl-shadow--3dp  featureCard">
                    <div class=" " style="text-align: center">

                        <div style="font-size: 100%; margin-top: 5%; padding: 5%; padding-top: 0;">
                            Quest is an online testing center that allows teachers to craft tests to be given to students. Teachers can view all 
                            students in a particular class as well as the classes that they teach. Teachers also have the option of viewing old tests and modifying grades if needed.
                            <br />
                            <br />

                            Quest makes it easy for students to take tests and track their grades in various classes. They also have the ability to email their teacher for help.
                        </div>

                    </div>
                </div>

                <!-- Mobile card -->
                <div class="mdl-card mdl-shadow--3dp  featureCard">
                    <div class="mdl-card__title">
                    </div>
                    <div class=" " style="text-align: center">
                        <i class="material-icons noTest" style="font-size: 800%;">phone_iphone</i>
                        <div style="font-size: 100%; margin-top: 5%">
                            Optimized for mobile devices so you're not bound to the desktop.
                        </div>

                    </div>
                    <div style="text-align: right">
                        <br />

                    </div>
                </div>
                <!-- Cloud card -->
                <div class="mdl-card mdl-shadow--3dp  featureCard">
                    <div class="mdl-card__title">
                    </div>
                    <div class=" " style="text-align: center">
                        <i class="material-icons noTest" style="font-size: 800%;">backup</i>
                        <div style="font-size: 100%; margin-top: 5%">Completely online so you can use any computer without saving locally.</div>

                    </div>
                    <div style="text-align: right">
                        <br />

                    </div>
                </div>

                <!-- Mail card -->
                <div class="mdl-card mdl-shadow--3dp  featureCard">
                    <div class="mdl-card__title">
                    </div>
                    <div class=" " style="text-align: center">
                        <i class="material-icons noTest" style="font-size: 800%;">contact_mail</i>
                        <div style="font-size: 100%; margin-top: 5%">Students and teachers can email the administrator for a password reset.</div>

                    </div>
                    <div style="text-align: right">
                        <br />

                    </div>
                </div>

                <!-- Mail card -->
                <div class="mdl-card mdl-shadow--3dp  featureCard">
                    <div class="mdl-card__title">
                    </div>
                    <div class=" " style="text-align: center">
                        <i class="material-icons noTest" style="font-size: 800%;">assessment</i>
                        <div style="font-size: 100%; margin-top: 5%">Track grades and see class averages.</div>

                    </div>
                    <div style="text-align: right">
                        <br />

                    </div>
                </div>

                <!-- time card -->
                <div class="mdl-card mdl-shadow--3dp  featureCard">
                    <div class="mdl-card__title">
                    </div>
                    <div class=" " style="text-align: center">
                        <i class="material-icons noTest" style="font-size: 800%;">watch_later</i>
                        <div style="font-size: 100%; margin-top: 5%">Schedule tests with time limits.</div>

                    </div>
                    <div style="text-align: right">
                        <br />

                    </div>
                </div>
            </div>

            <!-- end feature cards -->
        </div>


    <!-- RPG Panel -->
    <div class="mdl-tabs__panel" id="lannisters-panel" class="mdl-tabs__panel is-active" id="starks-panel" style="background:
    linear-gradient(
      rgba(255, 255, 255, 0.2), 
      rgba(255, 255, 255, 0.2)
    ),
    /* bottom, image */
    url(../Assets/Images/mountainwoods.jpg); /*background-image: url('../Assets/Images/mountainwoods.jpg'); */ background-position: center; background-size: cover; background-repeat: no-repeat; background-attachment: fixed; margin-top: -10%;">
        <div class="mdl-card mdl-shadow--3dp demo-card-wide ">
            <div class="mdl-card__RPG">

                <div class="mdl-card__supporting-text " style="text-align: center">
                    <img src="../Assets/Images/transparent%20-%20Copy.png" style="height: 300px; width: 300px" />
                    <p style="font-size: 175%;">
                        R.P.G. (Royal Programming Gentlemen)
                    </p>

                </div>
            </div>
        </div>

        <div class="mdl-card mdl-shadow--3dp demo-card-wide ">
            <div class="mdl-card__RPGInfo">

                <div class="mdl-card__supporting-text" style="text-align: center">
                    <img src="../Assets/Images/Team%20Pics/RPG.smaller%20copy01160307.jpg" style="width: 104%; padding-left: 10%;" />
                    <br />
                    <br />
                    <div style="font-size: 175%; padding-left: 10%;">
                        R.P.G. was founded in 2016. This group of gentlemen have been hand-picked to create an online testing center. 
                           As every team member does his part, they have successfully created the Quest Testing Center.
                    </div>
                </div>
            </div>
        </div>
        <br />

        <section class="container">
            <div class="row active-with-click">
                <div class="col-md-4 col-sm-6 col-xs-12">
                    <article class="material-card Red">
                        <h2>
                            <span style="color: white">Glenn Hatt</span>
                            <strong style="color: white">
                                <i class="fa fa-fw fa-star" style="color: white"></i>
                                The Database Expert
                            </strong>
                        </h2>
                        <div class="mc-content">
                            <div class="img-container">
                                <img class="img-responsive" src="../Assets/Images/Team%20Pics/RPG.smaller%20copy07160307.jpg" />
                            </div>
                            <div class="mc-description">
                                <ul style="font-size: 100%;">
                                    <li>Project Manager</li>
                                    <li>ORACLE and ASP mastermind</li>
                                    <li>Drinks 2 Gallons of Coffee a Week</li>
                                    <li>Social Network Hermit</li>
                                </ul>
                            </div>
                        </div>
                        <a class="mc-btn-action">
                            <i class="fa fa-bars" style="color: white"></i>
                        </a>
                        <div class="mc-footer">
                            <a class="fa fa-fw fa-linkedin"></a>
                        </div>
                    </article>
                </div>
                <div class="col-md-4 col-sm-6 col-xs-12">
                    <article class="material-card Pink">
                        <h2>
                            <span style="color: white">Ryan Carroll</span>
                            <strong style="color: white">
                                <i class="material-icons testAlert" style="color: white">directions_bike</i>
                                Design Master
                            </strong>
                        </h2>
                        <div class="mc-content">
                            <div class="img-container">
                                <img class="img-responsive" src="../Assets/Images/Team%20Pics/RPG.smaller%20copy18160307.jpg" />
                            </div>
                            <div class="mc-description">
                                <br />
                                <br />
                                <ul style="font-size: 100%;">
                                    <li>Assistant Project Manager</li>
                                    <li>Design Expert</li>
                                    <li>A+ Certified</li>
                                    <li>Delights in Biking</li>
                                    <li><a href="https://www.biblegateway.com/passage/?search=Matthew+5%3A8&version=AKJV" target="_blank">Matthew 5:8</a></li>
                                </ul>
                            </div>
                        </div>
                        <a class="mc-btn-action" style="color: white">
                            <i class="fa fa-bars" style="color: white"></i>
                        </a>
                        <div class="mc-footer">
                            <a href="https://www.linkedin.com/in/carrollmedia" target="_blank" class="fa fa-fw fa-linkedin"></a>
                        </div>
                    </article>
                </div>
                <div class="col-md-4 col-sm-6 col-xs-12">
                    <article class="material-card Purple">
                        <h2>
                            <span style="color: white">Jesse Upchurch</span>
                            <strong style="color: white">
                                <i class="material-icons testAlert" style="color: white">fitness_center</i>
                                Work-Out Zealot
                            </strong>
                        </h2>
                        <div class="mc-content">
                            <div class="img-container">
                                <img class="img-responsive" src="../Assets/Images/Team%20Pics/RPG.smaller%20copy03160307.jpg" />
                            </div>
                            <div class="mc-description">
                                <ul style="font-size: 100%;">
                                    <li>Project Secretary</li>
                                    <li>Runs on Pre-Workout</li>
                                    <li>Does Heavy Lifting</li>
                                    <li>NOVA/DMV</li>
                                    <li>Early Bird</li>
                                </ul>
                            </div>
                        </div>
                        <a class="mc-btn-action" style="color: white">
                            <i class="fa fa-bars" style="color: white"></i>
                        </a>
                        <div class="mc-footer">
                            <a class="fa fa-fw fa-linkedin"></a>
                        </div>
                    </article>
                </div>
                <div class="col-md-4 col-sm-6 col-xs-12">
                    <article class="material-card Deep Orange">
                        <h2>
                            <span style="color: white">Lorenzo Lewis</span>
                            <strong style="color: white">
                                <i class="material-icons testAlert" style="color: white">local_atm</i>
                                Zo
                            </strong>
                        </h2>
                        <div class="mc-content">
                            <div class="img-container">
                                <img class="img-responsive" src="../Assets/Images/Team%20Pics/RPG.smaller%20copy29160307.jpg" />
                            </div>
                            <div class="mc-description">
                                <ul style="font-size: 100%;">
                                    <li>Project Scheduler</li>
                                    <li>5'5" Curly-Haired Brotha</li>
                                    <li>In and Out Burger ALL DAY, EVERYDAY. </li>
                                    <li>California Kid</li>
                                    <li>Romans 8:38-39</li>
                                </ul>
                            </div>
                        </div>
                        <a class="mc-btn-action" style="color: white">
                            <i class="fa fa-bars" style="color: white"></i>
                        </a>
                        <div class="mc-footer">
                            <a href="https://www.linkedin.com/in/lorenzo-lewis-242741116" class="fa fa-fw fa-linkedin"></a>
                        </div>
                    </article>
                </div>
                <div class="col-md-4 col-sm-6 col-xs-12">
                    <article class="material-card Indigo">
                        <h2>
                            <span style="color: white">Yousef Khury</span>
                            <strong style="color: white">
                                <i class="material-icons testAlert" style="color: white">games</i>
                                Security
                            </strong>
                        </h2>
                        <div class="mc-content">
                            <div class="img-container">
                                <img class="img-responsive" src="../Assets/Images/Team%20Pics/RPG.smaller%20copy10160307.jpg" />
                            </div>
                            <div class="mc-description">
                                <br />
                                <ul style="font-size: 100%;">
                                    <li>Team Member 5</li>
                                    <li>Ball is life</li>
                                    <li>Video Game Master(Chief)</li>
                                    <li>He's Probably Read That </li>
                                    <li>Psalm 91:2</li>
                                </ul>
                            </div>
                        </div>
                        <a class="mc-btn-action">
                            <i class="fa fa-bars" style="color: white"></i>
                        </a>
                        <div class="mc-footer">
                            <a class="fa fa-fw fa-linkedin"></a>
                        </div>
                    </article>
                    
                </div>
            </div></section>
            </div>
        </div>

    </form>
</body>
      <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src="../Assets/JS/AboutusJS.js"></script>
</html>