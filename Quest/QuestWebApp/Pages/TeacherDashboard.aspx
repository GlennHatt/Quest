<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Pages/teacher.master" AutoEventWireup="true" CodeBehind="TeacherDashboard.aspx.cs" Inherits="QuestWebApp.Pages.TeacherDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="teacherBreadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="teacherHead" runat="server">
    <title>Teacher | Home</title>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="teacherExtraReferances" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="teacherWithSidebarSidebar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="teacherWithSidebarBodyContent" runat="server">


    
        <!-- Card for Creating a test -->
    <style>
    .demo-card-wide.mdl-cardTakeTest {
      margin:3%;
      width: 400px;
      height: 200px;
    }
    
    </style>
    
    <div class="demo-card-wide mdl-cardTakeTest mdl-shadow--3dp">
      <div class="mdl-card__supporting-text" style="text-align:center">
        <h1>Create a Test </h1>
      </div>
      <div style="text-align:right">
        <asp:LinkButton ID="btnCreateTest" runat="server" class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" style="background-color:#EE7600; color:white; left: -13px; bottom: 10px;">
            Begin
        </asp:LinkButton>
      </div>
    </div>
    
            <!-- Card for Informing the Teacher how many test they have to grade -->
    <style>
    .demo-card-wide.mdl-cardGradeTest {
      
      margin:3%;
      width: 400px;
      height: 200px;
    }
    </style>
    
    <div class="demo-card-wide mdl-cardGradeTest mdl-shadow--3dp">
      <div class="mdl-card__supporting-text" style="text-align:center">
        <h1>You Have __ Tests to Grade </h1>
      </div>
    </div>
        
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="teacherPageSpecificJS" runat="server">
</asp:Content>
