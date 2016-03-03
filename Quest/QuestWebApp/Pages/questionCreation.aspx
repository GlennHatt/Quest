<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Pages/teacher.master" AutoEventWireup="true" CodeBehind="questionCreation.aspx.cs" Inherits="QuestWebApp.Pages.questionCreation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="teacherBreadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="teacherHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="teacherExtraReferances" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="teacherWithSidebarSidebar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="teacherWithSidebarBodyContent" runat="server">
    <asp:Label ID="lblAddWeight" runat="server" AssociatedControlID="txtAddWeight" Text="Point Value: " />
    <asp:TextBox ID="txtAddWeight" runat="server" />
    <br />
    <br />
    <asp:Label ID="lblAddType" runat="server" Text="Question Type:" /><br />
    <asp:RadioButtonList ID="rblAddType" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rblAddType_SelectedIndexChanged" AutoPostBack="true">
        <asp:ListItem Text="Essay" Value="E" />
        <asp:ListItem Text="Matching" Value="M" />
        <asp:ListItem Text="Multiple Choice" Value="MC" />
        <asp:ListItem Text="Short Answer" Value="SA" />
        <asp:ListItem Text="True/False" Value="TF" />
    </asp:RadioButtonList>
    <br />
    <asp:Label ID="lblAddQuestionText" runat="server" Text="Question Text: " />
    <asp:TextBox ID="txtAddQuestionText" runat="server" />
    <br />
    <asp:Label ID="lblAddAnswer" runat="server" Text="Answer:" />
    <br />
    <asp:RadioButtonList ID="rblAddTFAnswer" runat="server" RepeatDirection="Horizontal">
        <asp:ListItem Text="True" Value="T" />
        <asp:ListItem Text="False" Value="F" />
    </asp:RadioButtonList>
    <br />
    <asp:Label ID="lblBeforeText" runat="server" Text="Before Text: " />
    <asp:TextBox ID="txtBeforeText" runat="server" />
    <br />
    <asp:Label ID="lblAnswerText" runat="server" Text="Answer Text: " />
    <asp:TextBox ID="txtAnswerText" runat="server" />
    <br />
    <asp:Label ID="lblAfterText" runat="server" Text="After Text: " />
    <asp:TextBox ID="txtAfterText" runat="server" />
    <br />
    <asp:Label ID="lblMultipleChoiceBody" runat="server" Text="ChoiceBody"></asp:Label>
    <asp:Repeater ID="rptMultipleChoiceBody" runat="server">
        <ItemTemplate>
            <asp:RadioButton ID="rbnMultipleChoiceBody" runat="server" GroupName="grpMultipleChoice" />
            <asp:TextBox ID="txtMultipleChoiceBody" runat="server" />
        </ItemTemplate>
    </asp:Repeater>
    <br />
    <asp:Button ID="btnNewMultipleChoice" runat="server" Text="Add Choice" OnClick="btnNewMultipleChoice_Click"/>
    <br />
    <asp:Button ID="btnAddQuestion" runat="server" Text="Add A Question" OnClick="btnAddQuestion_Click" />
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="teacherPageSpecificJS" runat="server">
</asp:Content>
