<%@ Page Title="Teacher | Question Creation" Language="C#" MasterPageFile="~/Master-Pages/teacher.master" AutoEventWireup="true" CodeBehind="questionCreation.aspx.cs" Inherits="QuestWebApp.Pages.questionCreation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="teacherBreadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="teacherHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="teacherExtraReferances" runat="server">
    <script src="../Assets/JS/Datepicker_old/jquery-2.1.3.min.js"></script>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="teacherWithSidebarSidebar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="teacherWithSidebarBodyContent" runat="server">

    <div class="demo-card-square mdl-card mdl-shadow--2dp" id="cardPoints" runat="server" style="width: 44%; float: none; margin-top: 16px; margin-bottom: 16px;">
        <div class="mdl-card__supporting-text mdl-card--expand" style="text-align: center; width: 94%">
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <asp:Label class="mdl-textfield__label" ID="lblAddWeight" runat="server" AssociatedControlID="txtAddWeight" Text="Question Point Value: " Style="bottom: 0px" />
                <asp:TextBox ID="txtAddWeight" class="mdl-textfield__input" runat="server" />
            </div>
            <br />
            <br />
            <%--<asp:Button ID="btnPointValue" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" runat="server" Text="Pick Question Type" OnClick="btnPointValue_Click" />--%>
        </div>
    </div>

    <div class="demo-card mdl-card mdl-shadow--2dp" id="cardQuestionType" runat="server" style="width: 44%; float: none; left: 28%; margin-top: 16px; margin-bottom: 16px; visibility: hidden;">
        <div class="mdl-card__supporting-text mdl-card--expand" style="text-align: center">
            <asp:Label ID="lblAddType" class="mdl-textfield__label" runat="server" Text="Question Type:" Style="text-align: center" />
            <br />
            <br />
            <br />
            <asp:RadioButtonList ID="rblAddType" CssClass="mdl-textfield_label" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rblAddType_SelectedIndexChanged" AutoPostBack="true">
                <asp:ListItem Text="Essay" Value="E" />
                <asp:ListItem Text="Matching" Value="M" />
                <asp:ListItem Text="Multiple Choice" Value="MC" />
                <asp:ListItem Text="Short Answer" Value="SA" />
                <asp:ListItem Text="True/False" Value="TF" />
            </asp:RadioButtonList>
        </div>
    </div>


    <!-- Essay -->
    <div class="demo-card-square mdl-card mdl-shadow--2dp" id="cardEssay" runat="server" style="width: 44%; float: none; margin-top: 16px; margin-bottom: 16px;">
        <div class="mdl-card__supporting-text mdl-card--expand" style="text-align: center; width: 94%">
            <div id="tblAddEssay" runat="server">
                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <asp:Label class="mdl-textfield__label" ID="lblAddEssayText" runat="server" Text=" Essay Question: " Style="bottom: 0px" />
                    <asp:TextBox class="mdl-textfield__input" ID="txtAddEssayText" runat="server" />
                </div>
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
                    <asp:Label class="mdl-textfield__label" ID="lblAddMatchingText" runat="server" Text="Header Text: " Style="bottom: 0px" />
                    <asp:TextBox class="mdl-textfield__input" ID="txtAddMatchingText" runat="server" />
                </div>
            </div>
            <br />
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <asp:Label class="mdl-textfield__label" ID="lblAddMatchingAnswer" runat="server" Text="Answer" Style="bottom: 0px" />
                <asp:TextBox class="mdl-textfield__input" ID="txtAddMatchingAnswer" runat="server" />
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <asp:Label class="mdl-textfield__label" ID="lblAddMatchingQuestion" runat="server" Text="Question" Style="bottom: 0px" />
                <asp:TextBox class="mdl-textfield__input" ID="txtAddMatchingQuestion" runat="server" />
            </div>
            <br />
            <asp:Button ID="btnAddMatchingQuestion" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" runat="server" Text="Add Matching Question" OnClick="btnAddMultipleChoice_Click" />
        </div>
    </div>
    <div class="demo-card mdl-card mdl-shadow--2dp" id="cardAddedMatching" runat="server" style="width: 44%; float: none; left: 28%; margin-top: 16px; margin-bottom: 16px;">
        <div class="mdl-card__supporting-text mdl-card--expand" style="text-align: center; width: 94%">
            <asp:GridView ID="grdAddMatchingQuestion" runat="server" AutoGenerateColumns="False" DataKeyNames="question_id" DataSourceID="sqlAddMatchingQuestion">
                <Columns>
                    <asp:BoundField DataField="question_id" HeaderText="question_id" SortExpression="question_id" />
                    <asp:BoundField DataField="question_text" HeaderText="question_text" SortExpression="question_text" />
                    <asp:BoundField DataField="answer" HeaderText="answer" SortExpression="answer" />
                </Columns>
            </asp:GridView>
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
                    <asp:Label ID="lblAddMutipleChoiceQuestion" class="mdl-textfield__label" runat="server" Text="Question: " Style="bottom: 0px" />
                    <asp:TextBox ID="txtAddMultipleChoiceQuestion" class="mdl-textfield__input" runat="server" />
                </div>

                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <asp:Label ID="lblAddMultipleChoiceBody" class="mdl-textfield__label" runat="server" Text="Answer: " Style="bottom: 0px"></asp:Label>
                    <asp:TextBox ID="txtMultipleChoiceBody" class="mdl-textfield__input" runat="server"></asp:TextBox>
                </div>
                <br />
                <asp:CheckBox ID="chkMultipleChoiceAnswer" runat="server" />
                <label id="lblAddMultipleChoiceAnswer" class="mdl-textfield__label" runat="server" style="position: unset; margin-left: 45%; color: black">is Answer </label>

                <asp:Button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" ID="btnNewMultipleChoice" runat="server" Text="Add Choice" OnClick="btnNewMultipleChoice_Click" />
            </div>
        </div>
    </div>

    <div class="demo-card mdl-card mdl-shadow--2dp" id="cardAddedMultiple" runat="server" style="width: 44%; float: none; left: 28%; margin-top: 16px; margin-bottom: 16px;">
        <div class="mdl-card__supporting-text mdl-card--expand" style="text-align: center; width: 94%">
            <asp:GridView ID="grdMultipleChoiceBody" runat="server" AutoGenerateColumns="False" DataKeyNames="CHOICE_ID" DataSourceID="sqlMultipleChoiceBody">
                <Columns>
                    <asp:BoundField DataField="QUESTION_ID" HeaderText="QUESTION_ID" SortExpression="QUESTION_ID" />
                    <asp:BoundField DataField="CHOICE_TEXT" HeaderText="CHOICE_TEXT" SortExpression="CHOICE_TEXT" />
                    <asp:BoundField DataField="SET_ORDER" HeaderText="SET_ORDER" SortExpression="SET_ORDER" />
                </Columns>
            </asp:GridView>
        </div>

    </div>

    <!-- Short Answer -->
    <div class="demo-card mdl-card mdl-shadow--2dp" id="cardShortAnswer" runat="server" style="width: 44%; float: none; left: 28%; margin-top: 16px; margin-bottom: 16px;">
        <div class="mdl-card__supporting-text mdl-card--expand" style="text-align: center; width: 94%">
            <div id="tblAddShortAnswer" runat="server">
                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <asp:Label ID="lblBeforeText" class="mdl-textfield__label" runat="server" Text="Before Text: " Style="bottom: 0px" />
                    <asp:TextBox ID="txtBeforeText" class="mdl-textfield__input" runat="server" />
                </div>

                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <asp:Label ID="lblAnswerText" class="mdl-textfield__label" runat="server" Text="Answer Text: " Style="bottom: 0px" />
                    <asp:TextBox ID="txtAnswerText" class="mdl-textfield__input" runat="server" />
                </div>

                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <asp:Label ID="lblAfterText" class="mdl-textfield__label" runat="server" Text="After Text: " Style="bottom: 0px" />
                    <asp:TextBox ID="txtAfterText" class="mdl-textfield__input" runat="server" />
                </div>
            </div>
        </div>
    </div>

    <!-- True False -->
    <div class="demo-card mdl-card mdl-shadow--2dp" id="cardTrueFalse" runat="server" style="width: 44%; float: none; left: 28%; margin-top: 16px; margin-bottom: 16px;">
        <div class="mdl-card__supporting-text mdl-card--expand" style="text-align: center; width: 94%">
            <div id="tblAddTrueFalse" runat="server">
                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <asp:Label ID="lblAddTFQuestion" class="mdl-textfield__label" runat="server" Text="Question: " Style="bottom: 0px" />
                    <asp:TextBox ID="txtAddTFQuestion" class="mdl-textfield__input" runat="server" />
                </div>

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
    <div style="text-align: center">
        <asp:Button ID="btnAddQuestion" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" runat="server" Text="Add A Question" OnClick="btnAddQuestion_Click" />
    </div>

    <!-- Question Display Section -->
    <asp:SqlDataSource ID="sqlQuestionDisplay" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
