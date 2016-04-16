<%@ Page Title="Forgotten Password" Language="C#" MasterPageFile="~/Master-Pages/withoutSidebar.master" AutoEventWireup="true" CodeBehind="forgotPassword.aspx.cs" Inherits="QuestWebApp.Pages.forgotPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="withoutSidebarBreadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="withoutSidebarHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="withoutSidebarExtraReferances" runat="server">

    <script src="http://s.codepen.io/assets/libs/modernizr.js" type="text/javascript"></script>
    <link href="../Assets/Styles/dialog.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="withoutSidebarHeadBodyContent" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="withoutSidebarBodyContent" runat="server">
    <asp:Button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" ForeColor="White" runat="server" id="btnbackToLogin" style="margin-bottom: -18px; right: 0px; position: absolute; height: 48px; bottom: 18px; width: 157px;" Text="Back To Login" Onclick="btnbackToLogin_Click">
    </asp:Button>

    <div class="demo-card-wide mdl-cardTakeTest mdl-shadow--3dp mdl-card" style="width: 60%; margin-left: 20%; height: 550px;">

        <div class="mdl-card__supporting-text" style="text-align: center">
            <h3>
                <asp:Label ID="lblTeacher" runat="server" Text="Please email the administrator requesting a new password."></asp:Label>
            </h3>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>
        <div id="mailButton" class="overbox" runat="server">
            <div class="material-button alt-2"><span id="overbox" class="shape"><i class="material-icons" style="position: absolute; font-size: 298%; color: white; top: 31%; left: 33%;">mail</i></span></div>

            <div class="title">Password request</div>
            <br />

            <div class="input">
                <asp:TextBox ID="txtbxStudentLogin" class="mdl-textfield__input" type="text" runat="server" />
                <label class="mdl-textfield__label" style="bottom: 0px" for="sample3">Your login ID:</label>
            </div>

            <div class="input">
                <asp:TextBox ID="txtbxStudentID" class="mdl-textfield__input" type="text" runat="server" />
                <asp:DropDownList ID="ddlAdmins" class="mdl-textfield__input" runat="server" DataSourceID="sqlAdmins" DataTextField="full_name" DataValueField="email"></asp:DropDownList>
                <label class="mdl-textfield" style="bottom: 0px" for="sample3">Choose Admin:</label>
                <asp:SqlDataSource ID="sqlAdmins" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
SELECT user_id, f_name || ' ' || l_name as full_name, email
  FROM end_user
 WHERE permission_level = 'A'
   AND email IS NOT NULL"></asp:SqlDataSource>
            </div>

            <div class="input">
                <asp:TextBox ID="txtbxStudentEmail" class="mdl-textfield__input" type="text" runat="server" />
                <label class="mdl-textfield__label" style="bottom: 0px" for="sample3">Student E-Mail:</label>
            </div>

            <div class="input">
                <textarea id="txtbxMessageBody" runat="server" class="mdl-textfield__input" rows="3" placeholder="Message:" style="color: white;" >I have forgotten my password, could you please assign me a new one?</textarea>
            </div>


            <div class="button" style="text-align: right;">
                <button id="btnCancelMessage" type="button" onclick="myClosure()" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored" style="background-color: rgb(76,175,80); color: white; margin-right: 5%;">
                    <i class="material-icons">clear</i>
                </button>

                <asp:LinkButton ID="btnSendMessage" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored" Style="background-color: rgb(76,175,80); color: white;" runat="server" OnClick="btnSendMessage_Click">
                            <i class="material-icons">done</i>
                </asp:LinkButton>
                </div>
            </div>
        </div>

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="withoutSidebarPageSpecificJS" runat="server">

        <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script src="js/modernizr.js"></script>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src="../Assets/JS/dialog.js"></script>

</asp:Content>
