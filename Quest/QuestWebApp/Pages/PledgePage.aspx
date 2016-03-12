<%@ Page Title="Pledge Page" Language="C#" MasterPageFile="~/Master-Pages/withoutSidebar.master" AutoEventWireup="true" CodeBehind="pledgePage.aspx.cs" Inherits="QuestWebApp.Pages.PledgePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="withoutSidebarBreadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="withoutSidebarHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="withoutSidebarExtraReferances" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="withoutSidebarHeadBodyContent" runat="server">
    
    <!-- Wide card -->
<style>
.demo-card-wide.mdl-card {
  width: 50%;
  top: 248px;
}
</style>

<div class="demo-card-wide mdl-card mdl-shadow--3dp" style="margin-left: 30%;">
  <div class="mdl-card__title" style="text-align:center">
    <h1 class="mdl-card__title-text" style="margin-left: 20%;">If you did not cheat please type your name.</h1>
  </div>
  <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="margin-left: 30%;">
                            <asp:TextBox ID="txtbxUsersName" class="mdl-textfield__input" type="text" runat="server" style="font-size:27px"/>
                            <label class="mdl-textfield__label" for="sample3" style="bottom: 0;">First and Last Name:</label>                
    <asp:linkbutton runat="server"  class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" style="margin-left: 50%; margin-bottom:-60px" ForeColor="#FF3300">
      I Cheated
    </asp:linkbutton>
      <asp:linkbutton runat="server" class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" style="margin-left: 5%; margin-bottom:-60px">
      I Did NOT Cheat
    </asp:linkbutton>
  </div>

</div>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="withoutSidebarPageSpecificJS" runat="server">
</asp:Content>
