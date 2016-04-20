<%@ Page Title="Teacher | Question Creation" Language="C#" MasterPageFile="~/Master-Pages/teacher.master" AutoEventWireup="true" CodeBehind="teacherQuestionCreation.aspx.cs" Inherits="QuestWebApp.Pages.teacherQuestionCreation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="teacherBreadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="teacherHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="teacherExtraReferances" runat="server">
    <script src="../Assets/JS/jquery-2.1.3.min.js"></script>
    <script src="../Assets/JS/modernizerResponsiveTable.js"></script>
    <link href="../Assets/Styles/Responsive-Tables/responsiveTableNormalize.css" rel="stylesheet" />
    <link href="../Assets/Styles/Responsive-Tables/ResponsiveTableQuestions.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="teacherWithSidebarSidebar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="teacherWithSidebarBodyContent" runat="server">

    <style>
        .sizeButton {
            height: 31%;
            width: 30%;
        }
    </style>

    <div class="demo-card mdl-card mdl-shadow--2dp" id="cardQuestionType" runat="server" style="width: 44%; float: none; left: 28%; margin-top: 16px; margin-bottom: 16px;">
        <div class="mdl-card__supporting-text mdl-card--expand" style="text-align: center">
            <asp:Label ID="lblAddType" CssClass="mdl-textfield__label" runat="server" Text="Question Type:" Style="text-align: center" />
            <br />
            <br />
            <br />
            <asp:RadioButtonList ID="rblAddType" CssClass="mdl-textfield_label" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rblAddType_SelectedIndexChanged" AutoPostBack="true">
                <asp:ListItem Text="Essay" Value="E" />
                <asp:ListItem Text="Multiple Choice " Value="MC" />
                <asp:ListItem Text="Short Answer " Value="SA" />
                <asp:ListItem Text="True/False " Value="TF" />
            </asp:RadioButtonList>
        </div>
    </div>



    <div class="demo-card-square mdl-card mdl-shadow--2dp" id="cardPoints" runat="server" style="width: 44%; float: none; margin-top: 16px; margin-bottom: 16px;">
        <div class="mdl-card__supporting-text mdl-card--expand" style="text-align: center; width: 94%">
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <asp:Label CssClass="mdl-textfield__label" ID="lblAddWeight" runat="server" AssociatedControlID="txtAddWeight" Text="Question Point Value: " Style="bottom: 0px" />
                <asp:TextBox ID="txtAddWeight" CssClass="mdl-textfield__input" runat="server" />
            </div>
            <br />

            <asp:RegularExpressionValidator ID="numbersOnlyValidator" runat="server" ForeColor="Red" ControlToValidate="txtAddWeight" SetFocusOnError="True" ValidationGroup="testQuestions" ErrorMessage="Please Enter Numbers Only" ValidationExpression="[0-9]*"></asp:RegularExpressionValidator>
            <br />
            <asp:RequiredFieldValidator ID="ValidatorWeight" runat="server" ErrorMessage="Please Enter a Question Weight" ForeColor="Red" ControlToValidate="txtAddWeight" SetFocusOnError="True" ValidationGroup="testQuestions"></asp:RequiredFieldValidator>
            <br />
            <br />
            <%--<asp:Button ID="btnPointValue" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" runat="server" Text="Pick Question Type" OnClick="btnPointValue_Click" />--%>
        </div>
    </div>


    <!-- Essay -->

    <div class="demo-card-square mdl-card mdl-shadow--2dp" id="cardEssay" runat="server" style="width: 44%; float: none; margin-top: 16px; margin-bottom: 16px;">
        <div class="mdl-card__supporting-text mdl-card--expand" style="text-align: center; width: 94%">
            <div id="tblAddEssay" runat="server">
                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <asp:Label CssClass="mdl-textfield__label" ID="lblAddEssayText" runat="server" Text=" Essay Question: " Style="bottom: 0px" />
                    <asp:TextBox CssClass="mdl-textfield__input" ID="txtAddEssayText" runat="server" />
                </div>
                <br />
                <asp:RequiredFieldValidator ID="ValidatorEssay" runat="server" ErrorMessage="Please an Essay Question" ForeColor="Red" ControlToValidate="txtAddEssayText" SetFocusOnError="True" ValidationGroup="testQuestions"></asp:RequiredFieldValidator>
            </div>
        </div>
    </div>


    <!-- Matching -->
    <asp:SqlDataSource ID="sqlAddMatchingQuestion" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
