<%@ Page Title="Student | Grade Overview" Language="C#" MasterPageFile="~/Master-Pages/student.master" AutoEventWireup="true" CodeBehind="studentGradeOverview.aspx.cs" Inherits="QuestWebApp.Pages.gradeOverview" %>
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
        <div class="demo-card-wide mdl-shadow--3dp mdl-card" style="width: 41%; left: 30%;">
        <div class="mdl-card__supporting-text" style="text-align: center">
            <br />

            <div style="font-size: 200%">Grade Overview </div>
            <br />
 <asp:Label ID="lblYourGrade" runat="server" Text="Your approximate grade is: "></asp:Label>
            <br />
            <br />
    <asp:Label ID="lblGrade" runat="server" Text="" ></asp:Label>
            <br />
            <br />
             <asp:LinkButton CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" ForeColor="White" ID="btnRedirect" runat="server" OnClick="btnRedirect_Click" >
                            Go to Dashboard
                </asp:LinkButton>
        </div>
    </div>
   
    <br />
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="studentPageSpecificJS" runat="server">
</asp:Content>
