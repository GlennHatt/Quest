<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Pages/teacher.master" AutoEventWireup="true" CodeBehind="Database.aspx.cs" Inherits="QuestWebApp.test_pond.Database" %>
<asp:Content ID="Content1" ContentPlaceHolderID="teacherBreadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="teacherHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="teacherExtraReferances" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="teacherWithSidebarSidebar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="teacherWithSidebarBodyContent" runat="server">
    <asp:SqlDataSource ID="end_user_list" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" SelectCommand="
        SELECT USER_ID, F_NAME, L_NAME, PERMISSION_LEVEL, EMAIL, PASSWORD FROM END_USER" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" />
    <asp:GridView ID="end_user" runat="server" DataSourceID="end_user_list" AutoGenerateColumns="False" DataKeyNames="USER_ID" >
        <Columns>  
            <asp:BoundField DataField="F_NAME" HeaderText="First Name" SortExpression="F_NAME" />
            <asp:BoundField DataField="L_NAME" HeaderText="Last Name" SortExpression="L_NAME" />
            <asp:BoundField DataField="PERMISSION_LEVEL" HeaderText="Permission" SortExpression="PERMISSION_LEVEL" />
            <asp:BoundField DataField="EMAIL" HeaderText="e-mail" SortExpression="EMAIL" />
            <asp:ButtonField ButtonType="Button" Text="Active">
            <ItemStyle BackColor="#33CC33" BorderColor="#33CC33" ForeColor="#33CC33" />
            </asp:ButtonField>
        </Columns> 
    </asp:GridView>
    <asp:Button ID="btnUpdate" runat="server" Text="Button" />
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="teacherPageSpecificJS" runat="server">
</asp:Content>