SELECT question_id, question_text, answer
  FROM question_matching_body
 WHERE question_id = :p_QuestionID">
        <SelectParameters>
            <asp:SessionParameter Name="p_QuestionID" SessionField="QuestionID" />
        </SelectParameters>
    </asp:SqlDataSource>


    <div class="demo-card mdl-card mdl-shadow--2dp" id="cardMatching" runat="server" style="width: 44%; float: none; left: 28%; margin-top: 16px; margin-bottom: 16px;">
        <div class="mdl-card__supporting-text mdl-card--expand" style="text-align: center; width: 94%">
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <div id="tblMatchingSection" runat="server">
                    <asp:Label CssClass="mdl-textfield__label" ID="lblAddMatchingText" runat="server" Text="Header Text: " Style="bottom: 0px" />
                    <asp:TextBox CssClass="mdl-textfield__input" ID="txtAddMatchingText" runat="server" />
                </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter a Question Weight" ForeColor="Red" ControlToValidate="txtAddWeight" SetFocusOnError="True" ValidationGroup="testQuestions"></asp:RequiredFieldValidator>
            </div>
            <br />
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <asp:Label CssClass="mdl-textfield__label" ID="lblAddMatchingAnswer" runat="server" Text="Answer" Style="bottom: 0px" />
                <asp:TextBox CssClass="mdl-textfield__input" ID="txtAddMatchingAnswer" runat="server" />
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <asp:Label CssClass="mdl-textfield__label" ID="lblAddMatchingQuestion" runat="server" Text="Question" Style="bottom: 0px" />
                <asp:TextBox CssClass="mdl-textfield__input" ID="txtAddMatchingQuestion" runat="server" />
            </div>
            <br />
            <div>
                <asp:Button ID="btnAddMatchingQuestion" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" runat="server" ForeColor="white" Text="Add Matching Question" OnClick="btnAddMatchingQuestion_Click" />
            </div>

        </div>
    </div>



    <div class="demo-card mdl-card mdl-shadow--2dp" id="cardAddedMatching" runat="server" style="width: 44%; float: none; left: 28%; margin-top: 16px; margin-bottom: 16px;">
        <div class="mdl-card__supporting-text mdl-card--expand" style="text-align: center; width: 94%">
            <div class="table-responsive-vertical shadow-z-1">
                <asp:GridView CssClass="table table-hover table-mc-light-blue" CellSpacing="-1" GridLines="None" ID="grdAddMatchingQuestion" runat="server" AutoGenerateColumns="False" DataKeyNames="question_id" DataSourceID="sqlAddMatchingQuestion">
                    <Columns>
                        <asp:BoundField DataField="question_id" HeaderText="Question ID" SortExpression="question_id" />
                        <asp:BoundField DataField="question_text" HeaderText="Question" SortExpression="question_text" />
                        <asp:BoundField DataField="answer" HeaderText="Answer" SortExpression="answer" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>


    <!-- Multiple Choice -->
    <asp:SqlDataSource ID="sqlMultipleChoiceBody" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
