<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Pages/teacher.master" AutoEventWireup="true" CodeBehind="questionCreation.aspx.cs" Inherits="QuestWebApp.Pages.questionCreation" MaintainScrollPositionOnPostback="true" %>

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
    <!-- Essay -->
    <asp:Table ID="tblAddEssay" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblAddEssayText" runat="server" Text="Question Text: " />
            </asp:TableCell><asp:TableCell>
                <asp:TextBox ID="txtAddEssayText" runat="server" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <!-- Matching -->
    <asp:SqlDataSource ID="sqlAddMatchingQuestion" runat="server" ConnectionString="<%$ ConnectionStrings:GlennLocalHost %>" ProviderName="<%$ ConnectionStrings:GlennLocalHost.ProviderName %>" SelectCommand="
SELECT question_id, question_text, answer
  FROM question_matching_body
 WHERE question_id = :p_QuestionID">
        <SelectParameters>
            <asp:SessionParameter Name="p_QuestionID" SessionField="QuestionID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Table ID="tblMatchingSection" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblAddMatchingText" runat="server" Text="Text: " />
            </asp:TableCell><asp:TableCell ColumnSpan="2">
                <asp:TextBox ID="txtAddMatchingText" runat="server" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableHeaderRow>
            <asp:TableHeaderCell>&nbsp;</asp:TableHeaderCell><asp:TableHeaderCell>
                <asp:Label ID="lblAddMatchingAnswer" runat="server" Text="Answer" />
            </asp:TableHeaderCell><asp:TableHeaderCell>
                <asp:Label ID="lblAddMatchingQuestion" runat="server" Text="Question" />
            </asp:TableHeaderCell>
        </asp:TableHeaderRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnAddMatchingQuestion" runat="server" Text="Add Matching Question" OnClick="btnAddMultipleChoice_Click" />
            </asp:TableCell><asp:TableCell>
                <asp:TextBox ID="txtAddMatchingAnswer" runat="server" />
            </asp:TableCell><asp:TableCell>
                <asp:TextBox ID="txtAddMatchingQuestion" runat="server" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <asp:GridView ID="grdAddMatchingQuestion" runat="server" AutoGenerateColumns="False" DataKeyNames="question_id" DataSourceID="sqlAddMatchingQuestion">
        <Columns>
            <asp:BoundField DataField="question_id" HeaderText="question_id" SortExpression="question_id" />
            <asp:BoundField DataField="question_text" HeaderText="question_text" SortExpression="question_text" />
            <asp:BoundField DataField="answer" HeaderText="answer" SortExpression="answer" />
        </Columns>
    </asp:GridView>

    <!-- Multiple Choice -->
    <asp:SqlDataSource ID="sqlMultipleChoiceBody" runat="server" ConnectionString="<%$ ConnectionStrings:GlennLocalHost %>" ProviderName="<%$ ConnectionStrings:GlennLocalHost.ProviderName %>" SelectCommand="
