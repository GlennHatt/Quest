<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Pages/takingTest.master" AutoEventWireup="true" CodeBehind="takingTestTest.aspx.cs" Inherits="QuestWebApp.Pages.takingTestTest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="takingTestBreadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="takingTestHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="takingTestExtraReferances" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="takingTestBodyContent" runat="server">

<main class="mdl-layout__content">
    
    <%--<asp:Label ID="lblTesting" runat="server" Text="1"></asp:Label>--%>
    <br /><br />
    <asp:SqlDataSource ID="sqlTestQuestions" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
SELECT question_true_false.question_text tf_question, question.question_id quest_id
  FROM QUESTION, QUESTION_TRUE_FALSE
 WHERE question.TEST_ID = 1 and question.question_id = question_true_false.question_id" InsertCommand="BEGIN
   questions_true_false.grade_question(
    p_TestTakenID   =&gt; :p_TestTakenID,
    p_QuestionID    =&gt; :p_QuestionID,
    p_StudentAnswer =&gt; :p_Answer);
END;">
        <InsertParameters>
            <asp:Parameter Name="p_TestTakenID" />
            <asp:Parameter Name="p_QuestionID" />
            <asp:Parameter Name="p_Answer" />
        </InsertParameters>
    </asp:SqlDataSource>

        <asp:ListView ID="lvTest" runat="server" DataSourceID="sqlTestQuestions">
            <ItemTemplate>
                    <div class="mdl-cell mdl-cell--4-col">
                        <div class="demo-card-wide mdl-card-addClass mdl-shadow--6dp demo-card-square mdl-card">
                            <div class="mdl-card__supporting-text" style="text-align: center">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <asp:Label ID="Label1" class="mdl-textfield__input" Text='<%# Eval("quest_id") %>' runat="server" Visible="false" />
                                    <asp:Label ID="Label2" class="mdl-textfield__input" Text='<%# Eval("tf_question") %>' runat="server" />
                                    <asp:RadioButton ID="rdbTrue" class="mdl-radio__button" Text="True" runat="server" GroupName="TFChoice" />
                                    <br />
                                    <asp:RadioButton ID="rdbFalse" class="mdl-radio__button" Text="False" runat="server" GroupName="TFChoice" />
                                </div>
                            </div>
                        </div>
                    </div>
            </ItemTemplate>
        </asp:ListView>
    <asp:Button ID="btnSubmitTest" runat="server" Text="Submit Test" OnClick="btnSubmitTest_Click" />
</main>
    <asp:TextBox ID="txtTestAnswer" runat="server" Height="52px" Width="257px"></asp:TextBox>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="takingTestPageSpecificJS" runat="server">
</asp:Content>