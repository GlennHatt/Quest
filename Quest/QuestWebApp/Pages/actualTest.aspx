<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Pages/takingTest.master" AutoEventWireup="true" CodeBehind="actualTest.aspx.cs" Inherits="QuestWebApp.Pages.actualTest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="takingTestBreadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="takingTestHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="takingTestExtraReferances" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="takingTestBodyContent" runat="server">
    <p>
        <b />
        <div class="demo-card-wide mdl-card-addClass mdl-shadow--3dp demo-card-square mdl-card">
                    <div class="mdl-card__supporting-text" style="text-align: center">
                        <h1>Add New User</h1>
                        <!-- Textfield with Floating Label for teacher First name -->
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <asp:Label ID="lblTrueFalseQuestion" class="mdl-textfield__input" type="text" runat="server" />
                            <asp:RadioButton ID="radTrueChoice" Text="True" runat="server" GroupName="tfChoice"/>
                            <asp:RadioButton ID="radFalseChoice" Text="False" runat="server" GroupName="tfChoice" />
                            <!--<span id="lblFnameError" runat="server" class="mdl-textfield__error">Please enter first name</span>-->
                        </div>
                     </div>
         </div>                      
    </p>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="takingTestPageSpecificJS" runat="server">
</asp:Content>
