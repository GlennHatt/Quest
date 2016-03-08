<%@ Page Title="Student | Teachers & Classes" Language="C#" MasterPageFile="~/Master-Pages/student.master" AutoEventWireup="true" CodeBehind="studentTeachersandClasses.aspx.cs" Inherits="QuestWebApp.Pages.studentTeachersandClasses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="studentBreadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="studentHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="studentExtraReferances" runat="server">

    <script src="http://s.codepen.io/assets/libs/modernizr.js" type="text/javascript"></script>
    <link href="../Assets/Styles/dialog.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="studentSidebar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="studentWithSidebarBodyContent" runat="server">


    <style>

        ::-webkit-input-placeholder { /* WebKit, Blink, Edge */
    color:    white;
}
:-moz-placeholder { /* Mozilla Firefox 4 to 18 */
   color:    white;
   opacity:  1;
}
::-moz-placeholder { /* Mozilla Firefox 19+ */
   color:    white;
   opacity:  1;
}
:-ms-input-placeholder { /* Internet Explorer 10-11 */
   color:    white;
}
:placeholder-shown { /* Standard (https://drafts.csswg.org/selectors-4/#placeholder) */
  color:    white;
}

    </style>

    <%--<div class="mdl-cell mdl-cell--12-col ">
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
                </div>--%>



    <main class="mdl-layout__content" style="width: 99%; padding-right: 1%;">
        <div class="content-grid mdl-grid" style="width: 100%;">
            
                    
       <div class="mdl-cell mdl-cell--6-col ">


   <div class="demo-card-wide mdl-cardTakeTest mdl-shadow--3dp mdl-card" style="width:100%;">

      <%--<div class="title">LOGIN</div>

      <div class="input">
         <label for="name">Username</label>
         <input type="text" name="name" id="name">
         <span class="spin"></span>
      </div>

      <div class="input">
         <label for="pass">Password</label>
         <input type="password" name="pass" id="pass">
         <span class="spin"></span>
      </div>

      <div class="button login">
         <button><span>GO</span> <i class="fa fa-check"></i></button>
      </div>

      <a href="" class="pass-forgot">Forgot your password?</a>--%>

       <div class="mdl-card__supporting-text" style="text-align: center">
                        <h3>
                            <asp:Label ID="lblClass" runat="server" Text="Class"></asp:Label></h3>
                        <h3>
                            <asp:Label ID="lblTeacher" runat="server" Text="Teacher"></asp:Label></h3>
                        <p>Current Grade:<asp:Label ID="lblcurGrade" runat="server" Text=" B+(89%)"></asp:Label></p>

           <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
        </div>


  

   <div class="overbox">
      <div class="material-button alt-2"><span class="shape"><i class="material-icons" style="position: absolute;font-size: 298%;color: white;top: 31%;left: 33%;">mail</i></span></div>

      <div class="title">Email</div>

     <div class="input">
         <asp:TextBox ID="txtbxMessageSubject" class="mdl-textfield__input" type="text" runat="server" />
         <label class="mdl-textfield__label" style="bottom: 0px" for="sample3">Subject:</label>
     </div>

       <div class="input">
           <textarea class="mdl-textfield__input" rows="3" placeholder="Message:" style="color:white;"></textarea>
           </div>


       <div class="button" style="text-align:right; ">
          <asp:LinkButton ID="btnCancelMessage" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored" style="background-color:rgb(76,175,80); color:white;margin-right:5%;" runat="server">
                            <i class="material-icons">clear</i>
                        </asp:LinkButton>

           <asp:LinkButton ID="btnSendMessage" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored" style="background-color:rgb(76,175,80); color:white;" runat="server" OnClick="btnSendMessage_Click">
                            <i class="material-icons">done</i>
                        </asp:LinkButton>



       </div>
      <%--<div class="button">
         <asp:LinkButton ID="btnCancel" runat="server">Cancel</asp:LinkButton><button><span>Send</span></button>
      </div>--%>


   </div>


                    </div>

   </div>

</div>


           
        </div>
    </main>

    <Button  id="demoshowtoast" class="mdl-button mdl-js-button mdl-button--raised" type="button" >Show Toast</Button>
<div id="demo-toast-example" class="mdl-js-snackbar mdl-snackbar">
  <div class="mdl-snackbar__text"></div>
  <button class="mdl-snackbar__action" type="button"></button>
</div>
<script>
(function() {
  'use strict';
  window['counter'] = 0;
  var snackbarContainer = document.querySelector('#demo-toast-example');
  var showToastButton = document.querySelector('#demoshowtoast');
  showToastButton.addEventListener('click', function() {
    'use strict';
    var data = {message: 'Example Message # ' + ++counter};
    snackbarContainer.MaterialSnackbar.showSnackbar(data);
  });
}());
</script>

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="studentPageSpecificJS" runat="server">






    <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script src="js/modernizr.js"></script>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src="../Assets/JS/dialog.js"></script>
</asp:Content>
