<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Pages/student.master" AutoEventWireup="true" CodeBehind="anothertest.aspx.cs" Inherits="QuestWebApp.Pages.anothertest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="studentBreadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="studentHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="studentExtraReferances" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="studentSidebar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="studentWithSidebarBodyContent" runat="server">



    <main class="mdl-layout__content">
        <div class="content-grid mdl-grid">
            <div class="mdl-cell mdl-cell--12-col ">
                <!-- Card for Creating a test -->


                <div class="demo-card-wide mdl-shadow--3dp ">
                    <div class="mdl-card__supporting-text" style="text-align: center">
                        <i class="material-icons testAlert">assignment_late</i>
                        <div style="font-size: 300%; margin-bottom:7%; margin-top: 5%;">Test Due:</div>
                        <asp:Label ID="lblTestSubject" runat="server" Text="(Subject Placeholder)"></asp:Label><br />
                        <asp:Label ID="lblTestDate" runat="server" Text="(Date Placeholder)"></asp:Label><br />
                        <asp:Label ID="lblTestTime" runat="server" Text="(Time Placeholder)"></asp:Label><br />
                    </div>
                    <div style="text-align: right">
                        <asp:LinkButton ID="btnTaketest" runat="server" class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" Style="background-color: #EE7600; color: white; left: -13px; bottom: 10px;">
                            Take Test
                        </asp:LinkButton>
                    </div>
                </div>
            </div>

            <div class="mdl-cell mdl-cell--12-col">
                <!-- Card for Informing the Teacher how many test they have to grade -->


                <div class="demo-card-wide mdl-shadow--3dp">
                    <div class="mdl-card__supporting-text" style="text-align: center">
                        <h1>You Have
                            <asp:Label ID="lblTestsToGrade" runat="server" Text="0"></asp:Label>
                            Tests to Grade </h1>
                    </div>
                </div>
            </div>
        </div>
    </main>


</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="studentPageSpecificJS" runat="server">
</asp:Content>