SELECT choice_id, question_id, choice_text, set_order
  FROM question_multiple_choice_body
 WHERE question_id = :p_QuestionID">
        <SelectParameters>
            <asp:SessionParameter Name="p_QuestionID" SessionField="QuestionID" />
        </SelectParameters>
    </asp:SqlDataSource>


    <div class="demo-card mdl-card mdl-shadow--2dp" id="cardMultipleChoice" runat="server" style="width: 44%; float: none; left: 28%; margin-top: 16px; margin-bottom: 16px;">
        <div class="mdl-card__supporting-text mdl-card--expand" style="text-align: center; width: 94%">
            <div id="tblAddMultipleChoice" runat="server">

                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <asp:Label ID="lblAddMutipleChoiceQuestion" CssClass="mdl-textfield__label" runat="server" Text="Question: " Style="bottom: 0px" />
                    <asp:TextBox ID="txtAddMultipleChoiceQuestion" CssClass="mdl-textfield__input" runat="server" />
                </div>
                <br />
                <asp:RequiredFieldValidator ID="MCValidator" runat="server" ErrorMessage="Please Enter Header Text" ForeColor="Red" ControlToValidate="txtAddMultipleChoiceQuestion" SetFocusOnError="True" ValidationGroup="testQuestions"></asp:RequiredFieldValidator>
                <br />
            </div>
        </div>
    </div>



    <div class="demo-card mdl-card mdl-shadow--2dp" id="cardAddedMultiple" runat="server" style="width: 44%; float: none; left: 28%; margin-top: 16px; margin-bottom: 16px;">
        <div class="mdl-card__supporting-text mdl-card--expand" style="text-align: center; width: 94%">
            <div class="table-responsive-vertical shadow-z-1">
                <asp:GridView ID="grdMultipleChoiceBody" CssClass="table table-hover table-mc-light-blue" CellSpacing="-1" GridLines="None" OnRowDataBound="grdMultipleChoiceBody_RowDataBound" runat="server" AutoGenerateColumns="False" DataKeyNames="CHOICE_ID" DataSourceID="sqlMultipleChoiceBody">
                    <Columns>
                        <asp:BoundField DataField="QUESTION_ID" HeaderText="Question ID" SortExpression="QUESTION_ID" />
                        <asp:BoundField DataField="CHOICE_TEXT" HeaderText="CHOICE_TEXT" SortExpression="CHOICE_TEXT" />
                        <asp:BoundField DataField="SET_ORDER" HeaderText="SET_ORDER" SortExpression="SET_ORDER" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>

    </div>



    <!-- Short Answer -->

    <div class="demo-card mdl-card mdl-shadow--2dp" id="cardShortAnswer" runat="server" style="width: 44%; float: none; left: 28%; margin-top: 16px; margin-bottom: 16px;">
        <div class="mdl-card__supporting-text mdl-card--expand" style="text-align: center; width: 94%">
            <div id="tblAddShortAnswer" runat="server">
                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <asp:Label ID="lblBeforeText" CssClass="mdl-textfield__label" runat="server" Text="Before Text: " Style="bottom: 0px" />
                    <asp:TextBox ID="txtBeforeText" CssClass="mdl-textfield__input" runat="server" />
                </div>
                <br />
                <br />
                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <asp:Label ID="lblAnswerText" CssClass="mdl-textfield__label" runat="server" Text="Answer Text: " Style="bottom: 0px" />
                    <asp:TextBox ID="txtAnswerText" CssClass="mdl-textfield__input" runat="server" />
                </div>
                <br />
                <asp:RequiredFieldValidator ID="AnswerTextValidator" runat="server" ErrorMessage="Please Enter Answer Text" ForeColor="Red" ControlToValidate="txtAnswerText" SetFocusOnError="True" ValidationGroup="testQuestions"></asp:RequiredFieldValidator>
                <br />

                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <asp:Label ID="lblAfterText" CssClass="mdl-textfield__label" runat="server" Text="After Text: " Style="bottom: 0px" />
                    <asp:TextBox ID="txtAfterText" CssClass="mdl-textfield__input" runat="server" />
                </div>
                <br />
                <asp:Label ID="lblSAError" runat="server" Text="Please Enter After Text" ForeColor="Red" Visible="false" />
                <br />
            </div>
        </div>
    </div>


    <!-- True False -->

    <div class="demo-card mdl-card mdl-shadow--2dp" id="cardTrueFalse" runat="server" style="width: 44%; float: none; left: 28%; margin-top: 16px; margin-bottom: 16px;">
        <div class="mdl-card__supporting-text mdl-card--expand" style="text-align: center; width: 94%">
            <div id="tblAddTrueFalse" runat="server">
                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <asp:Label ID="lblAddTFQuestion" CssClass="mdl-textfield__label" runat="server" Text="Question: " Style="bottom: 0px" />
                    <asp:TextBox ID="txtAddTFQuestion" CssClass="mdl-textfield__input" runat="server" />
                </div>
                <br />
                <asp:RequiredFieldValidator ID="TFValidator" runat="server" ErrorMessage="Please Enter Question Text" ForeColor="Red" ControlToValidate="txtAddTFQuestion" SetFocusOnError="True" ValidationGroup="testQuestions"></asp:RequiredFieldValidator>
                <br />

                <label id="lblAddTFAnswer" class="mdl-textfield__label" runat="server" style="position: unset; text-align: center; color: black">Answer: </label>
                <div style="margin-left: 41%">
                    <asp:RadioButtonList ID="rblAddTFAnswer" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Text="True" Value="T" />
                        <asp:ListItem Text="False" Value="F" />
                    </asp:RadioButtonList>

                </div>
            </div>
        </div>
    </div>

    <div style="text-align: center;">
        <asp:Button ID="btnAddQuestion" ForeColor="White" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" runat="server" Text="Add A Question" ValidationGroup="testQuestions" OnClick="btnAddQuestion_Click" />
    </div>

    <!-- Multiple Choice Choices -->

    <div class="demo-card mdl-card mdl-shadow--2dp" id="cardMultipleChoiceChoice" runat="server" style="width: 44%; float: none; left: 28%; margin-top: 16px; margin-bottom: 16px;">
        <div class="mdl-card__supporting-text mdl-card--expand" style="text-align: center; width: 94%">
            <div id="Div2" runat="server">
                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <asp:Label ID="lblAddMultipleChoiceBody" CssClass="mdl-textfield__label" runat="server" Text="Answer: " Style="bottom: 0px"></asp:Label>
                    <asp:TextBox ID="txtMultipleChoiceBody" CssClass="mdl-textfield__input" runat="server"></asp:TextBox>
                </div>
                <br />
                <asp:RequiredFieldValidator ID="MultipleChoiceValidator" runat="server" ErrorMessage="Please Enter Question Text" ForeColor="Red" ControlToValidate="txtMultipleChoiceBody" SetFocusOnError="True" ValidationGroup="testQuestions"></asp:RequiredFieldValidator>
                <br />
                <label id="lblAddMultipleChoiceAnswer" class="mdl-textfield__label" runat="server" style="position: unset; margin-left: 45%; color: black" for="chkMultipleChoiceAnswer">is Answer: </label>
                <asp:CheckBox ID="chkMultipleChoiceAnswer" runat="server" />
                <br />
                <asp:Button CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" ForeColor="White" ID="btnNewMultipleChoice" runat="server" Text="Add Choice" OnClick="btnNewMultipleChoice_Click" />
                <asp:Button CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" ForeColor="White" ID="btnAddMCBody" runat="server" Text="Finish Question" OnClick="btnSaveMCBody_Click" />
            </div>
        </div>
    </div>


    <div style="position: fixed; right: 31px; margin-top: 413px; z-index: 2;">
        <asp:Button ID="finishTest" Height="53px" ForeColor="White" BackColor="Green" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" runat="server" Text="Back To Dashboard" OnClick="finishTest_Click" />
    </div>
    <!-- Question Display Section -->
    <asp:SqlDataSource ID="sqlQuestionDisplay" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
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
 ORDER BY test_order"
        DeleteCommand="
