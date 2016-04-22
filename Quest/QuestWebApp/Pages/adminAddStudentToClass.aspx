<%@ Page Title="Admin | Assign Students" Language="C#" MasterPageFile="~/Master-Pages/admin.master" AutoEventWireup="true" CodeBehind="adminAddStudentToClass.aspx.cs" Inherits="QuestWebApp.Pages.adminAddStudentToClass" %>
<asp:Content ID="Content1" ContentPlaceHolderID="adminBreadcrumbs" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="adminHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="adminExtraReferances" runat="server">
    <script src="../Assets/JS/modernizerResponsiveTable.js"></script>
    <link href="../Assets/Styles/Responsive-Tables/responsiveTableNormalize.css" rel="stylesheet" />
    <link href="../Assets/Styles/Responsive-Tables/ResponsiveTableClass.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="adminWithSidebarSidebar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="adminWithSidebarBodyContent" runat="server">
    <div class="demo-card-wide mdl-shadow--3dp mdl-card" style="width: 70%; left: 17%">
        <div class="mdl-card__supporting-text" style="text-align: center">
           <div style="font-size:20pt">Select a Class</div>
            <!-- Textfield with Floating DropDown for classes -->
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="text-align: left;">
                <label style="padding-left: 1%;">Classes:</label>
                <asp:DropDownList ID="ddlClassSelect" CssClass="mdl-textfield__input" runat="server" DataSourceID="sqlAllSections" AppendDataBoundItems="true" AutoPostBack="true" DataTextField="full_information" DataValueField="section_id" OnSelectedIndexChanged="ddlClassSelect_SelectedIndexChanged" >
                    <asp:ListItem Value="0">-- Select a Class First --</asp:ListItem>
                </asp:DropDownList>
            </div>

             <div style="font-size:20pt">Select a Student</div>
            <!-- Textfield with Floating DropDown for students -->
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="text-align: left;">
                <label style="padding-left: 1%;">Students:</label>
                <asp:DropDownList ID="ddlStudentsSelect" CssClass="mdl-textfield__input" runat="server" DataSourceID="sqlStudents" DataTextField="FULL_NAME" DataValueField="user_id" Enabled="false" OnDataBound="ddlStudentsSelect_DataBound">
                </asp:DropDownList>
            </div>

            <div style="text-align: center">
            <asp:Button ID="btnStudenttoClass" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" ForeColor="White" runat="server" Text="Add Student To Class" OnClick="btnStudenttoClass_Click"/>
            </div>
        </div>
    </div>

     <div class="demo-card-wide mdl-shadow--3dp mdl-card" ID="cardAlreadyEnrolled" runat="server" style="width: 70%; left: 17%; margin-top:2%">
        <div class="mdl-card__supporting-text" style="text-align: center">
            <label style="padding-left: 1%; font-size:20pt">Students Enrolled In This Class Currently:</label>
            <br />
            <br />
            </div>
            <div class="table-responsive-vertical shadow-z-1">
    <asp:GridView OnPreRender="gvCurrentStudents_PreRender" ID="gvCurrentStudents" OnRowDataBound="gvCurrentStudents_RowDataBound" CssClass="table table-hover table-mc-light-blue"  runat="server" DataSourceID="sqlCurrentStudents"  DataKeyNames="enrollment_id" OnRowDeleted="gvCurrentStudents_RowDeleted" AutoGenerateColumns="false" CellSpacing="-1" GridLines="None">
    <Columns>
        <asp:TemplateField HeaderText="Delete">
                    <ItemTemplate>
                     <asp:LinkButton ID="lnkdelete" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" CellSpacing="-1" GridLines="None" runat="server" ForeColor="White" CommandName="delete">Delete</asp:LinkButton>
                    </ItemTemplate>
            </asp:TemplateField>
        <asp:TemplateField HeaderText="Enrollment ID" >
                        <ItemTemplate>
                            <asp:Label ID="lblEnrollmentID" runat="server" Text='<%# Eval("enrollment_id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
        <asp:TemplateField HeaderText="Students Enrolled" >
                        <ItemTemplate>
                            <asp:Label ID="lblStudentsEnrolled" runat="server" Text='<%# Eval("currently_enrolled") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
    </Columns>
    </asp:GridView>
                </div>
         </div>
    <asp:SqlDataSource ID="sqlCurrentStudents" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
SELECT end_user.f_name || ' ' || end_user.l_name as currently_enrolled, enrollment_id
  FROM end_user
       JOIN (SELECT user_id, enrollment_id
            FROM end_user
                 JOIN enrollment ON (student_id = user_id)
                      WHERE section_id = :p_SectionID) USING (user_id)
WHERE permission_level = 'S'" DeleteCommand="
BEGIN
    enrollments.delete(p_EnrollmentID =&gt; :enrollment_id);
END;">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlClassSelect" Name="p_SectionID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlAllSections" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
SELECT title || '/' || code || '-' || section_number || ' with ' || f_name || ' ' || l_name as full_information, section_id
  FROM section
       JOIN class    USING (class_id)
       JOIN end_user ON    (user_id = teacher_id)
       ORDER BY title asc">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sqlStudents" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
SELECT f_name || ' ' || l_name as full_name, user_id
  FROM end_user
 WHERE permission_level = 'S'
   AND user_id NOT IN (SELECT user_id
               FROM end_user
                    JOIN enrollment ON (student_id = user_id)
              WHERE section_id = :p_SectionID)
              ORDER BY l_name">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlClassSelect" Name="p_SectionID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="adminPageSpecificJS" runat="server">
    
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src="../Assets/JS/ResponsiveTable.js"></script>
</asp:Content>
