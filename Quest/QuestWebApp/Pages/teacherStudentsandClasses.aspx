<%@ Page Title="Teacher | Students & Classes" Language="C#" MasterPageFile="~/Master-Pages/teacher.master" AutoEventWireup="true" CodeBehind="teacherStudentsAndClasses.aspx.cs" Inherits="QuestWebApp.Pages.teacherStudentsAndClasses" %>
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
                <asp:SqlDataSource ID="sqlTeacherClasses" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
SELECT section_id, c.code || '-' || section_number AS section_title
  FROM section s
       JOIN class c USING (class_id)"></asp:SqlDataSource>
    <!-- Disabled for sessionIDs
 WHERE teacher_id = :session_id">
                    <SelectParameters>
                        <asp:SessionParameter Name="session_id" SessionField="UserID"/>
                    </SelectParameters>
                </asp:SqlDataSource> -->
                <asp:DropDownList ID="ddlClassSelect" class="mdl-textfield__input" runat="server" AppendDataBoundItems="True" DataSourceID="sqlTeacherClasses" DataTextField="section_title" AutoPostBack="true" DataValueField="section_id" OnSelectedIndexChanged="ddlUserSelect_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
        </div>
        <div style="text-align: center">
    </div>
    </div>
    <br />

     <div class="mdl-card mdl-shadow--3dp demo-card-wide sortButton" style="width: 70%; left: 17%">
        <div class="mdl-card__supporting-text" style="text-align: center; width: 100%;">
            <div class="mdl-textfield mdl-js-textfield" style="text-align: left;">
                <label style="padding-left: 1%;">Sort By:</label>
                <asp:DropDownList ID="ddlSortBy" runat="server" class="mdl-textfield__input" DataTextField="Sort By">
                    <asp:ListItem Value="Email"></asp:ListItem>
                    <asp:ListItem Value="Full Name"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="mdl-textfield mdl-js-textfield" style="text-align: left;">
                <asp:DropDownList ID="ddlSortDirection" runat="server" class="mdl-textfield__input">
                    <asp:ListItem Value="Ascending"></asp:ListItem>
                    <asp:ListItem Value="Descending"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <br />
            <asp:LinkButton ID="btnSortUsers" class="mdl-button mdl-js-button mdl-button--colored mdl-js-ripple-effect mdl-button--colored" BackColor="#FF6E40" ForeColor="White" runat="server" OnClick="btnSortUsers_Click">
           Sort
            </asp:LinkButton>
        </div>
        <%--Link http://ngenioussolutions.com/blog/responsive-gridview-for-mobile-phone-tablet-and-desktop-display-in-asp-net/--%>
    </div>

    <br />
    <div class="demo-card-wide mdl-shadow--3dp mdl-card" style="float: none; width: 70%; left: 17%;">
        <div class="mdl-card__supporting-text" style="text-align: center; width:100%;">
            <h1>Students</h1>
            <div class="table-responsive-vertical shadow-z-1">
            <asp:GridView CssClass="table table-hover table-mc-light-blue" ID="gvStudents" runat="server" AutoGenerateColumns="False" DataSourceID="sqlTeacherStudents" RowStyle-Wrap="false" CellSpacing="-1" GridLines="None" >
                <Columns>
                    <asp:BoundField DataField="FULL_NAME" HeaderText="Name" SortExpression="FULL_NAME" />
                    <asp:BoundField DataField="EMAIL" HeaderText="E-mail" SortExpression="EMAIL" />
                </Columns>
            </asp:GridView>
                </div>
            <asp:SqlDataSource ID="sqlTeacherStudents" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
SELECT s.f_name || ' ' || s.l_name full_name, s.email email
  FROM end_user s
       JOIN enrollment e  ON (e.student_id = s.user_id)
       JOIN section    sc ON (e.section_id = sc.section_id)
       JOIN end_user   t  ON (t.user_id    = sc.teacher_id)
       JOIN class      c  ON (c.class_id   = sc.class_id)
 WHERE s.permission_level = 'S'
       AND sc.section_id = :p_SectionID">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlClassSelect" Name="p_SectionID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="teacherPageSpecificJS" runat="server">
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src="../Assets/JS/ResponsiveTable.js"></script>

</asp:Content>