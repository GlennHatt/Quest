<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Pages/takingTest.master" AutoEventWireup="true" CodeBehind="takingTestTest.aspx.cs" Inherits="QuestWebApp.Pages.takingTestTest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="takingTestBreadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="takingTestHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="takingTestExtraReferances" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="takingTestBodyContent" runat="server">

<main class="mdl-layout__content">
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
    <asp:Label ID="lblMCIdentity" runat="server" Text="" Visible="true"></asp:Label>

        <!-- TRUE/FALSE QUESTIONS -->
        <asp:ListView ID="lvTFQuestions" runat="server" DataSourceID="sqlTestQuestions">
            <ItemTemplate>
                    <div class="mdl-cell mdl-cell--12-col">
                        <div class="demo-card-wide mdl-card-addClass mdl-shadow--6dp demo-card-square mdl-card">
                            <div class="mdl-card__supporting-text" style="text-align: center">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <asp:Label ID="Label1" class="mdl-textfield__input" Text='<%# Eval("quest_id") %>' runat="server" Visible="false" />
                                    <asp:Label ID="Label2" class="mdl-textfield" Text='<%# Eval("tf_question") %>' runat="server" />
                                    <asp:RadioButton ID="rdbTrue" class="mdl-radio__button" Text="True" runat="server" GroupName="TFChoice" />
                                    <asp:RadioButton ID="rdbFalse" class="mdl-radio__button" Text="False" runat="server" GroupName="TFChoice" />
                                </div>
                            </div>
                        </div>
                    </div>
            </ItemTemplate>
        </asp:ListView>

        <!-- ESSAY QUESTIONS -->
        <asp:ListView ID="lvEssayQuestions"  runat="server" DataSourceID="sqlEssayQuestions">
            <ItemTemplate>
                    <div class="mdl-cell mdl-cell--12-col">
                        <div class="demo-card-wide mdl-card-addClass mdl-shadow--6dp demo-card-square mdl-card">
                            <div class="mdl-card__supporting-text" style="text-align: center">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <asp:Label ID="Label1" class="mdl-textfield__input" Text='<%# Eval("quest_id") %>' runat="server" Visible="false" />
                                    <asp:Label ID="Label2" class="mdl-textfield" Text='<%# Eval("essay_question") %>' runat="server" />
                                    <asp:TextBox ID="TextBox1" runat="server" Height="50px" Width="300px" TextMode="MultiLine" ToolTip="Enter Answer Here"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
            </ItemTemplate>
        </asp:ListView>

        <!-- SHORT ANSWER QUESTIONS -->
        <asp:ListView ID="lvShortAnswerQuestions" runat="server" DataSourceID="sqlShortAnswerQuestions">
            <ItemTemplate>
                    <div class="mdl-cell mdl-cell--12-col">
                        <div class="demo-card-wide mdl-card-addClass mdl-shadow--6dp demo-card-square mdl-card">
                            <div class="mdl-card__supporting-text" style="text-align: center">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <asp:Label ID="Label1" class="mdl-textfield__input" Text='<%# Eval("quest_id") %>' runat="server" Visible="false" />
                                    <asp:Label ID="Label2" class="mdl-textfield" Text='<%# Eval("before_sa_question") %>' runat="server" />
                                    <asp:TextBox ID="TextBox1" runat="server" TextMode="SingleLine" ToolTip="Enter Answer Here"></asp:TextBox>
                                    <asp:Label ID="Label3" class="mdl-textfield" Text='<%# Eval("after_sa_question") %>' runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>
            </ItemTemplate>
        </asp:ListView>
        
        <!-- MULTIPLE CHOICE QUESTIONS -->
        <asp:ListView ID="lvMultipleChoiceQuestions" runat="server" DataSourceID="sqlMultipleChoiceQuestions" DataKeyNames="question_id">
            <ItemTemplate>
                    <div class="mdl-cell mdl-cell--12-col">
                        <div class="demo-card-wide mdl-card-addClass mdl-shadow--6dp demo-card-square mdl-card">
                            <div class="mdl-card__supporting-text" style="text-align: center">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <asp:HiddenField ID="hdnQuestionID" runat="server" Value='<%#Bind("question_id") %>' />
                                    <asp:Label ID="Label4" class="mdl-textfield__input" Text='<%# Eval("choice_id") %>' runat="server" Visible="false" />
                                    <asp:Label ID="Label2" class="mdl-textfield" Text='<%# Eval("question_text") %>' runat="server" />
                                    <asp:SqlDataSource ID="sqlMultipleChoiceQuestions" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
