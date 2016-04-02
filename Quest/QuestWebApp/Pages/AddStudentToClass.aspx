<%@ Page Title="Admin | Add Students and Classes" Language="C#" MasterPageFile="~/Master-Pages/admin.master" AutoEventWireup="true" CodeBehind="addStudentToClass.aspx.cs" Inherits="QuestWebApp.Pages.AddStudentToClass" %>
<asp:Content ID="Content1" ContentPlaceHolderID="adminBreadcrumbs" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="adminHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="adminExtraReferances" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="adminWithSidebarSidebar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="adminWithSidebarBodyContent" runat="server">
    <div class="demo-card-wide mdl-shadow--3dp mdl-card" style="width: 70%; left: 17%">
        <div class="mdl-card__supporting-text" style="text-align: center">
            <div style="font-size:20pt">Select a Student</div>
            <!-- Textfield with Floating DropDown for user type -->
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="text-align: left;">
                <label style="padding-left: 1%;">Students:</label>
                <asp:DropDownList ID="ddlStudentsSelect" class="mdl-textfield__input" runat="server">
                </asp:DropDownList>
            </div>

            <div style="font-size:20pt">Select a Class</div>
            <!-- Textfield with Floating DropDown for user type -->
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="text-align: left;">
                <label style="padding-left: 1%;">Classes:</label>
                <asp:DropDownList ID="ddlClassSelect" class="mdl-textfield__input" runat="server">
                </asp:DropDownList>
            </div>
            <div style="text-align: center">
        <asp:Button ID="btnStudenttoClass" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" runat="server" Text="Add Student To Class" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="adminPageSpecificJS" runat="server">
</asp:Content>
