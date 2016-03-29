<%@ Page Title="Teacher | Question Creation" Language="C#" MasterPageFile="~/Master-Pages/teacher.master" AutoEventWireup="true" CodeBehind="questionCreation.aspx.cs" Inherits="QuestWebApp.Pages.questionCreation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="teacherBreadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="teacherHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="teacherExtraReferances" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="teacherWithSidebarSidebar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="teacherWithSidebarBodyContent" runat="server">


<div class="demo-card-square mdl-card mdl-shadow--2dp" style="width:20%; float:none">
  <div class="mdl-card__title mdl-card--expand">
   <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
    <asp:Label class="mdl-textfield__label" ID="lblAddWeight" runat="server" AssociatedControlID="txtAddWeight" Text="Point Value: " style="bottom:0px"/>
    <asp:TextBox ID="txtAddWeight" class="mdl-textfield__input" runat="server" />
        </div>
  </div>
</div>

    <div class="demo-card mdl-card mdl-shadow--2dp" style="width:46%; float:none;">
   <div class="mdl-card__title mdl-card--expand">
    <asp:Label ID="lblAddType" class="mdl-textfield__label" runat="server" Text="Question Type:" /> 
    <asp:RadioButtonList ID="rblAddType" class="mdl-textfield_label" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rblAddType_SelectedIndexChanged" AutoPostBack="true">
        <asp:ListItem Text="Essay" Value="E" />
        <asp:ListItem Text="Matching" Value="M" />
        <asp:ListItem Text="Multiple Choice" Value="MC" />
        <asp:ListItem Text="Short Answer" Value="SA" />
        <asp:ListItem Text="True/False" Value="TF" />
    </asp:RadioButtonList>
       </div>
    <br />
       </div>
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
    <asp:SqlDataSource ID="sqlAddMatchingQuestion" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
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
    <asp:SqlDataSource ID="sqlMultipleChoiceBody" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
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
            <div class="mdl-cell mdl-cell--4-col">
                <asp:ListView ID="lstQuestionDisplay" runat="server" DataSourceID="sqlQuestionDisplay" DataKeyNames="question_id" OnItemUpdating="lstQuestionDisplay_ItemUpdating">
                    <ItemTemplate>
                        <div class="demo-card-wide mdl-card-addClass mdl-shadow--3dp demo-card-square mdl-card">
                            <div class="mdl-card__supporting-text" style="text-align: center">
                                <asp:Table ID="tblQuestion" runat="server">
                                    <asp:TableHeaderRow>
                                        <asp:TableHeaderCell>
                                            <asp:LinkButton ID="LinkButton1" runat="server" Text="Edit" CommandName="Edit" CommandArgument='<%#Bind("question_id") %>' />
                                        </asp:TableHeaderCell><asp:TableHeaderCell>
                                            <asp:LinkButton ID="LinkButton2" runat="server" Text="Delete" CommandArgument='<%#Bind("question_id") %>' />
                                        </asp:TableHeaderCell>
                                    </asp:TableHeaderRow>
                                    <asp:TableRow>
                                        <asp:TableHeaderCell>
                                            <asp:Label ID="lblDispWeight" runat="server" Text="Weight: " />
                                        </asp:TableHeaderCell><asp:TableCell>
                                            <asp:Label ID="lblWeight" runat="server" Text='<%#Eval("weight") %>' />
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                                <asp:Table ID="tblTFQuestion" runat="server">
                                    <asp:TableRow>
                                        <asp:TableHeaderCell>
                                            <asp:Label ID="lblDispQuestion" runat="server" Text="Question: " />
                                        </asp:TableHeaderCell><asp:TableCell>
                                            <asp:Label ID="lblQuestion" runat="server" Text='<%#Eval("question_text") %>' />
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableHeaderCell>
                                            <asp:Label ID="lblDispAnswer" runat="server" Text="Answer: " />
                                        </asp:TableHeaderCell><asp:TableCell>
                                            <asp:Label ID="lblAnswer" runat="server" Text='<%#Eval("answer") %>' />
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </div>
                        </div>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <div class="demo-card-wide mdl-card-addClass mdl-shadow--3dp demo-card-square mdl-card">
                            <div class="mdl-card__supporting-text" style="text-align: center">
                                <asp:Table ID="tblQuestion" runat="server">
                                    <asp:TableHeaderRow>
                                        <asp:TableHeaderCell>
                                            <asp:LinkButton ID="btnEditQuestion" runat="server" Text="Update" CommandName="Update" CommandArgument='<%#Bind("question_id") %>' />
                                        </asp:TableHeaderCell><asp:TableHeaderCell>
                                            <asp:LinkButton ID="btnDeleteQuestion" runat="server" Text="Cancel" CommandName="Cancel" CommandArgument='<%#Bind("question_id") %>' />
                                        </asp:TableHeaderCell>
                                    </asp:TableHeaderRow>
                                    <asp:TableRow>
                                        <asp:TableHeaderCell>
                                            <asp:Label ID="lblDispWeight" runat="server" Text="Weight: " />
                                        </asp:TableHeaderCell><asp:TableCell>
                                            <asp:TextBox ID="txtWeight" runat="server" Text='<%#Bind("weight") %>' />
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                                <asp:Table ID="tblTFQuestion" runat="server">
                                    <asp:TableRow>
                                        <asp:TableHeaderCell>
                                            <asp:Label ID="lblDispQuestion" runat="server" Text="Question: " />
                                        </asp:TableHeaderCell><asp:TableCell>
                                            <asp:TextBox ID="txtQuestion" runat="server" Text='<%#Bind("question_text") %>' />
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableHeaderCell>
                                            <asp:Label ID="lblDispAnswer" runat="server" Text="Answer: " />
                                        </asp:TableHeaderCell><asp:TableCell>
                                            <asp:TextBox ID="txtAnswer" runat="server" Text='<%#Bind("answer") %>' />
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
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="teacherPageSpecificJS" runat="server">
</asp:Content>
