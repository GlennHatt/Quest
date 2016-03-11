<%@ Page Title="Admin | Users" Language="C#" MasterPageFile="~/Master-Pages/admin.master" AutoEventWireup="true" CodeBehind="AdminUser.aspx.cs" Inherits="QuestWebApp.Pages.AdminUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="adminBreadcrumbs" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="adminHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="adminExtraReferances" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="adminWithSidebarSidebar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="adminWithSidebarBodyContent" runat="server">
    <div class="mdl-card mdl-shadow--3dp demo-card-wide " style="width: 60%; left: 26%;">
    <asp:GridView CssClass="mdl-data-table mdl-js-data-table mdl-data-table mdl-shadow--2dp customTable" ID="GVUser" runat="server" AutoGenerateColumns="False" DataSourceID="sqlAdminUsers" OnSelectedIndexChanged="GVUser_SelectedIndexChanged">
        <Columns>
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
    <asp:SqlDataSource ID="sqlAdminUsers" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="select email Email, f_name FirstName, l_name LastName, password, permission_level Classification
from end_user"></asp:SqlDataSource>
        </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="adminPageSpecificJS" runat="server">
</asp:Content>