SELECT choice_id, question_id, choice_text, set_order
  FROM question_multiple_choice_body
 WHERE question_id = :p_QuestionID">
        <SelectParameters>
            <asp:SessionParameter Name="p_QuestionID" SessionField="QuestionID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Table ID="tblAddMultipleChoice" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblAddMutipleChoiceQuestion" runat="server" Text="Question: " />
            </asp:TableCell><asp:TableCell ColumnSpan="2">
                <asp:TextBox ID="txtAddMultipleChoiceQuestion" runat="server" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableHeaderRow>
            <asp:TableHeaderCell>&nbsp;</asp:TableHeaderCell><asp:TableHeaderCell>
                <asp:Label ID="lblAddMultipleChoiceAnswer" runat="server" Text="Is Answer"></asp:Label>
            </asp:TableHeaderCell><asp:TableHeaderCell>
                <asp:Label ID="lblAddMultipleChoiceBody" runat="server" Text="Question"></asp:Label>
            </asp:TableHeaderCell>
        </asp:TableHeaderRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnNewMultipleChoice" runat="server" Text="Add Choice" OnClick="btnNewMultipleChoice_Click" />
            </asp:TableCell><asp:TableCell>
                <asp:CheckBox ID="chkMultipleChoiceAnswer" runat="server" />
            </asp:TableCell><asp:TableCell>
                <asp:TextBox ID="txtMultipleChoiceBody" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <asp:GridView ID="grdMultipleChoiceBody" runat="server" AutoGenerateColumns="False" DataKeyNames="CHOICE_ID" DataSourceID="sqlMultipleChoiceBody">
        <Columns>
            <asp:BoundField DataField="QUESTION_ID" HeaderText="QUESTION_ID" SortExpression="QUESTION_ID" />
            <asp:BoundField DataField="CHOICE_TEXT" HeaderText="CHOICE_TEXT" SortExpression="CHOICE_TEXT" />
            <asp:BoundField DataField="SET_ORDER" HeaderText="SET_ORDER" SortExpression="SET_ORDER" />
        </Columns>
    </asp:GridView>

    <!-- Short Answer -->
    <asp:Table ID="tblAddShortAnswer" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblBeforeText" runat="server" Text="Before Text: " />
            </asp:TableCell><asp:TableCell>
                <asp:Label ID="lblAnswerText" runat="server" Text="Answer Text: " />
            </asp:TableCell><asp:TableCell>
                <asp:Label ID="lblAfterText" runat="server" Text="After Text: " />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:TextBox ID="txtBeforeText" runat="server" />
            </asp:TableCell><asp:TableCell>
                <asp:TextBox ID="txtAnswerText" runat="server" />
            </asp:TableCell><asp:TableCell>
                <asp:TextBox ID="txtAfterText" runat="server" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow></asp:TableRow>
    </asp:Table>

    <!-- True False -->
    <asp:Table ID="tblAddTrueFalse" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblAddTFQuestion" runat="server" Text="Qeustion: " />
            </asp:TableCell><asp:TableCell>
                <asp:TextBox ID="txtAddTFQuestion" runat="server" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblAddTFAnswer" runat="server" Text="Answer:" />
            </asp:TableCell><asp:TableCell>
                <asp:RadioButtonList ID="rblAddTFAnswer" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Text="True" Value="T" />
                    <asp:ListItem Text="False" Value="F" />
                </asp:RadioButtonList>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />
    <asp:Button ID="btnAddQuestion" runat="server" Text="Add A Question" OnClick="btnAddQuestion_Click" />

    <!-- Question Display Section -->
    <asp:SqlDataSource ID="sqlQuestionDisplay" runat="server" ConnectionString="<%$ ConnectionStrings:GlennLocalHost %>" ProviderName="<%$ ConnectionStrings:GlennLocalHost.ProviderName %>" SelectCommand="
