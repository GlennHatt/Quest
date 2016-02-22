<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Pages/student.master" AutoEventWireup="true" CodeBehind="StudentDashboard.aspx.cs" Inherits="QuestWebApp.Pages.StudentDashboard" %>

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


            <div class="mdl-cell mdl-cell--6-col">


                <!-- Square card -->

                <div class="demo-card-square mdl-card mdl-shadow--2dp" style="text-align: center">
                    <div class="mdl-card__title mdl-card--expand" style="text-align: center">
                        <img src="../Assets/Images/greek.png" style="height: 25%; width: 25%; padding-left: 38%;" />
                    </div>
                    <div class="mdl-card__title" style="text-align: center">
                        <div class="mdl-card__supporting-text" style="font-size: 250%;">
                            <asp:Label ID="lblStudentGreeting" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                    <div class="mdl-card__supporting-text">
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                        Aenan convallis.
                    </div>
                </div>




            </div>




            <div class="mdl-cell mdl-cell--6-col">
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

                <div class="mdl-card mdl-shadow--3dp  demo-card-square">
                    <div class="mdl-card__supporting-text " style="text-align: center">
                        <i class="material-icons testAlert">assignment_late</i>
                        <div style="font-size: 300%; margin-bottom: 7%; margin-top: 5%;">Test Due:</div>
                        <asp:Label ID="lblTestSubject" runat="server" Text="(Subject Placeholder)"></asp:Label><br />
                        <asp:Label ID="lblTestDate" runat="server" Text="(Date Placeholder)"></asp:Label><br />
                        <asp:Label ID="lblTestTime" runat="server" Text="(Time Placeholder)"></asp:Label><br />
                    </div>
                    <div style="text-align: right">
                        <br />
                        <asp:LinkButton ID="btnTaketest" runat="server" class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" Style="background-color: #EE7600; color: white; left: -13px; bottom: 10px;">
                            Take Test
                        </asp:LinkButton>
                    </div>
                </div>
            </div>




        </div>
    </main>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="studentPageSpecificJS" runat="server">
</asp:Content>
