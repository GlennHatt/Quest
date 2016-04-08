<%@ Page Title="Student | Taking Test" Language="C#" MasterPageFile="~/Master-Pages/takingTest.master" AutoEventWireup="true" CodeBehind="takingTestTest.aspx.cs" Inherits="QuestWebApp.Pages.takingTestTest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="takingTestBreadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="takingTestHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="takingTestExtraReferances" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="takingTestBodyContent" runat="server">
    <style>

        .mc {
            margin-left: 34%;
            text-align: left;
        }

        .tf {
            margin-left: 30%;
        }

    </style>

    <main class="mdl-layout__content" style="width:100%;">
        <div class="content-grid mdl-grid">
        <br />
        <br />
        <asp:SqlDataSource ID="sqlTestQuestions" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
SELECT question_id, weight, type,
       e.question_text AS essay_question,
       m.question_text AS matching_question,
       mc.question_text AS multiple_choice_question, mc.choice_id AS multiple_choice_answer,
       tf.question_text AS true_false_question,      tf.answer    AS true_false_answer,
       before_text, after_text, sa.answer AS short_answer_answer
  FROM question q
       LEFT OUTER JOIN question_essay           e  USING (question_id)
       LEFT OUTER JOIN question_matching        m  USING (question_id)
       LEFT OUTER JOIN question_multiple_choice mc USING (question_id)
       LEFT OUTER JOIN question_short_answer    sa USING (question_id)
       LEFT OUTER JOIN question_true_false      tf USING (question_id)
 WHERE test_id = :p_TestID
       AND type != 'M'
 ORDER BY test_order">
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
                 <button style="background-color: #FF6E40; color: white;"  ID="btnResizeSm" disabled="disabled" onclick="changeUserCardSize('questionCard', 'btnResizeSm', 'btnResizeLrg'); return false" Class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--colored">Small</button>
                 <button style="background-color: #FF6E40; color: white;"  ID="btnResizeLrg"  onclick="changeUserCardSize('questionCard', 'btnResizeUserSm', 'btnResizeLrg'); return false" Class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--colored">Large</button>
                 <asp:LinkButton ID="myTest" runat="server" OnClick="myTest_Click">Test</asp:LinkButton>

                 </div>

        <!-- TRUE/FALSE QUESTIONS -->
        <asp:ListView ID="lstQuestions" runat="server" DataSourceID="sqlTestQuestions" OnItemDataBound="lstQuestions_ItemDataBound">
            <ItemTemplate>
                <div id="questionCard" class="mdl-cell mdl-cell--6-col" runat="server">
                    <div class="demo-card-wide mdl-card-addClass mdl-shadow--6dp demo-card-square mdl-card">
                        <div class="mdl-card__supporting-text" style="text-align: center" ID="divQuestion">
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                <asp:HiddenField ID="hdnQuestionID" Value='<%# Eval("question_id") %>' runat="server" />
                                <asp:HiddenField ID="hdnQuestionType" Value='<%# Eval("type") %>' runat="server" />
                                <asp:Label ID="lblDispWeight" runat="server" Text="Point Value: "></asp:Label>
                                <asp:Label ID="lblWeight" Text='<%# Eval("weight") %>' runat="server" />
                            </div>
                        </div>
                        <!-- Essay -->
                        <div runat="server" class="mdl-card__supporting-text" style="text-align: center" ID="divE">
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                <asp:Label ID="lblEQuestion" class="mdl-textfield" Text='<%# Eval("essay_question") %>' runat="server" />
                                <asp:TextBox ID="txtEAnswer" runat="server" TextMode="MultiLine" class="mdl-textfield__input"/>
                            </div>
                        </div>
                        <!-- Matching -->
                        <!-- Multiple Choice -->
                        <div runat="server" class="mdl-card__supporting-text" style="text-align: center" ID="divMC">
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                <asp:HiddenField ID="hdnMCAnswer" runat="server" Value='<%#Bind("multiple_choice_answer") %>' />
                                <asp:SqlDataSource ID="sqlMCChoices" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
SELECT choice_id, choice_text
  FROM question_multiple_choice_body
 WHERE question_id = :p_QuestionID
 ORDER BY set_order">
                                    <SelectParameters>
                                        <asp:ControlParameter Name="p_QuestionID" ControlID="hdnQuestionID" PropertyName="Value" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:Label ID="lblMCQuestion" class="mdl-textfield" Text='<%# Eval("multiple_choice_question") %>' runat="server" />
                                <asp:RadioButtonList ID="rblMCAnswer" runat="server" DataSourceID="sqlMCChoices" DataTextField="choice_text" DataValueFeild="choice_id" CssClass="mc"/>
                            </div>
                        </div>
                        <!-- Short Answer -->
                        <div runat="server" class="mdl-card__supporting-text" style="text-align: center" ID="divSA">
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                <asp:HiddenField ID="hdnSAAnswer" runat="server" Value='<%#Bind("short_answer_answer") %>' />
                                <asp:Label ID="lblBeforeText" class="mdl-textfield" Text='<%# Eval("before_text") %>' runat="server" />
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                <asp:TextBox ID="txtSAAnswer" runat="server" class="mdl-textfield__input"/>
                                    <label class="mdl-textfield__label" style="bottom: 0px" for="sample3">Answer:</label>
                                    </div>
                                <asp:Label ID="lblAfterText" class="mdl-textfield" Text='<%# Eval("after_text") %>' runat="server" />
                            </div>
                        </div>
                        <!-- True False -->
                        <div runat="server" class="mdl-card__supporting-text" style="text-align: center" ID="divTF">
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                <asp:HiddenField ID="hdnTFAnswer" Value='<%# Eval("true_false_answer") %>' runat="server" />
                                <asp:Label ID="lblTFQuestion" class="mdl-textfield" Text='<%# Eval("true_false_question") %>' runat="server" />
                                <asp:RadioButtonList ID="rblTFAnswer" runat="server" CssClass="mdl-radio__button tf" RepeatDirection="Horizontal" >
                                    <asp:ListItem Text="True" Value="T" />
                                    <asp:ListItem Text="False" Value="F" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
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

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="takingTestPageSpecificJS" runat="server">
</asp:Content>

