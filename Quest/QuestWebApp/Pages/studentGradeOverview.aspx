<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Pages/student.master" AutoEventWireup="true" CodeBehind="studentGradeOverview.aspx.cs" Inherits="QuestWebApp.Pages.gradeOverview" %>
<asp:Content ID="Content1" ContentPlaceHolderID="studentBreadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="studentHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="studentExtraReferances" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="studentSidebar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="studentWithSidebarBodyContent" runat="server">
    <asp:SqlDataSource ID="sqlTestGrade" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
SELECT grade
  FROM test_taken
 WHERE test_taken_id = :sessionTestTakenID">
        <SelectParameters>
            <asp:SessionParameter Name="sessionTestTakenID" SessionField="TestTakenID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Label ID="lblYourGrade" runat="server" Text="Your approximate grade is: "></asp:Label>
    <asp:Label ID="lblGrade" runat="server" Text="" ></asp:Label>
    <br />
    <asp:Button ID="btnRedirect" runat="server" Text="Go to Dashboard" OnClick="btnRedirect_Click" />
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="studentPageSpecificJS" runat="server">
</asp:Content>
