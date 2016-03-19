<%@ Page Title="Admin | Users" Language="C#" MasterPageFile="~/Master-Pages/admin.master" AutoEventWireup="true" CodeBehind="adminUser.aspx.cs" Inherits="QuestWebApp.Pages.AdminUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="adminBreadcrumbs" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="adminHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="adminExtraReferances" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="adminWithSidebarSidebar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="adminWithSidebarBodyContent" runat="server">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width">
<%--    <div class="mdl-card mdl-shadow--3dp demo-card-wide " style="width: 850px;">--%>
<asp:GridView CssClass="mdl-data-table mdl-js-data-table mdl-data-table mdl-shadow--2dp customTable2" ID="GVUser" runat="server" RowStyle-Wrap="false" AutoGenerateColumns="False" DataSourceID="sqlAdminUsers">
    
        <Columns>
            <asp:BoundField  DataField="EMAIL" HeaderText="E-Mail" SortExpression="EMAIL" />
            <asp:BoundField DataField="FIRSTNAME" HeaderText="First Name" SortExpression="FIRSTNAME" />
            <asp:BoundField DataField="LASTNAME" HeaderText="Last Name" SortExpression="LASTNAME" />
            <asp:BoundField DataField="PASSWORD" HeaderText="Password" SortExpression="PASSWORD" />
            <asp:BoundField DataField="CLASSIFICATION" HeaderText="Classification" SortExpression="CLASSIFICATION" />
            <asp:TemplateField HeaderText="Active">
            <ItemTemplate>
                <asp:LinkButton class="mdl-button mdl-js-button mdl-button--raised" ID="activeButton" runat="server" Text="Active" BackColor="Green"></asp:LinkButton> 
            </ItemTemplate>
        </asp:TemplateField>
        </Columns>
    
    </asp:GridView>
        <script src="../Assets/JS/ResponsiveTable.js"></script>



	<link href="styles/basic.css" type="text/css" rel="stylesheet" />
    <script src="scripts/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="scripts/jquery.responsivetable.min.js" type="text/javascript"></script>
    <script src="../Assets/JS/jquery.responsivetable.min.js"></script>
    <script src="../Assets/JS/ResponsiveTable.js"></script>
    <script src="../Assets/JS/gridview3.js"></script>

        	  <asp:SqlDataSource ID="sqlAdminUsers" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="select email Email, f_name FirstName, l_name LastName, password, permission_level Classification
from end_user"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="adminPageSpecificJS" runat="server">
</asp:Content>
