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
    <asp:SqlDataSource ID="sqlMultipleChoiceBody" runat="server" ConnectionString="<%$ ConnectionStrings:GlennLocalHost %>" ProviderName="<%$ ConnectionStrings:GlennLocalHost.ProviderName %>" SelectCommand="SELECT choice_id, question_id, choice_text, set_order
  FROM question_multiple_choice_body
 WHERE question_id = :p_QuestionID">
        <SelectParameters>
            <asp:SessionParameter Name="p_QuestionID" SessionField="QuestionID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Label ID="lblMultipleChoiceBody"  runat="server" Text="ChoiceBody"></asp:Label>
    <asp:GridView ID="grdMultipleChoiceBody" runat="server" AutoGenerateColumns="False" DataKeyNames="CHOICE_ID" DataSourceID="sqlMultipleChoiceBody">
        <Columns>
            <asp:BoundField DataField="QUESTION_ID" HeaderText="QUESTION_ID" SortExpression="QUESTION_ID" />
            <asp:BoundField DataField="CHOICE_TEXT" HeaderText="CHOICE_TEXT" SortExpression="CHOICE_TEXT" />
            <asp:BoundField DataField="SET_ORDER" HeaderText="SET_ORDER" SortExpression="SET_ORDER" />
        </Columns>
    </asp:GridView>
    <br />
    <asp:Button ID="btnNewMultipleChoice" runat="server" Text="Add Choice" OnClick="btnNewMultipleChoice_Click"/>
    <br />
    <asp:Button ID="btnAddQuestion" runat="server" Text="Add A Question" OnClick="btnAddQuestion_Click" />
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="teacherPageSpecificJS" runat="server">
</asp:Content>
