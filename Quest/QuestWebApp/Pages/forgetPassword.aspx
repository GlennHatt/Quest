<%@ Page Title=" Forget Password" Language="C#" MasterPageFile="~/Master-Pages/withSidebar.master" AutoEventWireup="true" CodeBehind="forgetPassword.aspx.cs" Inherits="QuestWebApp.Pages.forgetPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="breadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="extraReferances" runat="server">

        <script src="http://s.codepen.io/assets/libs/modernizr.js" type="text/javascript"></script>
    <link href="../Assets/Styles/dialog.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="withSidebarSidebar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="withSidebarBodyContent" runat="server">

    <div class="demo-card-wide mdl-cardTakeTest mdl-shadow--3dp mdl-card" style="width:60%; margin-left:20%;">

       <div class="mdl-card__supporting-text" style="text-align: center">
                        <h3>
                            <asp:Label ID="lblClass" runat="server" Text="Email"></asp:Label></h3>
                        <h3>
                            <asp:Label ID="lblTeacher" runat="server" Text="Contact The Administrator"></asp:Label></h3>

           <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
        </div>
   <div id="mailButton" class="overbox" runat="server">
      <div class="material-button alt-2"><span id="overbox" class="shape"><i class="material-icons" style="position: absolute;font-size: 298%;color: white;top: 31%;left: 33%;">mail</i></span></div>

      <div class="title">Email</div><br />

     <div class="input">
         <asp:TextBox ID="txtbxMessageSubject" class="mdl-textfield__input" type="text" runat="server" />
         <label class="mdl-textfield__label" style="bottom: 0px" for="sample3">Subject:</label>
     </div>

       <div class="input">
           <textarea id="txtbxMessageBody" runat="server" class="mdl-textfield__input" rows="3" placeholder="Message:" style="color:white;"></textarea>
           </div>


       <div class="button" style="text-align:right; ">
          <button ID="btnCancelMessage" type="button" onclick="myClosure()" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored" style="background-color:rgb(76,175,80); color:white;margin-right:5%;"  >
                            <i class="material-icons">clear</i>
                        </button>

           <asp:LinkButton ID="btnSendMessage" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored" style="background-color:rgb(76,175,80); color:white;" runat="server">
                            <i class="material-icons">done</i>
                        </asp:LinkButton>
           </div>
       </div>
        </div>

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="pageSpecificJS" runat="server">

    <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script src="js/modernizr.js"></script>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src="../Assets/JS/dialog.js"></script>

</asp:Content>
