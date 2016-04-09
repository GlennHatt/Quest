﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Pages/teacher.master" AutoEventWireup="true" CodeBehind="teacherTestReview.aspx.cs" Inherits="QuestWebApp.Pages.teacherTestReview" %>
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
SELECT q.test_order, q.question_id, q.weight, q.type,
       question_taken_id, points_earned,
       
       e.question_text AS essay_question,
       et.essay        AS essay_text,
       
     --m.question_text  AS matching_question,
     --mt.question_text AS matching_question_taken,
     
       mc.question_text   AS multiple_choice_question,
       mct.student_choice AS multiple_choice_choice,
       
       tf.question_text AS true_false_question,
    --tft.answer       AS true_false_answer,
       
       sa.before_text AS short_answer_before_text,
       sat.answer     AS short_answer_answer,
       sa.after_text  AS short_answer_after_text
       
  FROM question_taken qt
       LEFT OUTER JOIN question q                         ON    (q.question_id = qt.question_id)
       LEFT OUTER JOIN question_taken_essay           et  USING (question_taken_id)
       LEFT OUTER JOIN question_taken_matching        mt  USING (question_taken_id)
       LEFT OUTER JOIN question_taken_multiple_choice mct USING (question_taken_id)
       LEFT OUTER JOIN question_taken_short_answer    sat USING (question_taken_id)
     --LEFT OUTER JOIN question_taken                 tft USING (question_taken_id)
       LEFT OUTER JOIN question_essay                 e   ON    (q.question_id = e.question_id  AND q.type = 'E')
       LEFT OUTER JOIN question_matching              m   ON    (q.question_id = m.question_id  AND q.type = 'M')
       LEFT OUTER JOIN question_multiple_choice       mc  ON    (q.question_id = mc.question_id AND q.type = 'MC')
       LEFT OUTER JOIN question_short_answer          sa  ON    (q.question_id = sa.question_id AND q.type = 'SA')
       LEFT OUTER JOIN question_true_false            tf  ON    (q.question_id = tf.question_id AND q.type = 'TF')
 WHERE test_taken_id = :p_TestID
    AND q.type != 'M'
 ORDER BY q.test_order">
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
                                <asp:Label ID="lblEQuestion" class="mdl-textfield" Text='<%# Eval("essay_question") %>' runat="server" />
                                <asp:Label ID="txtEAnswer" class="mdl-textfield__input" Text='<%# Eval("essay_text") %>' runat="server"/>
                            </div>
                        </div>
                        <!-- Matching -->
                        <!-- Multiple Choice -->
                        <div runat="server" class="mdl-card__supporting-text" style="text-align: center" ID="divMC">
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                <asp:Label ID="lblMCQuestion" class="mdl-textfield" Text='<%# Eval("multiple_choice_question") %>' runat="server" />
                                <asp:Label ID="lblMCAnswer" class="mdl-textfield" Text='<%# Eval("multiple_choice_choice") %>' runat="server" />
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