SELECT question_id, weight, type, test_order,
       e.question_text  AS essay_question, 
       m.question_text  AS matching_question,
       mc.question_text AS multiple_choice_question, choice_id AS multiple_choice_answer,
       before_text, after_text,                      sa.answer AS short_answer_answer,
       tf.question_text AS true_false_question,      tf.answer AS true_false_answer
  FROM question q
       LEFT OUTER JOIN question_essay           e  USING (question_id)
       LEFT OUTER JOIN question_matching        m  USING (question_id)
       LEFT OUTER JOIN question_multiple_choice mc USING (question_id)
       LEFT OUTER JOIN question_short_answer    sa USING (question_id)
       LEFT OUTER JOIN question_true_false      tf USING (question_id)
 WHERE test_id = :p_TestID
 ORDER BY test_order">
        <SelectParameters>
            <asp:SessionParameter Name="p_TestID" SessionField="Test_ID" />
        </SelectParameters>
    </asp:SqlDataSource>

    
    <!-- The following code is unaltered code from http://stackoverflow.com/questions/5288682/maintain-panel-scroll-position-on-partial-postback-asp-net -->
    <!-- This fixes the partial post pack not maintaining scroll possition error -->
    <asp:ScriptManager ID="ScriptManager1" runat="server" ScriptMode="Release" />
    <script type="text/javascript">
        // It is important to place this JavaScript code after ScriptManager1
        var xPos, yPos;
        var prm = Sys.WebForms.PageRequestManager.getInstance();

        function BeginRequestHandler(sender, args) {
            if ($get('<%=pnlEditQuestions.ClientID%>') != null) {
                // Get X and Y positions of scrollbar before the partial postback
                xPos = $get('<%=pnlEditQuestions.ClientID%>').scrollLeft;
                yPos = $get('<%=pnlEditQuestions.ClientID%>').scrollTop;
            }
        }

        function EndRequestHandler(sender, args) {
            if ($get('<%=pnlEditQuestions.ClientID%>') != null) {
            // Set X and Y positions back to the scrollbar
            // after partial postback
            $get('<%=pnlEditQuestions.ClientID%>').scrollLeft = xPos;
            $get('<%=pnlEditQuestions.ClientID%>').scrollTop = yPos;
        }
    }

    prm.add_beginRequest(BeginRequestHandler);
    prm.add_endRequest(EndRequestHandler);
    </script>

    <asp:UpdatePanel ID="updPnlEditQuestions" runat="server">
        <ContentTemplate>
            <asp:Panel ID="pnlEditQuestions" runat="server" Height="300">
                <!-- End borrowed Code, except the closeing tags... -->
                <main class="mdl-layout__content">
                    <div class="content-grid mdl-grid">
                        <div class="mdl-cell mdl-cell--4-col">
                            <asp:ListView ID="lstQuestionDisplay" runat="server" DataSourceID="sqlQuestionDisplay" DataKeyNames="question_id" OnItemUpdating="lstQuestionDisplay_ItemUpdating">
                                <ItemTemplate>
                                    <div class="demo-card-wide mdl-card-addClass mdl-shadow--3dp demo-card-square mdl-card">
                                        <div class="mdl-card__supporting-text" style="text-align: center">
                                            <asp:HiddenField ID="hdnQuestionID" runat="server" Value='<%#Bind("question_id") %>' />
                                            <asp:HiddenField ID="hdnQuestionType" runat="server" Value='<%#Bind("type") %>' />
                                            <asp:Table ID="tblQuestion" runat="server">
                                                <asp:TableHeaderRow>
                                                    <asp:TableHeaderCell>
                                                        <asp:LinkButton ID="LinkButton1" runat="server" Text="Edit" CommandName="edit"/>
                                                    </asp:TableHeaderCell><asp:TableHeaderCell>
                                                        <asp:LinkButton ID="LinkButton2" runat="server" Text="Delete" CommandName="delete"/>
                                                    </asp:TableHeaderCell>
                                                </asp:TableHeaderRow>
                                                <asp:TableRow>
                                                    <asp:TableHeaderCell>
                                                        <asp:Label ID="lblDispWeight" runat="server" Text="Weight: " />
                                                    </asp:TableHeaderCell>
                                                    <asp:TableCell>
                                                        <asp:Label ID="lblWeight" runat="server" Text='<%#Eval("weight") %>' />
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableHeaderCell>
                                                        <asp:Label ID="lblDispTestOrder" runat="server" Text="Test Order: " />
                                                    </asp:TableHeaderCell>
                                                    <asp:TableCell>
                                                        <asp:Label ID="lblTestOrder" runat="server" Text='<%#Eval("test_order") %>' />
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                            </asp:Table>

                                            <!-- Essay Question Display -->
                                            <asp:Table ID="tblEQuestion" runat="server">
                                                <asp:TableRow>
                                                    <asp:TableCell>
                                                        <asp:Label ID="lblDispEQuestion" runat="server" Text="Question: " />
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:Label ID="lblEQuestion" runat="server" Text='<%#Eval("essay_question") %>' />
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                            </asp:Table>

                                            <!-- Matching Question Display -->
                                            <asp:SqlDataSource ID="sqlDispMQuestion" runat="server" ConnectionString="<%$ ConnectionStrings:GlennLocalHost %>" ProviderName="<%$ ConnectionStrings:GlennLocalHost.ProviderName %>" SelectCommand="