BEGIN
  QUESTIONS.delete(p_QuestionID =&gt; :question_id);
END;">
        <SelectParameters>
            <asp:SessionParameter Name="p_TestID" SessionField="Test_ID" />
        </SelectParameters>
    </asp:SqlDataSource>


    <%--  <!-- The following code is unaltered code from http://stackoverflow.com/questions/5288682/maintain-panel-scroll-position-on-partial-postback-asp-net -->
    <!-- This fixes the partial post pack not maintaining scroll possition error -->
    <a<%--sp:ScriptManager ID="ScriptManager1" runat="server" ScriptMode="Release" />
    <script type="text/javascript">
        // It is important to place this JavaScript code after ScriptManager1
        var xPos, yPos;
        var prm = Sys.WebForms.PageRequestManager.getInstance();

        function BeginRequestHandler(sender, args) {
            if ($get('<%=Panel1.ClientID%>') != null) {
              // Get X and Y positions of scrollbar before the partial postback
              xPos = $get('<%=Panel1.ClientID%>').scrollLeft;
            yPos = $get('<%=Panel1.ClientID%>').scrollTop;
        }
    }

    function EndRequestHandler(sender, args) {
        if ($get('<%=Panel1.ClientID%>') != null) {
             // Set X and Y positions back to the scrollbar
             // after partial postback
             $get('<%=Panel1.ClientID%>').scrollLeft = xPos;
             $get('<%=Panel1.ClientID%>').scrollTop = yPos;
         }
     }

     prm.add_beginRequest(BeginRequestHandler);
     prm.add_endRequest(EndRequestHandler);
    </script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Panel ID="Panel1" runat="server" Height="300">
                <!-- End borrowed Code, except the closeing tags... -->--%>
    <main class="mdl-layout__content" style="width: 100%;">
        <div class="content-grid mdl-grid">

            <asp:ListView ID="lstQuestionDisplay" runat="server" DataSourceID="sqlQuestionDisplay" DataKeyNames="question_id" OnItemUpdating="lstQuestionDisplay_ItemUpdating" OnItemDataBound="lstQuestionDisplay_ItemDataBound" OnItemEditing="lstQuestionDisplay_ItemEditing">
                <ItemTemplate>
                    <div class="mdl-cell mdl-cell--4-col">
                        <div class="demo-card-wide mdl-card-addClass mdl-shadow--3dp demo-card-square mdl-card">
                            <div class="mdl-card__supporting-text" style="text-align: center">
                                <asp:HiddenField ID="hdnQuestionID" runat="server" Value='<%#Bind("question_id") %>' />
                                <asp:HiddenField ID="hdnQuestionType" runat="server" Value='<%#Bind("type") %>' />
                                <div style="font-size: 17pt">
                                    <asp:Label ID="lblDispTestOrder" runat="server" Text="Question" />
                                    <asp:Label ID="lblTestOrder" runat="server" Text='<%#Eval("test_order") %>' />
                                </div>
                                <br />
                                <div id="divQuestion" runat="server">

                                    <div style="text-align: center">

                                        <asp:LinkButton ID="LinkButton1" ForeColor="White" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" runat="server" Text="Edit" CommandName="Edit" />
                                        <asp:LinkButton ID="LinkButton2" ForeColor="White" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" runat="server" Text="Delete" CommandName="Delete" />
                                    </div>
                                    <br />
                                    <div>
                                        <asp:Label ID="lblDispWeight" runat="server" Text="Weight: " />
                                        <asp:Label ID="lblWeight" runat="server" Text='<%#Eval("weight") %>' />
                                    </div>

                                </div>

                                <!-- Essay Question Display -->
                                <div id="divEQuestion" runat="server">
                                    <asp:Label ID="lblDispEQuestion" runat="server" Text="Question: " />
                                    <asp:Label ID="lblEQuestion" runat="server" Text='<%#Eval("essay_question") %>' />
                                </div>

                                <!-- Matching Question Display -->
                                <%--<asp:SqlDataSource ID="sqlDispMQuestion" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
