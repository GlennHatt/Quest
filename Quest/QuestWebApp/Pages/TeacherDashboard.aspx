<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Pages/teacher.master" AutoEventWireup="true" CodeBehind="teacherDashboard.aspx.cs" Inherits="QuestWebApp.Pages.teacherDashboard" %>
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
                        <asp:LinkButton ID="btnCreateTest" PostBackUrl="~/Pages/testCreation.aspx" runat="server" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect" Style="background-color: #EE7600; color: white; left: -13px; bottom: 10px;">
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
                           
                    </div>
                </div>
            </div>

            <div class="mdl-cell mdl-cell--4-col">
             <div class="mdl-card mdl-shadow--3dp  demo-card-square">
                    <div class="mdl-card__supporting-text " style="text-align: center">
                        <i class="material-icons testAlert" style="font-size:300%">assignment_late</i>
                        <div style="font-size: 180%; margin-bottom: 7%; margin-top: 5%;">Test Ready To Be Graded:</div>
                        <asp:Label ID="lblTestSubject" runat="server" Text="(Subject Placeholder)"></asp:Label><br />
                        <asp:Label ID="lblTestDate" runat="server" Text="(Date Placeholder)"></asp:Label><br />
                        <asp:Label ID="lblTestTime" runat="server" Text="(Time Placeholder)"></asp:Label><br />
                    </div>
                    <div style="text-align: right">
                        <br />
                        <asp:LinkButton ID="btnTaketest" runat="server" class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" Style="background-color: #EE7600; color: white; left: -13px; bottom: 10px;">
                            Grade Test
                        </asp:LinkButton>
</div>
                 </div>
        </div>
            </div>
    </main>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="teacherPageSpecificJS" runat="server">
</asp:Content>
