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
    <%--Link http://ngenioussolutions.com/blog/responsive-gridview-for-mobile-phone-tablet-and-desktop-display-in-asp-net/--%>

    <%--<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width"--%>>
    <%--<div class="mdl-card mdl-shadow--3dp demo-card-wide " style="width: 85%;">--%>
<%--<asp:GridView CssClass="mdl-data-table mdl-js-data-table mdl-data-table mdl-shadow--2dp customTable2 footable" Style="max-width: 500px" ID="GVUser" runat="server" RowStyle-Wrap="false" AutoGenerateColumns="False" DataSourceID="sqlAdminUsers">
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

        <%--</div>--%>

<%--    <link href=”https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/css/footable.min.css”
        rel=”stylesheet” type=”text/css” />
    <script type=”text/javascript” src=”http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js”></script>
    <script type=”text/javascript” src=”https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js”></script>
    <script type=”text/javascript”>
        $(function () {
            $(‘[id*=GridView1]’).footable();
        });
    </script>--%>
 
The HTML Markup consists of an ASP.Net GridView. You have to apply the CSS class footable to the GridView.
    <asp:GridView ID="GridView1" CssClass=”footable” runat="server" AutoGenerateColumns="false"
        Style="max-width: 500px">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" />
            <asp:BoundField DataField="Name" HeaderText="Name" />
            <asp:BoundField DataField="Company" HeaderText="Company" />
            <asp:BoundField DataField="t" HeaderText="Age" />
            <asp:BoundField DataField="k" HeaderText="Age" />
            <asp:BoundField DataField="o" HeaderText="Age" />
            <asp:BoundField DataField="te" HeaderText="Age" />
            <asp:BoundField DataField="ka" HeaderText="Age" />
            <asp:BoundField DataField="ee" HeaderText="Age" />
            <asp:BoundField DataField="aa" HeaderText="Age" />
        </Columns>
    </asp:GridView>


    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/css/footable.min.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript" src=”http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js”></script>
    <script type="text/javascript" src=”https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js”></script>
    <script type="text/javascript">
        $(function () {
            $("[id*=GridView1]").footable();
        });
    </script>

            <script src="../Assets/JS/ResponsiveTable.js"></script>
        	  <asp:SqlDataSource ID="sqlAdminUsers" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="select email Email, f_name FirstName, l_name LastName, password, permission_level Classification
from end_user"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="adminPageSpecificJS" runat="server">
</asp:Content>
