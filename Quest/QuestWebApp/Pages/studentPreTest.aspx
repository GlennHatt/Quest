<%@ Page Title="Quest Pre-Test" Language="C#" MasterPageFile="~/Master-Pages/withoutSidebar.master" AutoEventWireup="true" CodeBehind="studentPreTest.aspx.cs" Inherits="QuestWebApp.Pages.studentPreTest" %>

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
            width: 700px;
        }
    </style>

    <div class="demo-card-wide mdl-card mdl-shadow--3dp" style="text-align: center">
        <div class="mdl-card__supporting-text" style="text-align: center">
            <h1>Test Time!</h1>
            <div style="font-size:17pt"> You have <asp:Label runat="server"> 0 </asp:Label> minutes to finish your Test! Good Luck!</div>
            <br />
            <br />
            <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent">
                Take Test
            </button>
            <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent">
                I'm Not Ready
            </button>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="withoutSidebarPageSpecificJS" runat="server">
</asp:Content>
