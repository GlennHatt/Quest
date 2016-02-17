<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Pages/teacher.master" AutoEventWireup="true" CodeBehind="teacherTest.aspx.cs" Inherits="QuestWebApp.Pages.teacherTest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="teacherBreadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="teacherHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="teacherExtraReferances" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="teacherWithSidebarSidebar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="teacherWithSidebarBodyContent" runat="server">
    
    <!-- Card for Creating a test -->
<style>
.demo-card-wide.mdl-card {

  margin:10%;
  width: 400px;
  height: 200px;
}

</style>

<div class="demo-card-wide mdl-card mdl-shadow--3dp">
  <div class="mdl-card__supporting-text" style="text-align:center">
    <h1>Create a Test </h1>
  </div>
  <div style="text-align:right">
    <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" style="color:#EE7600">
      Begin
    </a>
  </div>
</div>

        <!-- Card for Informing the Teacher how many test they have to grade -->
<style>
.demo-card-wide.mdl-card {
  float: left;
  margin: 12%;
  width: 400px;
  height: 200px;
}
</style>

<div class="demo-card-wide mdl-card mdl-shadow--3dp">
  <div class="mdl-card__supporting-text" style="text-align:center">
    <h1>You Have __ Tests to Grade </h1>
  </div>
</div>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="teacherPageSpecificJS" runat="server">
</asp:Content>
