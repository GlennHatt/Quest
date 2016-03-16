<%@ Page Title="Student | Pre-Test" Language="C#" MasterPageFile="~/Master-Pages/withoutSidebar.master" AutoEventWireup="true" CodeBehind="studentPreTest.aspx.cs" Inherits="QuestWebApp.Pages.studentPreTest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="withoutSidebarBreadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="withoutSidebarHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="withoutSidebarExtraReferances" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="withoutSidebarHeadBodyContent" runat="server">

    <!-- Wide card with share menu button -->
    <style>
        .demo-card-wide.mdl-card {
            width: 58%;
            margin: 0 auto;
            margin-top: 10%;
        }
    </style>

    <div class="demo-card-wide mdl-card mdl-shadow--3dp" style="text-align: center">
        <div class="mdl-card__supporting-text" style="text-align: center">
            <h1>Test Time!</h1>
            <div style="font-size: 150%">
                You have
                            <asp:Label runat="server"> 0 </asp:Label>
                minutes to finish your Test! Good Luck!
            </div>
            <br />
            <br />
            <asp:linkbutton runat="server" id="btnNotReady" class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" style="margin-left: 5%; margin-bottom:-60px" ForeColor="#FF3300">
            I am NOT Ready
            </asp:linkbutton>
            <asp:linkbutton runat="server" id="btnReady" class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" style="margin-left: 5%; margin-bottom:-60px">
            I am Ready
            </asp:linkbutton>
            <br />
            <br />
            <br />
            <br />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="withoutSidebarPageSpecificJS" runat="server">
</asp:Content>
