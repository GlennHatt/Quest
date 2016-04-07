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
                <asp:SqlDataSource ID="sqlTeacherClasses" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="select *
  from section
 where teacher_id = :session_id">
                    <SelectParameters>
                        <asp:SessionParameter Name="session_id" SessionField="UserID" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:DropDownList ID="ddlClassSelect" class="mdl-textfield__input" runat="server" AppendDataBoundItems="True" DataSourceID="sqlTeacherClasses" DataTextField="title" DataValueField="class_id" OnSelectedIndexChanged="ddlUserSelect_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
        </div>
        <div style="text-align: center">
        <asp:Button ID="btnStudenttoClass" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" runat="server" Text="Add Student To Class" />
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
            <asp:SqlDataSource ID="sqlTeacherStudents" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
SELECT s.f_name f_name, s.l_name l_name, s.email email
  FROM end_user s
       JOIN enrollment e  ON (e.student_id = s.user_id)
       JOIN section    sc ON (e.section_id = sc.section_id)
       JOIN end_user   t  ON (t.user_id    = sc.teacher_id)
       JOIN class      c  ON (c.class_id   = sc.class_id)
 WHERE s.permission_level = 'S'
       AND c.class_id = :p_ClassID">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlClassSelect" Name="p_ClassID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="teacherPageSpecificJS" runat="server">
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src="../Assets/JS/ResponsiveTable.js"></script>

</asp:Content>