SELECT question_id, question_text, answer
  FROM question_matching_body
 WHERE question_id = :p_QuestionID">
                                                <SelectParameters>
                                                    <asp:ControlParameter Name="p_QuestionID" ControlID="hdnQuestionID" PropertyName="value" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                            <asp:Table ID="tblMQuestion" runat="server">
                                                <asp:TableRow>
                                                    <asp:TableCell>
                                                        <asp:Label ID="lblDispMQuestion" runat="server" Text="Question: " />
                                                    </asp:TableCell><asp:TableCell ColumnSpan="2">
                                                        <asp:Label ID="txtMQuestion" runat="server" Text='<%#Eval("matching_question") %>' />
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                            </asp:Table>
                                            <asp:GridView ID="grdDispMQuestion" runat="server" AutoGenerateColumns="False" DataKeyNames="question_id" DataSourceID="sqlDispMQuestion">
                                                <Columns>
                                                    <asp:BoundField DataField="question_text" HeaderText="Question" SortExpression="question_text" />
                                                    <asp:BoundField DataField="answer" HeaderText="Answer" SortExpression="answer" />
                                                </Columns>
                                            </asp:GridView>

                                            <!-- Multiple Choice Question Display -->
                                            <asp:SqlDataSource ID="sqlDispMC" runat="server" ConnectionString="<%$ ConnectionStrings:GlennLocalHost %>" ProviderName="<%$ ConnectionStrings:GlennLocalHost.ProviderName %>" SelectCommand="
