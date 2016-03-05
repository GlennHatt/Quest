<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Pages/takingTest.master" AutoEventWireup="true" CodeBehind="takingTestTest.aspx.cs" Inherits="QuestWebApp.Pages.takingTestTest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="takingTestBreadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="takingTestHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="takingTestExtraReferances" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="takingTestBodyContent" runat="server">

    <asp:Label ID="lblTesting" runat="server" Text="1"></asp:Label>
    <br /><br />

    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="sqlTestQuestions">
            <ItemTemplate>
          <tr>
            <td>
              <asp:Label runat="server" ID="Label1" Text='<%# Eval("question_id") %>' />
            </td>
            <td>
              <asp:Label runat="server" ID="Label3" Text='<%# Eval("weight") %>' />
            </td>
            <td>
              <asp:Label runat="server" ID="Label4" Text='<%# Eval("type") %>' />
            </td>
              <br />
          </tr>
        </ItemTemplate>
</asp:Repeater>

    <asp:SqlDataSource ID="sqlTestQuestions" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="SELECT question_id, test_id, weight, type FROM QUESTION
WHERE TEST_ID = 1"></asp:SqlDataSource>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="takingTestPageSpecificJS" runat="server">
</asp:Content>