SELECT question_id, question_text, answer
  FROM question_matching_body
 WHERE question_id = :p_QuestionID">
                                    <SelectParameters>
                                        <asp:ControlParameter Name="p_QuestionID" ControlID="hdnQuestionID" PropertyName="value" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <div id="divMQuestion" runat="server">
                                    <div style="text-align: center">
                                        <asp:Label ID="lblDispMQuestion" runat="server" Text="Question: " />
                                        <asp:Label ID="txtMQuestion" runat="server" Text='<%#Eval("matching_question") %>' />
                                    </div>
                                    <div class="table-responsive-vertical shadow-z-1">
                                        <asp:GridView CssClass="table table-hover table-mc-light-blue" ID="grdDispMQuestion" runat="server" OnRowDataBound="grdDispMQuestion_RowDataBound" AutoGenerateColumns="False" DataKeyNames="question_id" DataSourceID="sqlDispMQuestion" CellSpacing="-1" GridLines="None">
                                            <Columns>
                                                <asp:BoundField DataField="question_text" HeaderText="Question" SortExpression="question_text" />
                                                <asp:BoundField DataField="answer" HeaderText="Answer" SortExpression="answer" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>--%>

                                <!-- Multiple Choice Question Display -->
                                <asp:SqlDataSource ID="sqlDispMC" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