SELECT question_id, weight, type, question_text, answer
  FROM question
       JOIN question_true_false USING (question_id)
 WHERE test_id = :p_TestID">
        <SelectParameters>
            <asp:SessionParameter Name="p_TestID" SessionField="Test_ID" />
        </SelectParameters>
        <UpdateParameters>
            <asp:SessionParameter Name="p_TestID" SessionField="Test_ID" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <main class="mdl-layout__content">
        <div class="content-grid mdl-grid">
            
                <asp:ListView ID="lstQuestionDisplay" runat="server" DataSourceID="sqlQuestionDisplay" DataKeyNames="question_id" OnItemUpdating="lstQuestionDisplay_ItemUpdating">
                    <ItemTemplate>
                        <div class="mdl-cell mdl-cell--4-col">
                        <div class="demo-card-wide mdl-card-addClass mdl-shadow--3dp demo-card-square mdl-card">
                            <div class="mdl-card__supporting-text" style="text-align: center">
                                <div id="tblQuestion" runat="server" style="text-align: center;">
                                    <asp:LinkButton class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" ID="LinkButton1" runat="server" Text="Edit" CommandName="Edit" CommandArgument='<%#Bind("question_id") %>' />
                                    <asp:LinkButton class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" ID="LinkButton2" runat="server" Text="Delete" CommandArgument='<%#Bind("question_id") %>' />
                                    <br />
                                    <br />
                                    <asp:Label ID="lblDispWeight" runat="server" Text="Weight: " />
                                    <asp:Label ID="lblWeight" runat="server" Text='<%#Eval("weight") %>' />
                                </div>
                                <div id="tblTFQuestion" runat="server">
                                    <asp:Label ID="lblDispQuestion" runat="server" Text="Question: " />
                                    <asp:Label ID="lblQuestion" runat="server" Text='<%#Eval("question_text") %>' />
                                    <asp:Label ID="lblDispAnswer" runat="server" Text="Answer: " />
                                    <asp:Label ID="lblAnswer" runat="server" Text='<%#Eval("answer") %>' />
                                </div>
                            </div>
                        </div>
                            </div>
                    </ItemTemplate>


                    <EditItemTemplate>
                        <div class="mdl-cell mdl-cell--4-col">
                        <div class="demo-card-wide mdl-card-addClass mdl-shadow--3dp demo-card-square mdl-card">
                            <div class="mdl-card__supporting-text" style="text-align: center">
                                <div id="tblQuestion" runat="server" style="text-align: center">
                                    <asp:LinkButton class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" ID="btnEditQuestion" runat="server" Text="Update" CommandName="Update" CommandArgument='<%#Bind("question_id") %>' />
                                    <asp:LinkButton class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" ID="btnDeleteQuestion" runat="server" Text="Cancel" CommandName="Cancel" CommandArgument='<%#Bind("question_id") %>' />
                                    <br />
                                    <br />
                                    <asp:Label ID="lblDispWeight" runat="server" Text="Weight: " />
                                    <asp:TextBox ID="txtWeight" runat="server" Text='<%#Bind("weight") %>' />
                                </div>
                                <div id="tblTFQuestion" runat="server">
                                    <asp:Label ID="lblDispQuestion" runat="server" Text="Question: " />
                                    <asp:TextBox ID="txtQuestion" runat="server" Text='<%#Bind("question_text") %>' />

                                    <asp:Label ID="lblDispAnswer" runat="server" Text="Answer: " />
                                    <asp:TextBox ID="txtAnswer" runat="server" Text='<%#Bind("answer") %>' />
                                </div>
                            </div>
                        </div>
                            </div>
                    </EditItemTemplate>
                </asp:ListView>
            <!-- old cell div -->
        </div>
    </main>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="teacherPageSpecificJS" runat="server">

    <script>


        // show the question type card when number is typed into point value
        $(document).ready(function () {
            $('#<%= txtAddWeight.ClientID %>').on('input', function (e) {
                var weightInput = $('#<%= txtAddWeight.ClientID %>').val();
                if ($.isNumeric(weightInput)) {
                    $('#<%= cardQuestionType.ClientID %>').css("visibility", "visible");
                }
                else
                    $('#<%= cardQuestionType.ClientID %>').css("visibility", "hidden");
            });
        });
    </script>
</asp:Content>
