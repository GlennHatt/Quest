<%@ Page Title="Teacher | Students & Classes" Language="C#" MasterPageFile="~/Master-Pages/teacher.master" AutoEventWireup="true" CodeBehind="teacherStudentsandClasses.aspx.cs" Inherits="QuestWebApp.Pages.teacherStudentsandClasses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="teacherBreadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="teacherHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="teacherExtraReferances" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="teacherWithSidebarSidebar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="teacherWithSidebarBodyContent" runat="server">

    <div class="demo-card-wide mdl-shadow--3dp demo-card-square mdl-card">
                    <div class="mdl-card__supporting-text" style="text-align: center">
                        <h1>Select a Class</h1>
                        <!-- Textfield with Floating DropDown for user type -->
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="text-align:left;">
                            <Label style="padding-left:1%; " >Classes:</Label>
                            <asp:DropDownList ID="ddlUserSelect" class="mdl-textfield__input" runat="server" AppendDataBoundItems="true">
                                <asp:ListItem Value="S">Student</asp:ListItem>
                                <asp:ListItem Value="T">Teacher</asp:ListItem>
                                <asp:ListItem Value="A">Administrator</asp:ListItem>
                            </asp:DropDownList>   
                        </div>
                    </div>
        </div>

        <div class="demo-card-wide mdl-shadow--3dp demo-card-square mdl-card">
                    <div class="mdl-card__supporting-text" style="text-align: center">
                        <h1>Students</h1>
                        <!-- Textfield with Floating DropDown for user type -->
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="text-align:left;">
                        </div>
                    </div>
        </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="teacherPageSpecificJS" runat="server">
</asp:Content>