SELECT question_id, choice_text, NVL(correct, 'N') AS answer, set_order
  FROM question_multiple_choice mc
                  JOIN question_multiple_choice_body mcb USING (question_id)
       LEFT OUTER JOIN (SELECT smcb.choice_id, 'Y' AS correct
                          FROM question_multiple_choice smc
                               LEFT OUTER JOIN question_multiple_choice_body smcb USING (question_id)
                         WHERE smc.choice_id = smcb.choice_id) a ON (a.choice_id = mcb.choice_id)
 WHERE question_id = :p_QuestionID
 ORDER BY set_order">
                                    <SelectParameters>
                                        <asp:ControlParameter Name="p_QuestionID" ControlID="hdnQuestionID" PropertyName="value" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <div id="divMCQuestion" runat="server">
                                    <div>
                                        <asp:Label ID="lblDispMCQuestion" runat="server" Text="Question: " />
                                        <asp:Label ID="txtMCQuestion" runat="server" Text='<%#Eval("multiple_choice_question") %>' />
                                    </div>
                                    <div class="table-responsive-vertical shadow-z-1">
                                    <asp:GridView CssClass="table table-hover table-mc-light-blue" ID="grdMChoice" OnRowDataBound="grdMChoice_RowDataBound" AutoGenerateColumns="false" CellSpacing="-1" GridLines="None" runat="server" DataKeyNames="question_id" DataSourceID="sqlDispMC">
                                        <Columns>
                                            <asp:BoundField DataField="answer" HeaderText="Answer" SortExpression="answer" />
                                            <asp:BoundField DataField="choice_text" HeaderText="Choice Text" SortExpression="choice_text" />
                                            <asp:BoundField DataField="set_order" HeaderText="Set Order" SortExpression="set_order" />
                                        </Columns>
                                    </asp:GridView>
                                    </div>
                                </div>

                                <!-- Short Answer Question Display -->
                                <div id="divSAQuestion" runat="server">
                                    <asp:Label ID="lblDispBeforeText" runat="server" Text="Before Text: " />
                                    <asp:Label ID="lblBeforeText" runat="server" Text='<%#Eval("before_text") %>' />
                                    <div style="text-align: center">
                                        <asp:Label ID="lblDispSAAnswer" runat="server" Text="Answer: " />
                                        <asp:Label ID="lblSAAnswer" runat="server" Text='<%#Eval("short_answer_answer") %>' />
                                    </div>
                                    <div style="text-align: center">
                                        <asp:Label ID="lblDispAfterText" runat="server" Text="After Text: " />
                                        <asp:Label ID="lblAfterText" runat="server" Text='<%#Eval("after_text") %>' />
                                    </div>
                                </div>

                                <!-- True False Question Display -->
                                <div id="divTFQuestion" runat="server">
                                    <div>
                                        <asp:Label ID="lblDispQuestion" runat="server" Text="Question: " />
                                        <asp:Label ID="lblQuestion" runat="server" Text='<%#Eval("true_false_question") %>' />
                                        <br />
                                        <asp:Label ID="lblDispAnswer" runat="server" Text="Answer: " />
                                        <asp:Label ID="lblAnswer" runat="server" Text='<%#Eval("true_false_answer") %>' />

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>


                <EditItemTemplate>
                    <div class="mdl-cell mdl-cell--4-col">
                        <div class="demo-card-wide mdl-card-addClass mdl-shadow--3dp demo-card-square mdl-card">
                            <div class="mdl-card__supporting-text" style="text-align: center">
                                <asp:HiddenField ID="hdnQuestionID" runat="server" Value='<%#Bind("question_id") %>' />
                                <asp:HiddenField ID="hdnQuestionType" runat="server" Value='<%#Bind("type") %>' />
                                <div id="divQuestion" runat="server">
                                    <div style="text-align: center;">
                                        <asp:LinkButton ID="btnUpdateQuestion" runat="server" ForeColor="White" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" Text="Update" CommandName="Update" CommandArgument='<%#Bind("question_id") %>' />
                                        <asp:LinkButton ID="btnCancel" runat="server" Text="Cancel" ForeColor="White" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" CommandName="Cancel" CommandArgument='<%#Bind("question_id") %>' />
                                        <br />
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                            <asp:Label CssClass="mdl-textfield__label" ID="lblEditWeight" runat="server" Style="bottom: 0px"> Weight: </asp:Label>
                                            <asp:TextBox CssClass="mdl-textfield__input" ID="txtEditWeight" runat="server" Text='<%#Bind("weight") %>' />
                                        </div>
                                        <br />
                                        <asp:RequiredFieldValidator ID="weightValidator" runat="server" ErrorMessage="Please Enter Weight Text" ForeColor="Red" ControlToValidate="txtEditWeight" SetFocusOnError="True" ValidationGroup="testQuestions"></asp:RequiredFieldValidator>
                                        <br />
                                        </br>
                                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                        <asp:Label CssClass="mdl-textfield__label" ID="lblEditTestOrder" runat="server" Style="bottom: 0px">Test Order: </asp:Label>
                                                        <asp:TextBox CssClass="mdl-textfield__input" ID="txtEditTestOrder" runat="server" Text='<%#Bind("test_order") %>' />
                                                    </div>
                                        <br />
                                        <asp:RequiredFieldValidator ID="testOrderValidator" runat="server" ErrorMessage="Please Enter Test Order" ForeColor="Red" ControlToValidate="txtEditTestOrder" SetFocusOnError="True" ValidationGroup="testQuestions"></asp:RequiredFieldValidator>
                                        <br />
                                    </div>

                                    <!-- Edit Essay -->
                                    <div id="divEQuestion" runat="server">
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="text-align: center;">
                                            <asp:Label ID="lblEditEQuestion" CssClass="mdl-textfield__label" runat="server" Style="bottom: 0px"> Question </asp:Label>
                                            <asp:TextBox ID="txtEditEQuestion" CssClass="mdl-textfield__input" runat="server" Text='<%#Bind("essay_question") %>' />
                                        </div>
                                        <br />
                                        <asp:RequiredFieldValidator ID="EssayQuestValidator" runat="server" ErrorMessage="Please Enter Essay Question" ForeColor="Red" ControlToValidate="txtEditTestOrder" SetFocusOnError="True" ValidationGroup="testQuestions"></asp:RequiredFieldValidator>
                                        <br />
                                    </div>

                                    <!-- Edit Matching -->
                                    <%--<div id="divMQuestion" runat="server">
                                        <div style="text-align: center;">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <asp:Label ID="lblEditMQuestion" CssClass="mdl-textfield__label" runat="server" Style="bottom: 0px"> Question: </asp:Label>
                                                <asp:TextBox ID="txtEditMQuestion" CssClass="mdl-textfield__input" runat="server" Text='<%#Bind("matching_question") %>' />
                                            </div>
                                            <asp:SqlDataSource ID="sqlEditMQuestion" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
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
                                                    <asp:ControlParameter Name="p_QuestionID" ControlID="hdnQuestionID" PropertyName="value" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                            <div class="table-responsive-vertical shadow-z-1">
                                                <asp:GridView CssClass="table table-hover table-mc-light-blue" ID="grdEditMQuestion" runat="server" DataSourceID="sqlEditMQuestion" DataKeyNames="matching_body_id" AutoGenerateColumns="false" ShowFooter="true" OnRowCommand="grdEditMQuestion_RowCommand" CellSpacing="-1" GridLines="None">
                                                    <Columns>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="lnkBtnEditMQuestion" ForeColor="White" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent sizeButton" runat="server" CommandName="edit">Edit</asp:LinkButton>
                                                                <asp:LinkButton ID="lnkBtnDeleteMQuestion" ForeColor="White" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent sizeButton" runat="server" CommandName="delete">Delete</asp:LinkButton>
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                                <asp:LinkButton ID="lnkBtnUpdateMQuestion" ForeColor="White" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent sizeButton" runat="server" CommandName="update">Update</asp:LinkButton>
                                                                <asp:LinkButton ID="lnkBtnCancelMQuestion" ForeColor="White" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent sizeButton" runat="server" CommandName="cancel">Cancel</asp:LinkButton>
                                                            </EditItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:LinkButton ID="lnkBtnEditMQuestion" ForeColor="White" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent sizeButton" runat="server" CommandName="Add">Add</asp:LinkButton>
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
                                            </div>
                                        </div>
                                    </div>--%>

                                    <!-- Edit Multiple Choice -->
                                    <asp:SqlDataSource ID="sqlMCQuestion" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" OnUpdating="sqlMCQuestion_Updating" SelectCommand="