SELECT question_id, choice_text, NVL(correct, 'N') AS answer, set_order
  FROM question_multiple_choice mc
                  JOIN question_multiple_choice_body mcb USING (question_id)
       LEFT OUTER JOIN (SELECT smcb.choice_id, 'Y' AS correct
                          FROM question_multiple_choice smc
                               LEFT OUTER JOIN question_multiple_choice_body smcb USING (question_id)
                         WHERE smc.choice_id = smcb.choice_id) a ON (a.choice_id = mcb.choice_id)
 WHERE question_id = :p_QuestionID">
                                                <SelectParameters>
                                                    <asp:ControlParameter Name="p_QuestionID" ControlID="hdnQuestionID" PropertyName="value" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                            <asp:Table ID="tblDispMC" runat="server">
                                                <asp:TableRow>
                                                    <asp:TableCell>
                                                        <asp:Label ID="lblDispMCQuestion" runat="server" Text="Question: " />
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:Label ID="txtMCQuestion" runat="server" Text='<%#Eval("multiple_choice_question") %>' />
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                            </asp:Table>
                                            <asp:GridView ID="grdMChoice" runat="server" AutoGenerateColumns="False" DataKeyNames="question_id" DataSourceID="sqlDispMC">
                                                <Columns>
                                                    <asp:BoundField DataField="answer" HeaderText="Answer" SortExpression="answer" />
                                                    <asp:BoundField DataField="choice_text" HeaderText="Choice Text" SortExpression="choice_text" />
                                                    <asp:BoundField DataField="set_order" HeaderText="Set Order" SortExpression="set_order" />
                                                </Columns>
                                            </asp:GridView>

                                            <!-- Short Answer Question Display -->
                                            <asp:Table ID="tblSAQuestion" runat="server">
                                                <asp:TableRow>
                                                    <asp:TableCell>
                                                        <asp:Label ID="lblDispBeforeText" runat="server" Text="Before Text: " />
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:Label ID="lblBeforeText" runat="server" Text='<%#Eval("before_text") %>' />
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>
                                                        <asp:Label ID="lblDispSAAnswer" runat="server" Text="Answer: " />
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:Label ID="lblSAAnswer" runat="server" Text='<%#Eval("short_answer_answer") %>' />
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>
                                                        <asp:Label ID="lblDispAfterText" runat="server" Text="After Text: " />
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:Label ID="lblAfterText" runat="server" Text='<%#Eval("after_text") %>' />
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                            </asp:Table>

                                            <!-- True False Question Display -->
                                            <asp:Table ID="tblTFQuestion" runat="server">
                                                <asp:TableRow>
                                                    <asp:TableHeaderCell>
                                                        <asp:Label ID="lblDispQuestion" runat="server" Text="Question: " />
                                                    </asp:TableHeaderCell><asp:TableCell>
                                                        <asp:Label ID="lblQuestion" runat="server" Text='<%#Eval("true_false_question") %>' />
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableHeaderCell>
                                                        <asp:Label ID="lblDispAnswer" runat="server" Text="Answer: " />
                                                    </asp:TableHeaderCell><asp:TableCell>
                                                        <asp:Label ID="lblAnswer" runat="server" Text='<%#Eval("true_false_answer") %>' />
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                            </asp:Table>
                                        </div>
                                    </div>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <div class="demo-card-wide mdl-card-addClass mdl-shadow--3dp demo-card-square mdl-card">
                                        <div class="mdl-card__supporting-text" style="text-align: center">
                                            <asp:HiddenField ID="hdnEditQuestionID" runat="server" Value='<%#Bind("question_id") %>' />
                                            <asp:HiddenField ID="hdnEditQuestionType" runat="server" Value='<%#Bind("type") %>' />
                                            <asp:Table ID="tblQuestion" runat="server">
                                                <asp:TableHeaderRow>
                                                    <asp:TableHeaderCell>
                                                        <asp:LinkButton ID="btnUpdateQuestion" runat="server" Text="Update" CommandName="Update" CommandArgument='<%#Bind("question_id") %>' />
                                                    </asp:TableHeaderCell><asp:TableHeaderCell>
                                                        <asp:LinkButton ID="btnCancel" runat="server" Text="Cancel" CommandName="Cancel" CommandArgument='<%#Bind("question_id") %>' />
                                                    </asp:TableHeaderCell>
                                                </asp:TableHeaderRow>
                                                <asp:TableRow>
                                                    <asp:TableHeaderCell>
                                                        <asp:Label ID="lblEditWeight" runat="server" Text="Weight: " />
                                                    </asp:TableHeaderCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox ID="txtEditWeight" runat="server" Text='<%#Bind("weight") %>' />
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableHeaderCell>
                                                        <asp:Label ID="lblEditTestOrder" runat="server" Text="Test Order: " />
                                                    </asp:TableHeaderCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox ID="txtEditTestOrder" runat="server" Text='<%#Bind("test_order") %>' />
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                            </asp:Table>

                                            <!-- Edit Essay -->
                                            <asp:Table ID="tblEditEQuestion" runat="server">
                                                <asp:TableRow>
                                                    <asp:TableHeaderCell>
                                                        <asp:Label ID="lblEditEQuestion" runat="server" Text="Question: " />
                                                    </asp:TableHeaderCell><asp:TableCell>
                                                        <asp:TextBox ID="txtEditEQuestion" runat="server" Text='<%#Bind("essay_question") %>' />
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                            </asp:Table>

                                            <!-- Edit Matching -->
                                            <asp:Table ID="tblEditMQuestion" runat="server">
                                                <asp:TableRow>
                                                    <asp:TableHeaderCell>
                                                        <asp:Label ID="lblEditMQuestion" runat="server" Text="Question: " />
                                                    </asp:TableHeaderCell><asp:TableCell>
                                                        <asp:TextBox ID="txtEditMQuestion" runat="server" Text='<%#Bind("matching_question") %>' />
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell ColumnSpan="2">
                                                        <asp:SqlDataSource ID="sqlEditMQuestion" runat="server" ConnectionString="<%$ ConnectionStrings:GlennLocalHost %>" ProviderName="<%$ ConnectionStrings:GlennLocalHost.ProviderName %>" SelectCommand="
SELECT matching_body_id, question_id, question_text, answer
  FROM question_matching_body
 WHERE question_id = :p_QuestionID"
                                                            UpdateCommand="
BEGIN
    QUESTIONS_MATCHING_BODY.change(
    p_MatchingBodyID =&gt; :matching_body_id,
    p_QuestionText   =&gt; :question_text,
    P_Answer         =&gt; :answer);
END;"
                                                            DeleteCommand="
BEGIN
    QUESTIONS_MATCHING_BODY.delete(p_MatchingBodyID =&gt; :matching_body_id);
