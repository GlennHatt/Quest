<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Pages/teacher.master" AutoEventWireup="true" CodeBehind="zoPractice.aspx.cs" Inherits="QuestWebApp.test_pond.zoPractice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="teacherBreadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="teacherHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="extraReferances" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="teacherBody" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="teacherPageSpecificJS" runat="server">

<!-- Wide card with share menu button -->
<style>
.demo-card-wide.mdl-card {
  width: 512px;
}
.demo-card-wide > .mdl-card__title {
  color: #228B22;
  height: 176px;
}
.demo-card-wide > .mdl-card__menu {
  color: #228B22;
}
</style>

<div class="demo-card-wide mdl-card mdl-shadow--2dp">
  <div class="mdl-card__title">
  </div>
  <div class="mdl-card__supporting-text" style="text-align:center">
    Create a Test 
  </div>
  <div class="mdl-card__actions mdl-card--border" style="text-align:right">
    <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
      Begin
    </a>
  </div>
</div>
</asp:Content>