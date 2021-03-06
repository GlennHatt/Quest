﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Pages/student.master" AutoEventWireup="true" CodeBehind="StudentDashboard.aspx.cs" Inherits="QuestWebApp.Pages.StudentDashboard" %>

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

    <main class="mdl-layout__content">
        <div class="content-grid mdl-grid">
            <div class="mdl-cell ">
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

                <div class="demo-card-wide mdl-card mdl-shadow--3dp">
                    <div class="mdl-card__supporting-text " style="text-align: center">
                        <i class="material-icons testAlert">assignment_late</i>
                        <div style="font-size: 300%; margin-bottom:7%; margin-top: 5%;">Test Due:</div><asp:Label ID="lblTestSubject" runat="server" Text="(Subject Placeholder)"></asp:Label><br />
                        <asp:Label ID="lblTestDate" runat="server" Text="(Date Placeholder)"></asp:Label><br />
                        <asp:Label ID="lblTestTime" runat="server" Text="(Time Placeholder)"></asp:Label><br />
                    </div>
                    <div style="text-align: right">
                        <br /><asp:LinkButton ID="btnTaketest" runat="server" class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" Style="background-color: #EE7600; color: white; left: -13px; bottom: 10px;">
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