END;">
                                                            <SelectParameters>
                                                                <asp:ControlParameter Name="p_QuestionID" ControlID="hdnEditQuestionID" PropertyName="value" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                        <asp:GridView ID="grdEditMQuestion" runat="server" DataSourceID="sqlEditMQuestion" DataKeyNames="matching_body_id" AutoGenerateColumns="false" ShowFooter="true" OnRowCommand="grdEditMQuestion_RowCommand">
                                                            <Columns>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="lnkBtnEditMQuestion" runat="server" CommandName="edit">Edit</asp:LinkButton>
                                                                        <asp:LinkButton ID="lnkBtnDeleteMQuestion" runat="server" CommandName="delete">Delete</asp:LinkButton>
                                                                    </ItemTemplate>
                                                                    <EditItemTemplate>
                                                                        <asp:LinkButton ID="lnkBtnUpdateMQuestion" runat="server" CommandName="update">Update</asp:LinkButton>
                                                                        <asp:LinkButton ID="lnkBtnCancelMQuestion" runat="server" CommandName="cancel">Cancel</asp:LinkButton>
                                                                    </EditItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:LinkButton ID="lnkBtnEditMQuestion" runat="server" CommandName="Add">Add</asp:LinkButton>
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField SortExpression="question_text" HeaderText="Question">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblEditMQuestion" runat="server" Text='<%#Bind("question_text") %>' />
                                                                    </ItemTemplate>
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="txtEditMQuestion" runat="server" Text='<%#Bind("question_text") %>' />
                                                                    </EditItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:TextBox ID="txtInsEditMQuestion" runat="server" />
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField SortExpression="answer" HeaderText="Answer">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblEditMAnswer" runat="server" Text='<%#Bind("answer") %>' />
                                                                    </ItemTemplate>
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="txtEditMAnswer" runat="server" Text='<%#Bind("answer") %>' />
                                                                    </EditItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:TextBox ID="txtInsEditMAnswer" runat="server" />
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                            </asp:Table>

                                            <!-- Edit Multiple Choice -->
                                            <asp:SqlDataSource ID="sqlEditMC" runat="server" ConnectionString="<%$ ConnectionStrings:GlennLocalHost %>" ProviderName="<%$ ConnectionStrings:GlennLocalHost.ProviderName %>" SelectCommand="
SELECT choice_id, question_id, choice_text, NVL(correct, 'N') AS answer, set_order
  FROM question_multiple_choice mc
                  JOIN question_multiple_choice_body mcb USING (question_id)
       LEFT OUTER JOIN (SELECT smcb.choice_id, 'Y' AS correct
                          FROM question_multiple_choice smc
                               LEFT OUTER JOIN question_multiple_choice_body smcb USING (question_id)
                         WHERE smc.choice_id = smcb.choice_id) a ON (a.choice_id = mcb.choice_id)
 WHERE question_id = :p_QuestionID" DeleteCommand="
BEGIN
  QUESTIONS_MULTIPLE_CHOICE_BODY.delete(p_ChoiceID => :choice_id);