SELECT question_id, mcb.choice_id AS choice_id, choice_text, NVL(correct, 'N') AS answer, set_order, DECODE(NVL(correct, 'N'), 'Y', 'Yes',
                                                                                                                               'N', 'No') AS disp_answer
  FROM question_multiple_choice mc
                  JOIN question_multiple_choice_body mcb USING (question_id)
       LEFT OUTER JOIN (SELECT smcb.choice_id, 'Y' AS correct
                          FROM question_multiple_choice smc
                               LEFT OUTER JOIN question_multiple_choice_body smcb USING (question_id)
                         WHERE smc.choice_id = smcb.choice_id) a ON (a.choice_id = mcb.choice_id)
 WHERE question_id = :p_QuestionID
 ORDER BY set_order"
                                        DeleteCommand="
BEGIN
  QUESTIONS_MULTIPLE_CHOICE_BODY.delete(p_ChoiceID =&gt; :choice_id);
END;" UpdateCommand="
BEGIN
  NULL;
END;">
                                        <SelectParameters>
                                            <asp:ControlParameter Name="p_QuestionID" ControlID="hdnQuestionID" PropertyName="value" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <div id="divMCQuestion" runat="server">
                                        <div style="text-align: center">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <asp:Label ID="lblDispMCQuestion" CssClass="mdl-textfield__label" runat="server" Style="bottom: 0px"> Question: </asp:Label>
                                                <asp:TextBox ID="txtEditMCQuestion" CssClass="mdl-textfield__input" runat="server" Text='<%#Eval("multiple_choice_question") %>' />
                                            </div>
                                        </div>
                                        <div class="table-responsive-vertical shadow-z-1">
                                            <asp:GridView CssClass="table table-hover table-mc-light-blue" OnRowDataBound="grdEditMChoice_RowDataBound" ID="grdEditMCChoice" runat="server" AutoGenerateColumns="False" DataKeyNames="choice_id" DataSourceID="sqlMCQuestion" ShowFooter="true" OnRowCommand="grdEditMChoice_RowCommand" ShowHeaderWhenEmpty="true" CellSpacing="-1" GridLines="None">
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:HiddenField ID="hdnEditMCChoiceID" runat="server" Value='<%#Bind("choice_id") %>' />
                                                            <asp:LinkButton ID="lnkEditMCEdit" ForeColor="White" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent sizeButton" runat="server" CommandName="edit">Edit</asp:LinkButton>
                                                            <asp:LinkButton ID="lnkEditMCDelete" ForeColor="White" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent sizeButton" runat="server" CommandName="delete">Delete</asp:LinkButton>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:HiddenField ID="hdnEditMCChoiceID" runat="server" Value='<%#Bind("choice_id") %>' />
                                                            <asp:LinkButton ID="lnkEditMCUpdate" ForeColor="White" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent sizeButton" runat="server" CommandName="update">Update</asp:LinkButton>
                                                            <asp:LinkButton ID="lnkEditMCDelete" ForeColor="White" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent sizeButton" runat="server" CommandName="cancel">Cancel</asp:LinkButton>
                                                        </EditItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:LinkButton ID="lnkEditMCAdd" ForeColor="White" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent sizeButton" runat="server" CommandName="add">Add</asp:LinkButton>
                                                        </FooterTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblEditMCAnswer" runat="server" Text='<%# Eval("disp_answer") %>' />
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:DropDownList ID="ddlEditMCEditAnswer" runat="server" SelectedValue='<%# Bind("answer") %>'>
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
                                                    <asp:TemplateField HeaderText="Choice Text">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblEditMCChoiceText" runat="server" Text='<%#Eval("choice_text") %>' />
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtEditMCEditChoiceText" runat="server" Text='<%# Bind("choice_text") %>' />
                                                        </EditItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:TextBox ID="txtEditMCAddChoiceText" runat="server" />
                                                        </FooterTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="set_order">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblEditMCSetOrder" runat="server" Text='<%#Eval("set_order") %>' />
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtEditMCEditSetOrder" runat="server" Text='<%# Bind("set_order") %>' />
                                                        </EditItemTemplate>
                                                        <FooterTemplate>
                                                        </FooterTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>

                                    <!-- Edit Short Answer -->
                                    <div id="divSAQuestion" runat="server">
                                        <div style="text-align: center">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <asp:Label ID="lblEditSABeforeText" CssClass="mdl-textfield__label" runat="server" Style="bottom: 0px"> Before Text </asp:Label>
                                                <asp:TextBox ID="txtEditSABeforeText" CssClass="mdl-textfield__input" runat="server" Text='<%#Bind("before_text") %>' />
                                            </div>
                                            <br />
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <asp:Label ID="lblEditSAAnswerText" CssClass="mdl-textfield__label" runat="server" Style="bottom: 0px"> Answer: </asp:Label>
                                                <asp:TextBox ID="txtEditSAAnswerText" CssClass="mdl-textfield__input" runat="server" Text='<%#Bind("short_answer_answer") %>' />
                                            </div>
                                            <br />
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <asp:Label ID="lblEditSAAfterText" CssClass="mdl-textfield__label" runat="server" Style="bottom: 0px"> After Text:</asp:Label>
                                                <asp:TextBox ID="txtEditSAAfterText" CssClass="mdl-textfield__input" runat="server" Text='<%#Bind("after_text") %>' />
                                            </div>
                                        </div>
                                    </div>

                                        <!-- Edit True False -->
                                    <div id="divTFQuestion" runat="server">
                                        <div style="text-align: center">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <asp:Label ID="lblEditTFQuestion" CssClass="mdl-textfield__label" runat="server" Style="bottom: 0px"> Question: </asp:Label>
                                                <asp:TextBox ID="txtEditTFQuestion" CssClass="mdl-textfield__input" runat="server" Text='<%#Bind("true_false_question") %>' />
                                            </div>
                                            <asp:Label ID="lblEditTFAnswer" runat="server" Text="Answer: " />
                                            <asp:DropDownList ID="ddlEditTFAnswer" runat="server" SelectedValue='<%#Bind("true_false_answer") %>'>
                                                <asp:ListItem Text="--" Value="" />
                                                <asp:ListItem Text="True" Value="T" />
                                                <asp:ListItem Text="False" Value="F" />
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </EditItemTemplate>
            </asp:ListView>
            <!-- old cell div -->
        </div>
    </main>
    <%--  </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="teacherPageSpecificJS" runat="server">
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src="../Assets/JS/ResponsiveTable.js"></script>
    <script>


        // show the question type card when number is typed into point value
        <%--        $(document).ready(function () {
            $('#<%= cardQuestionType.ClientID %>').on('input', function (e) {
                var weightInput = $('#<%= cardQuestionType.ClientID %>').val();
                if ($.isNumeric(weightInput)) {
                    $('#<%= txtAddWeight.ClientID %>').css("visibility", "visible");
                }
                else
                    $('#<%= txtAddWeight.ClientID %>').css("visibility", "hidden");
            });

            if ($.isNumeric($('#<%= txtAddWeight.ClientID %>').val()))
                $('#<%= cardQuestionType.ClientID %>').css("visibility", "visible");
            else
                $('#<%= cardQuestionType.ClientID %>').css("visibility", "hidden");

        });--%>
    </script>
</asp:Content>
