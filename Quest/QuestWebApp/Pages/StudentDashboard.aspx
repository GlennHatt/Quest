<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Pages/student.master" AutoEventWireup="true" CodeBehind="StudentDashboard.aspx.cs" Inherits="QuestWebApp.Pages.StudentDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="studentBreadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="studentHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="studentExtraReferances" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="studentSidebar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="studentWithSidebarBodyContent" runat="server">
    
    <!-- Card for When a Test is Due -->
<style>
.demo-card-wide.mdl-card {

  margin:10%;
  width: 400px;
  height: 200px;
}

</style>

<div class="demo-card-wide mdl-card mdl-shadow--3dp">
  <div class="mdl-card__supporting-text" style="text-align:center">
    <h1>Test Due: __________ </h1>
  </div>
  <div style="text-align:right">
    <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" style="color:#EE7600">
      Take Test
    </a>
  </div>
</div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="studentPageSpecificJS" runat="server">
</asp:Content>
