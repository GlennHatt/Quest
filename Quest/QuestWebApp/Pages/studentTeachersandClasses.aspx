<%@ Page Title="Student | Teachers & Classes" Language="C#" MasterPageFile="~/Master-Pages/student.master" AutoEventWireup="true" CodeBehind="studentTeachersandClasses.aspx.cs" Inherits="QuestWebApp.Pages.studentTeachersandClasses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="studentBreadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="studentHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="studentExtraReferances" runat="server">

    <script src="http://s.codepen.io/assets/libs/modernizr.js" type="text/javascript"></script>
    <link href="../Assets/Styles/dialog.css" rel="stylesheet" />
    <link href="../Assets/Styles/loginStyles.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="studentSidebar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="studentWithSidebarBodyContent" runat="server">


    <main class="mdl-layout__content">
        <div class="content-grid mdl-grid">
            <div class="mdl-cell mdl-cell--12-col ">
                <!-- Card for Creating a test -->

                <div class="demo-card-wide mdl-cardTakeTest mdl-shadow--3dp mdl-card">
                    <div class="mdl-card__supporting-text" style="text-align: center">
                        <h3>
                            <asp:Label ID="lblClass" runat="server" Text="Class"></asp:Label></h3>
                        <h3>
                            <asp:Label ID="lblTeacher" runat="server" Text="Teacher"></asp:Label></h3>
                        <p>Current Grade:<asp:Label ID="lblcurGrade" runat="server" Text=" B+(89%)"></asp:Label></p>
        </div>
                    </div>
                </div>
                    </div>
        <div class="content-grid mdl-grid">
            <div class="mdl-cell mdl-cell--12-col ">
                <!-- Card for Creating a test -->


                <div class="demo-card-wide mdl-cardTakeTest mdl-shadow--3dp mdl-card" style="height:100px; width:100px">
                    <div class="mdl-card__supporting-text" style="text-align: center">
                        <h1>
                            <asp:Label ID="Label1" runat="server" Text="Contact A Teacher"></asp:Label>
                        </h1>
                        </div>
                         <div class="protect" style="z-index:99999">
                        <div class="fab" style="z-index:99999">
                                <i class="material-icons" style="color:white">mail</i>
                    
                            <div class='cntt-wrapper' style="z-index:99999">
                                <div id="fab-hdr" style="z-index:99999">
                                    <h1>FAB to Modal Window</h1>
                                </div>


                                <div class="material-input">
                                    <input type="text">
                                    <label>Name</label>
                                    <span></span>
                                </div>

                                <div class="material-input">
                                    <input type="text">
                                    <label>Email</label>
                                    <span></span>
                                </div>

                                <div class="material-input">
                                    <input type="text">
                                    <label>Site</label>
                                    <span></span>
                                </div>

                               
                                <div class="btn-wrapper">
                                    <a href="#" type="button" class="btn" id="submit">Add
                                    </a>
                                    <a href="#" class="btn" id="cancel" style="color: black">Cancel</a>
                                </div>

                            </div>
                        </div>
                    </div>
</div>
            </div>
        </div>
                    
    </main>

    <div class="materialContainer" >


   <div class="box" style="height:400px; width:400px">

      <div class="ClassInfo" style="text-align: center">
          <h3> <asp:Label ID="Label2" runat="server" Text="Class"></asp:Label></h3>
                        <h3> <asp:Label ID="Label3" runat="server" Text="Teacher"></asp:Label></h3>
                        <p>Current Grade:<asp:Label ID="Label4" runat="server" Text=" B+(89%)"></asp:Label></p>
         <span class="spin"></span>
      </div>


   </div>

   <div class="overbox">
      <div class="material-button alt-2">
          <i class="material-icons" style="color:white; margin: 59px;">mail</i></div>

      <div class="title">REGISTER</div>

      <div class="input">
         <label for="regname">Username</label>
         <input type="text" name="regname" id="regname">
         <span class="spin"></span>
      </div>

      <div class="input">
         <label for="regpass">Password</label>
         <input type="password" name="regpass" id="regpass">
         <span class="spin"></span>
      </div>

      <div class="input">
         <label for="reregpass">Repeat Password</label>
         <input type="password" name="reregpass" id="reregpass">
         <span class="spin"></span>
      </div>

      <div class="button">
         <button><span>NEXT</span></button>
      </div>


   </div>

</div>

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="studentPageSpecificJS" runat="server">

    <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script src="js/modernizr.js"></script>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src="../Assets/JS/loginJS.js"></script>
</asp:Content>
