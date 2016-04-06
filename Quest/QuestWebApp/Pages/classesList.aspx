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
    <asp:SqlDataSource ID="classes_list" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" SelectCommand="
        SELECT CLASS_ID, CODE, TITLE FROM CLASS " ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" />
    <asp:GridView ID="classes" runat="server" DataSourceID="classes_list" AutoGenerateColumns="False" DataKeyNames="CLASS_ID" >
        <Columns>  
            <asp:BoundField DataField="CLASS_ID" HeaderText="Class ID" SortExpression="CLASS_ID" />
            <asp:BoundField DataField="CODE" HeaderText="Class Code" SortExpression="CODE" />
            <asp:BoundField DataField="TITLE" HeaderText="Class Title" SortExpression="TITLE" />
        </Columns> 
    </asp:GridView>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="teacherPageSpecificJS" runat="server">
</asp:Content>
