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

        <asp:ListView ID="lvTFQuestions" runat="server" DataSourceID="sqlTestQuestions">
            <ItemTemplate>
                    <div class="mdl-cell mdl-cell--12-col">
                        <div class="demo-card-wide mdl-card-addClass mdl-shadow--6dp demo-card-square mdl-card">
                            <div class="mdl-card__supporting-text" style="text-align: center">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <asp:Label ID="Label1" class="mdl-textfield__input" Text='<%# Eval("quest_id") %>' runat="server" Visible="false" />
                                    <asp:Label ID="Label2" class="mdl-textfield__input" Text='<%# Eval("tf_question") %>' runat="server" />
                                    <asp:RadioButton ID="rdbTrue" class="mdl-radio__button" Text="True" runat="server" GroupName="TFChoice" />
                                    <asp:RadioButton ID="rdbFalse" class="mdl-radio__button" Text="False" runat="server" GroupName="TFChoice" />
                                </div>
                            </div>
                        </div>
                    </div>
            </ItemTemplate>
        </asp:ListView>
        <asp:ListView ID="lvEssayQuestions" runat="server" DataSourceID="sqlEssayQuestions">
            <ItemTemplate>
                    <div class="mdl-cell mdl-cell--12-col">
                        <div class="demo-card-wide mdl-card-addClass mdl-shadow--6dp demo-card-square mdl-card">
                            <div class="mdl-card__supporting-text" style="text-align: center">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <asp:Label ID="Label1" class="mdl-textfield__input" Text='<%# Eval("quest_id") %>' runat="server" Visible="false" />
                                    <asp:Label ID="Label2" class="mdl-textfield__input" Text='<%# Eval("essay_question") %>' runat="server" />
                                    <asp:TextBox ID="TextBox1" runat="server" Height="50px" Width="300px" TextMode="MultiLine" ToolTip="Enter Answer Here"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
            </ItemTemplate>
        </asp:ListView>
        <asp:ListView ID="lvShortAnswerQuestions" runat="server" DataSourceID="sqlShortAnswerQuestions">
            <ItemTemplate>
                    <div class="mdl-cell mdl-cell--12-col">
                        <div class="demo-card-wide mdl-card-addClass mdl-shadow--6dp demo-card-square mdl-card">
                            <div class="mdl-card__supporting-text" style="text-align: center">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <asp:Label ID="Label1" class="mdl-textfield__input" Text='<%# Eval("quest_id") %>' runat="server" Visible="false" />
                                    <asp:Label ID="Label2" class="mdl-textfield__input" Text='<%# Eval("before_sa_question") %>' runat="server" />
                                    <asp:TextBox ID="TextBox1" runat="server" TextMode="SingleLine" ToolTip="Enter Answer Here"></asp:TextBox>
                                    <asp:Label ID="Label3" class="mdl-textfield__input" Text='<%# Eval("after_sa_question") %>' runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>
            </ItemTemplate>
        </asp:ListView>
        <asp:ListView ID="lvMultipleChoiceQuestions" runat="server">
            <ItemTemplate>
                    <div class="mdl-cell mdl-cell--12-col">
                        <div class="demo-card-wide mdl-card-addClass mdl-shadow--6dp demo-card-square mdl-card">
                            <div class="mdl-card__supporting-text" style="text-align: center">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <asp:Label ID="Label1" class="mdl-textfield__input" Text='<%# Eval("quest_id") %>' runat="server" Visible="false" />
                                    <asp:Label ID="Label2" class="mdl-textfield__input" Text='<%# Eval("before_sa_question") %>' runat="server" />
                                    <asp:ListView ID="lvMultipleChoiceAnswers" runat="server">
                    <ItemTemplate>
                        <div class="mdl-cell mdl-cell--12-col">
                            <div class="demo-card-wide mdl-card-addClass mdl-shadow--6dp demo-card-square mdl-card">
                                <div class="mdl-card__supporting-text" style="text-align: center">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <asp:Label ID="Label1" class="mdl-textfield__input" Text='<%# Eval("quest_id") %>' runat="server" Visible="false" />
                                        <asp:Label ID="Label2" class="mdl-textfield__input" Text='<%# Eval("before_sa_question") %>' runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                                    </asp:ListView>
                                </div>
                            </div>
                        </div>
                    </div>
            </ItemTemplate>
        </asp:ListView>
    <asp:SqlDataSource ID="sqlShortAnswerQuestions" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
SELECT question_short_answer.before_text before_sa_question, 
       question_short_answer.after_text after_sa_question, 
       question.question_id quest_id
FROM QUESTION, QUESTION_SHORT_ANSWER
WHERE question.TEST_ID = 1 and question.question_id = question_short_answer.question_id"></asp:SqlDataSource>
    
    <asp:SqlDataSource ID="sqlEssayQuestions" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
SELECT question_essay.question_text essay_question, question.question_id quest_id
FROM QUESTION, QUESTION_ESSAY
WHERE question.TEST_ID = 1 and question.question_id = question_essay.question_id">
    </asp:SqlDataSource>
    <asp:Button ID="btnSubmitTest" runat="server" Text="Submit Test" OnClick="btnSubmitTest_Click" />
</main>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="takingTestPageSpecificJS" runat="server">
</asp:Content>