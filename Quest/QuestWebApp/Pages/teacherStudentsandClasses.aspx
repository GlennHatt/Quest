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

    <div class="demo-card-wide mdl-shadow--3dp mdl-card" style="width: 50%; left: 30%">
        <div class="mdl-card__supporting-text" style="text-align: center">
            <h1>Select a Class</h1>
            <!-- Textfield with Floating DropDown for user type -->
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="text-align: left;">
                <label style="padding-left: 1%;">Classes:</label>
                <asp:DropDownList ID="ddlUserSelect" class="mdl-textfield__input" runat="server" AppendDataBoundItems="true">
                </asp:DropDownList>
            </div>
        </div>
    </div>
    <br />
    <div class="demo-card-wide mdl-shadow--3dp mdl-card" style="float: none; width: 50%; left: 30%;">
        <div class="mdl-card__supporting-text" style="text-align: center">
            <h1>Students</h1>
            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="teacherPageSpecificJS" runat="server">
</asp:Content>
