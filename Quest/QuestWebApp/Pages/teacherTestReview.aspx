<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Pages/teacher.master" AutoEventWireup="true" CodeBehind="teacherTestReview.aspx.cs" Inherits="QuestWebApp.Pages.teacherTestReview" %>
<asp:Content ID="Content1" ContentPlaceHolderID="teacherBreadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="teacherHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="teacherExtraReferances" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="teacherWithSidebarSidebar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="teacherWithSidebarBodyContent" runat="server">
    <main class="mdl-layout__content" style="width:100%;">
        <div class="content-grid mdl-grid">
        <br />
        <br />
        <asp:SqlDataSource ID="sqlTestQuestions" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
SELECT question_taken_id, points_earned,
       e.essay AS essay_text,
       --m.question_text AS matching_question,
       mc.student_choice AS multiple_choice_choice, 
       --tf.answer    AS true_false_answer,
       sa.answer AS short_answer_answer
  FROM question_taken q
       LEFT OUTER JOIN question_taken_essay           e  USING (question_taken_id)
       LEFT OUTER JOIN question_taken_matching        m  USING (question_taken_id)
       LEFT OUTER JOIN question_taken_multiple_choice mc USING (question_taken_id)
       LEFT OUTER JOIN question_taken_short_answer    sa USING (question_taken_id)
       --LEFT OUTER JOIN question_taken                 tf USING (question_taken_id)
 WHERE test_taken_id = :p_TestID">
            <SelectParameters>
                <asp:SessionParameter SessionField="TestID" Name="p_TestID" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="p_TestTakenID" />
                <asp:Parameter Name="p_QuestionID" />
                <asp:Parameter Name="p_Answer" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:Label ID="lblTimeLimit" runat="server" />
             <div class="mdl-cell mdl-cell--12-col">
                 <asp:LinkButton ID="btnSmall" runat="server" OnClick="btnSmall_Click" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--colored" ForeColor="White" BackColor="#FF6E40">Small</asp:LinkButton>
                 <asp:LinkButton ID="btnLarge" runat="server" OnClick="btnLarge_Click" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--colored" ForeColor="White" BackColor="#FF6E40">Large</asp:LinkButton>

                 



                 </div>

        <!-- TRUE/FALSE QUESTIONS -->
        <asp:ListView ID="lstQuestions" runat="server" DataSourceID="sqlTestQuestions" OnItemDataBound="lstQuestions_ItemDataBound">
            <ItemTemplate>
                <div id="questionCard" class="mdl-cell mdl-cell--6-col" runat="server">
                    <div class="demo-card-wide mdl-card-addClass mdl-shadow--6dp demo-card-square mdl-card">
                        <div class="mdl-card__supporting-text" style="text-align: center" ID="divQuestion">
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                <asp:Label ID="hdnQuestionID" Text='<%# Eval("question_taken_id") %>' runat="server" />
                                <asp:Label ID="hdnQuestionType" Text='<%# Eval("points_earned") %>' runat="server" />
                            </div>
                        </div>
                        <!-- Essay -->
                        <div runat="server" class="mdl-card__supporting-text" style="text-align: center" ID="divE">
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                <asp:Label ID="lblEQuestion" class="mdl-textfield" Text='<%# Eval("essay_text") %>' runat="server" />
                                <asp:TextBox ID="txtEAnswer" runat="server" TextMode="MultiLine" class="mdl-textfield__input"/>
                            </div>
                        </div>
                        <!-- Matching -->
                        <!-- Multiple Choice -->
                        <div runat="server" class="mdl-card__supporting-text" style="text-align: center" ID="divMC">
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                <asp:SqlDataSource ID="sqlMCChoices" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
SELECT choice_id, choice_text
  FROM question_multiple_choice_body
 WHERE question_id = :p_QuestionID
 ORDER BY set_order">
                                    <SelectParameters>
                                        <asp:ControlParameter Name="p_QuestionID" ControlID="hdnQuestionID" PropertyName="Text" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:Label ID="lblMCQuestion" class="mdl-textfield" Text='<%# Eval("multiple_choice_choice") %>' runat="server" />
                                </div>
                        </div>
                        <!-- Short Answer -->
                        <div runat="server" class="mdl-card__supporting-text" style="text-align: center" ID="divSA">
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                <asp:Label ID="lblBeforeText" class="mdl-textfield" Text='<%# Eval("short_answer_answer") %>' runat="server" />
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                <asp:TextBox ID="txtSAAnswer" runat="server" class="mdl-textfield__input"/>
                                    <label class="mdl-textfield__label" style="bottom: 0px" for="sample3">Answer:</label>
                                    </div>
                            </div>
                        </div>
                        <!-- True False -->
                    </div>
                </div>
            </ItemTemplate>
        </asp:ListView>

        <div style="position: fixed; right: 41px; bottom: 15px; z-index: 2;">
        <asp:Button ID="btnSubmitTest" Height="53px" ForeColor="White" BackColor="Green" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" runat="server" Text="Submit Test" OnClick="btnSubmitTest_Click"/>
    </div>
       
            </div>
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
    <button style="display:none" id="testButton" onclick="return false"></button>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="teacherPageSpecificJS" runat="server">
</asp:Content>