SELECT choice_id, choice_text
  FROM question_multiple_choice_body
 WHERE question_id = :p_QuestionID
 ORDER BY set_order">
                                        <SelectParameters>
                                            <asp:ControlParameter Name="p_QuestionID" ControlID="hdnQuestionID" PropertyName="Value" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:RadioButtonList ID="RadioButtonList1" ItemType="Text" DataSourceID="sqlMultipleChoiceQuestions" DataTextField="choice_text" DataValueField="choice_id" runat="server"></asp:RadioButtonList>
                                </div>
                            </div>
                        </div>
                    </div>
            </ItemTemplate>
        </asp:ListView>
<!-- EMPTY CARDS SHOWING UP NEED TO WORK ON

        MATCHING QUESTIONS -->
        <div class="mdl-cell mdl-cell--6-col">
            <div class="demo-card-wide mdl-card-addClass mdl-shadow--6dp demo-card-square mdl-card">
                <div class="mdl-card__supporting-text" style="text-align: center">
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <asp:ListView ID="lvMatchingQuestions" runat="server" DataSourceID="sqlMatchingQuestions" OnItemCreated="lvMatchingQuestions_ItemCreated">
                            <ItemTemplate>
                                <asp:GridView ID="grdMatchingQuestions" runat="server"></asp:GridView>
                                <%--<asp:CheckBox Id="Checkbox1" class="mdl-checkbox__input" Text='<%# Eval("matching_question")%>' runat="server" />--%>
                                <br />
                            </ItemTemplate>
                        </asp:ListView>
                    </div>
                </div>
            </div>
        </div>
        <%--<div class="mdl-cell mdl-cell--6-col">
            <div class="demo-card-wide mdl-card-addClass mdl-shadow--6dp demo-card-square mdl-card">
                <div class="mdl-card__supporting-text" style="text-align: center">
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <asp:ListView ID="lvMatchingAnswers" runat="server" DataSourceID="sqlMatchingQuestions">
                            <ItemTemplate>
                                <asp:Label ID="Label1" class="mdl-textfield" Text='<%# Eval("matching_answer")%>' runat="server"/>
                            </ItemTemplate>
                        </asp:ListView>
                    </div>
                </div>
            </div>
        </div>--%>


    <asp:GridView ID="GridView1" runat="server" DataSourceID="sqlMatchingQuestions"></asp:GridView>


    <asp:SqlDataSource ID="sqlMatchingQuestions" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
select question_matching.question_id quest_id, question_matching_body.question_text matching_question, question_matching_body.answer matching_answer
from   question_matching_body, question, question_matching
where  question.test_id = 1
and    question.question_id = question_matching.question_id
and    question_matching.question_id = question_matching_body.question_id
order by sys_guid()"></asp:SqlDataSource>

    <asp:SqlDataSource ID="sqlMultipleChoiceQuestions" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
SELECT question_id, choice_id, question_text
  FROM question
       JOIN question_multiple_choice USING (question_id)
 WHERE question.test_id = 1"></asp:SqlDataSource>
    
    <asp:SqlDataSource ID="sqlMultipleChoiceChoices" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
select question_id, choice_id, choice_text
from   question_multiple_choice_body
where  question_id = :question_id">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblMCIdentity" Name="question_id" PropertyName="Text" Type="String" DefaultValue="" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="sqlShortAnswerQuestions" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
SELECT question_short_answer.before_text before_sa_question, 
       question_short_answer.after_text after_sa_question, 
       question.question_id quest_id
FROM   QUESTION, QUESTION_SHORT_ANSWER
WHERE  question.TEST_ID = 1 and question.question_id = question_short_answer.question_id"></asp:SqlDataSource>
    
    <asp:SqlDataSource ID="sqlEssayQuestions" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
SELECT question_essay.question_text essay_question, question.question_id quest_id
FROM   QUESTION, QUESTION_ESSAY
WHERE  question.TEST_ID = 1 and question.question_id = question_essay.question_id">
    </asp:SqlDataSource>
    
    <asp:Button ID="btnSubmitTest" runat="server" Text="Submit Test" OnClick="btnSubmitTest_Click" />
</main>

    <!-- This the code construction zone. Code may or may not be needed in this section-->
<!--
    --------layout template for matching questions----------     
    <LayoutTemplate>
                                <table>
                                    <tr>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                </table>
                            </LayoutTemplate> -->
    <!--<td id="itemPlaceholder" runat="server"></td>
        
        
        
        
      ------------------NEED FOR ALL MATCHING-------------------  
        <asp:Label ID="Label1"  Text='<%# Eval("quest_id") %>' runat="server" Visible="false" />
                                <asp:Button ID="Button1" class="mdl-button mdl-js-button mdl-js-ripple-effect" Text='<%# Eval("matching_question") %>' runat="server" />
                                <br />
        
        -->

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="takingTestPageSpecificJS" runat="server">
</asp:Content>

