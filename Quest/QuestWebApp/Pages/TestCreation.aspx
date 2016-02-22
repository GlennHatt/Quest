<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Pages/teacher.master" AutoEventWireup="true" CodeBehind="testCreation.aspx.cs" Inherits="QuestWebApp.Pages.testCreation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="teacherBreadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="teacherHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="teacherExtraReferances" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="teacherWithSidebarSidebar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="teacherWithSidebarBodyContent" runat="server">
    <asp:SqlDataSource ID="SQLSectionSelect" runat="server" ConnectionString="<%$ ConnectionStrings:GlennLocalHost %>" ProviderName="<%$ ConnectionStrings:GlennLocalHost.ProviderName %>" SelectCommand="
SELECT section_id, c.code || '-' || section_number AS section_title
  FROM section s
       JOIN class c USING (class_id)"></asp:SqlDataSource>
    <asp:Label ID="lblSection" runat="server" Text="Section: " />
    <asp:DropDownList ID="ddlSection" runat="server" DataSourceID="SQLSectionSelect" DataTextField="section_title" DataValueField="section_id" />

    <asp:Label ID="lblName" runat="server" Text="Name: " />
    <asp:TextBox ID="txtName" runat="server" />

    <asp:Label ID="lblTimeLimit" runat="server" Text="Time Limit: " />

    <asp:Label ID="lblDate" runat="server" Text="Date: " />

    <asp:Button ID="btnAddInfo" runat="server" Text="Press Me"  />

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="teacherPageSpecificJS" runat="server">
</asp:Content>
