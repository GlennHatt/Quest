﻿<%@ Page Title=" Admin | Help " Language="C#" MasterPageFile="~/Master-Pages/admin.master" AutoEventWireup="true" CodeBehind="adminHelp.aspx.cs" Inherits="QuestWebApp.Pages.adminHelp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="adminBreadcrumbs" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="adminHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="adminExtraReferances" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="adminWithSidebarSidebar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="adminWithSidebarBodyContent" runat="server">
    <div class="demo-card-square mdl-card mdl-shadow--2dp" id="cardHelp" runat="server" style="width: 44%; float: none; margin-top: 16px; margin-bottom: 16px;">
        <div class="mdl-card__supporting-text mdl-card--expand" style="text-align: center; width: 94%;">
                    <asp:Label class="mdl-textfield__label" ID="lblNeedHelp" runat="server" Text=" Need Help with Something? Refer to Our User Manual: " Style="color:black; text-align:center" />
            <br />
            <br />
            <br />
            <br />
            <asp:Button runat="server" ID="btnPDF" Text="User Manual" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" OnClick="btnPDF_Click"> </asp:Button>
            </div>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="adminPageSpecificJS" runat="server">
</asp:Content>
