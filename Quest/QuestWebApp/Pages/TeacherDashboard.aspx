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
                        <asp:LinkButton ID="btnCreateTest" PostBackUrl="~/Pages/teacherTestCreation.aspx" runat="server" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect" Style="background-color: #EE7600; color: white; left: -13px; bottom: 10px;">
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
                            <asp:Label ID="lblTestsToGrade" runat="server"></asp:Label>
                            Tests to Grade </h1>
                           
                    </div>
                </div>
            </div>
            <asp:ListView ID="teachersTests" runat="server">
                    <ItemTemplate>
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
</ItemTemplate>
                </asp:ListView>
            </div>
        <asp:SqlDataSource ID="sqlTestAmount" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
SELECT Count(*) as test_count
  FROM test_taken t
       JOIN enrollment e USING (enrollment_id)
       JOIN section    s USING (section_id)
 WHERE s.teacher_id = :teacher_id">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="1" Name="teacher_id" SessionField="UserID" />
            </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlGradeTests" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="SELECT test_id, 'Test Name: ' || t.title AS test_title, 'Class: ' || c.title AS class_title,
 'Student: ' || eu.f_name || ' ' || eu.l_name AS student_name
  FROM test_taken tt
       JOIN test       t  USING (test_id)
       JOIN enrollment e  USING (enrollment_id)
       JOIN end_user   eu ON    (eu.user_id  = e.student_id)
       JOIN section    s  ON    (s.section_id = e.section_id)
       JOIN class      c  USING (class_id)
 WHERE s.teacher_id = :teacher_id">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="teacher_id" SessionField="UserID" />
        </SelectParameters>
    </asp:SqlDataSource>
    </main>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="teacherPageSpecificJS" runat="server">
</asp:Content>
