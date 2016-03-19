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
    <link href="../Assets/Styles/ResponsiveTable.css" rel="stylesheet" />
<asp:GridView CssClass="mdl-data-table mdl-js-data-table mdl-data-table mdl-shadow--2dp customTable2" ID="GVUser" runat="server" RowStyle-Wrap="false" AutoGenerateColumns="False" DataSourceID="sqlAdminUsers">
    
        <Columns >
            <asp:BoundField DataField="EMAIL" HeaderText="E-Mail" SortExpression="EMAIL" />
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

	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable = no">
    <link href="styles/basic.css" type="text/css" rel="stylesheet" />
    <script src="scripts/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="scripts/jquery.responsivetable.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            setupResponsiveTables();
        });

        function setupResponsiveTables() {
            $('.responsiveTable1').responsiveTable({ 
                staticColumns: 2,
                scrollRight: false, 
                scrollHintEnabled: true,
                scrollHintDuration: 3000
            });
        }
    </script>
    <h1>Responsive GridView</h1>
    <h2>Advanced Options Demo</h2>
    <p>Some extra options are configured in this demo:</p>
    <ul>
        <li>Two columns are kept in place when the Responsive GridView is triggered</li>
        <li>The scrollable area is configured to scroll to the left instead of the right</li>
        <li>The user hint to scroll the table left and right is displayed for 3 seconds instead of the default 2 seconds</li>
    </ul>
        <h3>Task List</h3>
       <asp:GridView CssClass="mdl-data-table mdl-js-data-table mdl-data-table mdl-shadow--2dp customTable2" ID="GridView1" runat="server" RowStyle-Wrap="false" AutoGenerateColumns="False" DataSourceID="sqlAdminUsers">
    
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
       
        <p>
            <asp:LinkButton ID="LinkButton1" runat="server" Text="Back to Menu" PostBackUrl="~/Default.aspx"></asp:LinkButton>
        </p>
        	  <asp:SqlDataSource ID="sqlAdminUsers" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="select email Email, f_name FirstName, l_name LastName, password, permission_level Classification
from end_user"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="adminPageSpecificJS" runat="server">
</asp:Content>
