<%@ Page Title="Admin | Classes " Language="C#" MasterPageFile="~/Master-Pages/withSidebar.master" AutoEventWireup="true" CodeBehind="AdminClasses.aspx.cs" Inherits="QuestWebApp.Pages.AdminClasses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="breadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="extraReferances" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="withSidebarSidebar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="withSidebarBodyContent" runat="server">
    <div class="mdl-card mdl-shadow--3dp demo-card-wide " style="width: 50%; left: 26%;">
    <asp:GridView CssClass="mdl-data-table mdl-js-data-table mdl-data-table mdl-shadow--2dp customTable" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="sqlAdminClasses">
        <Columns>
            <asp:BoundField DataField="CODE" HeaderText="CODE" SortExpression="CODE"></asp:BoundField>
            <asp:BoundField DataField="TITLE" HeaderText="TITLE" SortExpression="TITLE"></asp:BoundField>
            <asp:BoundField DataField="SECTION_NUMBER" HeaderText="SECTION_NUMBER" SortExpression="SECTION_NUMBER"></asp:BoundField>
            <asp:BoundField DataField="L_NAME" HeaderText="L_NAME" SortExpression="L_NAME"></asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="sqlAdminClasses" ConnectionString='<%$ ConnectionStrings:ProductionDB %>' ProviderName='<%$ ConnectionStrings:ProductionDB.ProviderName %>' SelectCommand="select class.code, class.title, section.section_number, end_user.l_name 
from class, section, end_user 
where end_user.user_id = section.teacher_id
and section.class_id = class.class_id"></asp:SqlDataSource>
</div>
    <asp:Button ID="Button1" runat="server" Text="Hey Lorenzo" OnClick="Button1_Click" />

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="pageSpecificJS" runat="server">
</asp:Content>
