<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Pages/student.master" AutoEventWireup="true" CodeBehind="studentDashboard.aspx.cs" Inherits="QuestWebApp.Pages.studentDash" %>

<asp:Content ID="Content1" ContentPlaceHolderID="studentBreadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="studentHead" runat="server">
    <title>Student | Home</title>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="studentExtraReferances" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="studentSidebar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="studentWithSidebarBodyContent" runat="server">

    <main class="mdl-layout__content" style="width: 99%; padding-right: 1%;">
        <div class="content-grid mdl-grid" style="width: 100%;">
            <div class="mdl-cell mdl-cell--4-col">


                <!-- Square card! -->

                <div class="demo-card-square mdl-card mdl-shadow--2dp" style="text-align: center; height: 250px;">
                    <div class="mdl-card__title mdl-card--expand" style="text-align: center">
                        <img src="../Assets/Images/greek.png" style="height: 122px; width: 25%; padding-left: 38%;" />
                    </div>
                    <div class="mdl-card__title" style="text-align: center;">
                        <div class="mdl-card__supporting-text" style="font-size: 250%; color: rgba(0,0,0,.54); text-align:center; line-height: inherit;">
                            <asp:Label ID="lblStudentGreeting" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </div>




            </div>
</div>
        </main>




            
                
                <!-- Card for When a Test is Due -->

                <style>
                    /*
.demo-card-wide.mdl-card {

  margin:10%;
  width: 400px;
  height: 200px;
} */

                    .testAlert {
                        font-size: 590%;
                        line-height: 130%;
                        color: #EE7600;
                        margin-bottom: -7%;
                    }
                </style>
                <asp:SqlDataSource ID="sqlStudentTests" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
SELECT test_id, 'Test Name: ' || t.title AS test_title, 'Class: ' || c.title AS class_title, 
       'Due Date: ' || TO_DATE( due_date, 'DD-MON-YY') AS due_date, 'Time Limit: ' || time_limit || ' Minutes' AS time_limit
  FROM test t
       JOIN section s USING (section_id)
       JOIN enrollment e USING (section_id)
       JOIN class c      USING (class_id)
 WHERE student_id = :p_StudentID">
                    <SelectParameters>
                        <asp:SessionParameter Name="p_StudentID" SessionField="UserID"/>
                    </SelectParameters>
                </asp:SqlDataSource>
         <main class="mdl-layout__content">
                    <div class="content-grid mdl-grid">      
                <asp:ListView ID="lstStudentTests" runat="server" DataSourceID="sqlStudentTests" OnItemCommand="lstStudentTests_ItemCommand1">
                    <ItemTemplate>
                        <div class="mdl-cell mdl-cell--4-col" id="testAlertTemplate" runat="server">
                        <div class="mdl-card mdl-shadow--3dp  demo-card-square">
                            <div class="mdl-card__supporting-text " style="text-align: center">
                                <i class="material-icons testAlert">assignment_late</i>
                                <div style="font-size: 300%; margin-bottom: 7%; margin-top: 5%;">Test Due:</div>
                                <div style="font-size: 150%;">
                                <asp:Label ID="lblTestSubject" runat="server" Text='<%# Eval("class_title") %>'></asp:Label> <br /> <br />
                                <asp:Label ID="lblTestTitle" runat="server" Text='<%# Eval("test_title") %>'></asp:Label><br /> <br />
                                <asp:Label ID="lblTestDate" runat="server" Text='<%# Eval("due_date") %>'></asp:Label><br /> <br />
                                <asp:Label ID="lblTestTime" runat="server" Text='<%# Eval("time_limit") %>'></asp:Label><br /> <br />
                                </div>
                            </div>
                            <div style="text-align: right">
                                <br />
                                <asp:LinkButton ID="btnTaketest" CommandName="lstStudentTestsLnkBtnClick" CommandArgument='<%#Bind("test_id") %>' runat="server" class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" Style="background-color: #EE7600; color: white; left: -13px; bottom: 10px;">
                                    Take Test
                                </asp:LinkButton>
                            </div>
                        </div>
                            </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>
    </main>

            <div class="mdl-cell mdl-cell--4-col" id="noTestMessage" runat="server">
                
                <!-- Card for When a Test is Due -->

                <style>
                    /*
.demo-card-wide.mdl-card {

  margin:10%;
  width: 400px;
  height: 200px;
} */

                    .noTest {
                        font-size: 590%;
                        line-height: 130%;
                        color: rgb(76,175,80);
                        margin-bottom: -7%;
                    }
                </style>

                <div class="mdl-card mdl-shadow--3dp  demo-card-square">
                    <div class="mdl-card__supporting-text " style="text-align: center">
                        <i class="material-icons noTest">check_circle</i>
                        <div style="font-size: 250%; margin-bottom: 7%; margin-top: 5%;">Congratulations!</div>
                        You're all caught up on tests (for now).
                    </div>
                </div>
            </div>

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="studentPageSpecificJS" runat="server">
</asp:Content>