<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Pages/teacher.master" AutoEventWireup="true" CodeBehind="DBTestPage.aspx.cs" Inherits="QuestWebApp.test_pond.DBTestPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="teacherBreadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="teacherHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="extraReferances" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="teacherBody" runat="server">
    <asp:SqlDataSource ID="SQLTest" runat="server" ConnectionString="Provider=MSDAORA;Data Source=CS414;Persist Security Info=True;Password=CS414team1;User ID=CS414s16" ProviderName="System.Data.OleDb" SelectCommand="
SELECT *
  FROM END_USER" />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SQLTest"></asp:GridView>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="teacherPageSpecificJS" runat="server">
</asp:Content>
