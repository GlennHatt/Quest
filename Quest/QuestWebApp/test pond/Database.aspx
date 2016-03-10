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
    <asp:SqlDataSource ID="sqlTest" runat="server" ConnectionString="<%$ ConnectionStrings:GlennLocalHost %>" SelectCommand="
  SELECT *
    FROM end_user" ProviderName="System.Data.OleDb" />
    <asp:GridView ID="grdTest" runat="server" DataSourceID="sqlTest" AutoGenerateColumns="False" DataKeyNames="USER_ID" >
        <Columns>
            <asp:BoundField DataField="USER_ID" HeaderText="USER_ID" ReadOnly="True" SortExpression="USER_ID" />
            <asp:BoundField DataField="F_NAME" HeaderText="F_NAME" SortExpression="F_NAME" />
            <asp:BoundField DataField="L_NAME" HeaderText="L_NAME" SortExpression="L_NAME" />
            <asp:BoundField DataField="PERMISSION_LEVEL" HeaderText="PERMISSION_LEVEL" SortExpression="PERMISSION_LEVEL" />
        </Columns>
</asp:GridView>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="teacherPageSpecificJS" runat="server">
</asp:Content>