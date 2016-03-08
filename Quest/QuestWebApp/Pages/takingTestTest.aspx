<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Pages/takingTest.master" AutoEventWireup="true" CodeBehind="takingTestTest.aspx.cs" Inherits="QuestWebApp.Pages.takingTestTest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="takingTestBreadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="takingTestHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="takingTestExtraReferances" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="takingTestBodyContent" runat="server">
<main class="mdl-layout__content">
                    <div class="content-grid mdl-grid">
    <%--<asp:Label ID="lblTesting" runat="server" Text="1"></asp:Label>--%>
    <br /><br />

    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="sqlTestQuestions">
            <ItemTemplate>
                <div class="mdl-cell mdl-cell--4-col">
                    <div class="demo-card-wide mdl-card-addClass mdl-shadow--6dp demo-card-square mdl-card">
                        <div class="mdl-card__supporting-text" style="text-align: center">
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                <asp:Label ID="Label1" class="mdl-textfield__input" Text='<%# Eval("tf_question") %>' runat="server" />
                                <asp:RadioButton ID="RadioButton1" class="mdl-radio__button" Text="True" runat="server" GroupName="TFChoice" /> 
                                <asp:RadioButton ID="RadioButton2" class="mdl-radio__button" Text="False" runat="server" GroupName="TFChoice" />
                            </div>
                        </div>
                    </div>
                </div>
        </ItemTemplate>
        <FooterTemplate>
            <div class="demo-card-wide mdl-card-addClass mdl-shadow--6dp demo-card-square mdl-card">
                <div class="mdl-card__supporting-text" style="text-align: center">
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <asp:Button ID="btnSubmitTest" class="mdl-textfield__input" Text="Finish Test" runat="server" OnClick="btnSubmitTest_Click" />
                    </div>
                </div>
            </div>
        </FooterTemplate>
</asp:Repeater>
</div>
                </main>
    <asp:SqlDataSource ID="sqlTestQuestions" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="SELECT question_true_false.question_text tf_question FROM QUESTION, QUESTION_TRUE_FALSE
WHERE question.TEST_ID = 1 
and question.question_id = question_true_false.question_id"></asp:SqlDataSource>

    <asp:ListView ID="ListView1" runat="server"></asp:ListView>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="takingTestPageSpecificJS" runat="server">
</asp:Content>