END;">
                                                <SelectParameters>
                                                    <asp:ControlParameter Name="p_QuestionID" ControlID="hdnQuestionID" PropertyName="value" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                            <asp:Table ID="tblDispMC" runat="server">
                                                <asp:TableRow>
                                                    <asp:TableCell>
                                                        <asp:Label ID="lblDispMCQuestion" runat="server" Text="Question: " />
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox ID="txtEditMCQuestion" runat="server" Text='<%#Eval("multiple_choice_question") %>' />
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                            </asp:Table>
                                            <asp:GridView ID="grdEditMChoice" runat="server" AutoGenerateColumns="False" DataKeyNames="choice_id" DataSourceID="sqlEditMC" ShowFooter="true" OnRowCommand="grdEditMChoice_RowCommand">
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:HiddenField ID="hdnEditMCChoiceID" runat="server" value='<%#Bind("choice_id") %>' />
                                                            <asp:HiddenField ID="hdnEditMCQuestionID" runat="server" value='<%#Bind("question_id") %>' />
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:HiddenField ID="hdnEditMCChoiceID" runat="server" value='<%#Bind("choice_id") %>' />
                                                            <asp:HiddenField ID="hdnEditMCQuestionID" runat="server" value='<%#Bind("question_id") %>' />
                                                        </EditItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:HiddenField ID="hdnEditMCChoiceID" runat="server" value='<%#Bind("choice_id") %>' />
                                                            <asp:HiddenField ID="hdnEditMCQuestionID" runat="server" value='<%#Bind("question_id") %>' />
                                                        </FooterTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkEditMCEdit" runat="server" CommandName="edit">Edit</asp:LinkButton>
                                                            <asp:LinkButton ID="lnkEditMCDelete" runat="server" CommandName="delete">Delete</asp:LinkButton>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:LinkButton ID="lnkEditMCUpdate" runat="server" CommandName="update">Update</asp:LinkButton>
                                                            <asp:LinkButton ID="lnkEditMCDelete" runat="server" CommandName="delete">Delete</asp:LinkButton>
                                                        </EditItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:LinkButton ID="lnkEditMCAdd" runat="server" CommandName="add">Add</asp:LinkButton>
                                                        </FooterTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblEditMCAnswer" runat="server" Text='<%# Eval("answer") %>' />
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:DropDownList ID="ddlEditMCEditAnswer" runat="server" SelectedValue='<%#Bind("answer") %>'>
                                                                <asp:ListItem Text="Yes" Value="Y" />
                                                                <asp:ListItem Text="No" Value="N" />
                                                            </asp:DropDownList>
                                                        </EditItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:DropDownList ID="ddlEditMCAddAnswer" runat="server">
                                                                <asp:ListItem Text="Yes" Value="Y" />
                                                                <asp:ListItem Text="No" Value="N" />
                                                            </asp:DropDownList>
                                                        </FooterTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblEditMCChoice" runat="server" Text='<%# Eval("choice_text") %>' />
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="lblEditMCEditChoice" runat="server" Text='<%# Eval("choice_text") %>' />
                                                        </EditItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:TextBox ID="txtEditMCAddChoice" runat="server" />
                                                        </FooterTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblEditMCSetOrder" runat="server" Text='<%# Eval("set_order") %>' />
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="lblEditMCEditSetOrder" runat="server" Text='<%# Eval("set_order") %>' />
                                                        </EditItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:TextBox ID="lblEditMCAddSetOrder" runat="server" />
                                                        </FooterTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>

                                            <!-- Edit Short Answer -->
                                            <asp:Table ID="tblSAQuestion" runat="server">
                                                <asp:TableRow>
                                                    <asp:TableCell>
                                                        <asp:Label ID="lblEditBeforeText" runat="server" Text="Before Text: " />
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox ID="txtEditBeforeText" runat="server" Text='<%#Eval("before_text") %>' />
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>
                                                        <asp:Label ID="lblEditSAAnswer" runat="server" Text="Answer: " />
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox ID="txtEditSAAnswer" runat="server" Text='<%#Eval("short_answer_answer") %>' />
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>
                                                        <asp:Label ID="lblEditAfterText" runat="server" Text="After Text: " />
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:TextBox ID="txtEditAfterText" runat="server" Text='<%#Eval("after_text") %>' />
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                            </asp:Table>

                                            <!-- Edit True False -->
                                            <asp:Table ID="tblEditTFQuestion" runat="server">
                                                <asp:TableRow>
                                                    <asp:TableHeaderCell>
                                                        <asp:Label ID="lblEditTFQuestion" runat="server" Text="Question: " />
                                                    </asp:TableHeaderCell><asp:TableCell>
                                                        <asp:TextBox ID="txtEditTFQuestion" runat="server" Text='<%#Bind("true_false_question") %>' />
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableHeaderCell>
                                                        <asp:Label ID="lblEditTFAnswer" runat="server" Text="Answer: " />
                                                    </asp:TableHeaderCell><asp:TableCell>
                                                        <asp:DropDownList ID="ddlEditTFAnswer" runat="server" SelectedValue='<%#Bind("true_false_answer") %>'>
                                                            <asp:ListItem Text="--" Value="" />
                                                            <asp:ListItem Text="True" Value="T" />
                                                            <asp:ListItem Text="False" Value="F" />
                                                        </asp:DropDownList>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                            </asp:Table>
                                        </div>
                                    </div>
                                </EditItemTemplate>
                            </asp:ListView>
                        </div>
                    </div>
                </main>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="teacherPageSpecificJS" runat="server">
</asp:Content>
