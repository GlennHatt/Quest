<%@ Page Title="Teacher | Students & Classes" Language="C#" MasterPageFile="~/Master-Pages/teacher.master" AutoEventWireup="true" CodeBehind="teacherStudentsandClasses.aspx.cs" Inherits="QuestWebApp.Pages.teacherStudentsandClasses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="teacherBreadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="teacherHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="teacherExtraReferances" runat="server">

    <script src="../Assets/JS/modernizerResponsiveTable.js"></script>
    <link href="../Assets/Styles/Responsive-Tables/responsiveTableNormalize.css" rel="stylesheet" />
    <link href="../Assets/Styles/Responsive-Tables/ResponsiveTableClass.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="teacherWithSidebarSidebar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="teacherWithSidebarBodyContent" runat="server">

    <div class="demo-card-wide mdl-shadow--3dp mdl-card" style="width: 70%; left: 17%">
        <div class="mdl-card__supporting-text" style="text-align: center">
            <h1>Select a Class</h1>
            <!-- Textfield with Floating DropDown for user type -->
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="text-align: left;">
                <label style="padding-left: 1%;">Classes:</label>
                <asp:DropDownList ID="ddlUserSelect" class="mdl-textfield__input" runat="server" AppendDataBoundItems="True" DataSourceID="sqlTeacherClasses" DataTextField="TITLE" DataValueField="TITLE" OnSelectedIndexChanged="ddlUserSelect_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:SqlDataSource ID="sqlTeacherClasses" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="SELECT TITLE FROM CLASS"></asp:SqlDataSource>
            </div>
        </div>
    </div>
    <br />
    <div class="demo-card-wide mdl-shadow--3dp mdl-card" style="float: none; width: 70%; left: 17%;">
        <div class="mdl-card__supporting-text" style="text-align: center; width:100%;">
            <h1>Students</h1>
            <div class="table-responsive-vertical shadow-z-1">
            <asp:GridView CssClass="table table-hover table-mc-light-blue" ID="gvStudents" runat="server" AutoGenerateColumns="False" DataSourceID="sqlTeacherStudents" RowStyle-Wrap="false" CellSpacing="-1" GridLines="None" OnRowDataBound="gvStudents_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="F_NAME" HeaderText="First Name" SortExpression="F_NAME" />
                    <asp:BoundField DataField="L_NAME" HeaderText="Last Name" SortExpression="L_NAME" />
                    <asp:BoundField DataField="EMAIL" HeaderText="E-mail" SortExpression="EMAIL" />
                </Columns>
            </asp:GridView>
                </div>
            <asp:SqlDataSource ID="sqlTeacherStudents" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="select f_name, l_name, email from end_user
where permission_level = 'S'"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="teacherPageSpecificJS" runat="server">
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src="../Assets/JS/ResponsiveTable.js"></script>

</asp:Content>
