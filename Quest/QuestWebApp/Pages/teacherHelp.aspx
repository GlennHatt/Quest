<%@ Page Title="Teacher | Help" Language="C#" MasterPageFile="~/Master-Pages/teacher.master" AutoEventWireup="true" CodeBehind="teacherHelp.aspx.cs" Inherits="QuestWebApp.Pages.teacherHelp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="teacherBreadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="teacherHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="teacherExtraReferances" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="teacherWithSidebarSidebar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="teacherWithSidebarBodyContent" runat="server">
    <div class="demo-card-square mdl-card mdl-shadow--2dp" id="cardHelp" runat="server" style="width: 44%; float: none; margin-top: 16px; margin-bottom: 16px;">
        <div class="mdl-card__supporting-text mdl-card--expand" style="text-align: center; width: 94%;">
                    <asp:Label class="mdl-textfield__label" ID="lblNeedHelp" runat="server" Text=" Need Help with Something? Refer to Our User Manual: " Style="color:black; text-align:center" />
          <br />
            <br />
            <br />
            <br />
            <a ID="btnPDF" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" href="../Assets/User Manual/The User Manual (1).pdf" target="_blank">User Manual</a>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="teacherPageSpecificJS" runat="server">
</asp:Content>
