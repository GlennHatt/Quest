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

    <style>


.demo-card-wide.mdl-card {
  /* extra styles go here */
} 


</style> 
    <main class="mdl-layout__content"  style="width: 99%; padding-right: 1%;">
        <div class="content-grid mdl-grid" style="width: 100%;">
            <div class="mdl-cell mdl-cell--4-col ">
                <!-- Card for Creating a test -->


                <div class="demo-card-wide mdl-cardTakeTest mdl-shadow--3dp mdl-card demo-card-square">
                    <div class="mdl-card__supporting-text" style="text-align: center">
                        <h1>Create a Test </h1>
                    </div>
                    <div style="text-align: right">
                        <asp:LinkButton ID="btnCreateTest" runat="server" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect" Style="background-color: #EE7600; color: white; left: -13px; bottom: 10px;">
                            <i class="material-icons">create</i>
                        </asp:LinkButton>
                    </div>
                </div>
            </div>

            <div class="mdl-cell mdl-cell--4-col">
                <!-- Card for Informing the Teacher how many test they have to grade -->


                <div class="demo-card-wide mdl-cardGradeTest mdl-shadow--3dp mdl-card demo-card-square">
                    <div class="mdl-card__supporting-text" style="text-align: center">
                        <h1>You Have
                            <asp:Label ID="lblTestsToGrade" runat="server" Text="0"></asp:Label>
                            Tests to Grade </h1>
                        <asp:LinkButton ID="viewTest" runat="server" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" Text="View Test" Style="background-color: #EE7600; color: white; margin-right: -395px;
    margin-bottom: -7px;">
                           
                        </asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
    </main>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="teacherPageSpecificJS" runat="server">
</asp:Content>
