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
    <asp:SqlDataSource ID="sqlAddQuestion" runat="server" ConnectionString="<%$ ConnectionStrings:GlennLocalHost %>" InsertCommand="
BEGIN
  :v_Dummy := QUESTIONS.add(
    p_TestID =&gt; :p_TestID,
    p_Weight =&gt; :p_Weight,
    P_Type   =&gt; :p_Type);
END;" ProviderName="<%$ ConnectionStrings:GlennLocalHost.ProviderName %>" SelectCommand="
SELECT *
  FROM question">
        <InsertParameters>
            <asp:Parameter DbType="Int32" Direction="Output" Name="v_Dummy" />
            <asp:SessionParameter DbType="Int32" Name="p_TestID" SessionField="Test_ID" />
            <asp:ControlParameter ControlID="txtAddWeight" Name="p_Weight" PropertyName="Text" />
            <asp:ControlParameter ControlID="rblAddType" Name="p_Type" PropertyName="SelectedValue" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:Label ID="lblAddWeight" runat="server" AssociatedControlID="txtAddWeight" Text="Point Value: " />
    <asp:TextBox ID="txtAddWeight" runat="server" />
    <br />
    <br />
    <asp:Label ID="lblAddType" runat="server" Text="Question Type:" /><br />
    <asp:RadioButtonList ID="rblAddType" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rblAddType_SelectedIndexChanged">
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
    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="btnAddQuestion" runat="server" Text="Add A Question" OnClick="btnAddQuestion_Click" />
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="teacherPageSpecificJS" runat="server">
</asp:Content>
