﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Pages/admin.master" AutoEventWireup="true" CodeBehind="adminAddStudentToClass.aspx.cs" Inherits="QuestWebApp.Pages.adminAddStudentToClass" %>
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
           <div style="font-size:20pt">Select a Class</div>
            <!-- Textfield with Floating DropDown for classes -->
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="text-align: left;">
                <label style="padding-left: 1%;">Classes:</label>
                <asp:DropDownList ID="ddlClassSelect" class="mdl-textfield__input" runat="server" DataSourceID="sqlAllSections" AppendDataBoundItems="true" AutoPostBack="true" DataTextField="CLASS.TITLE||'/'||CLASS.CODE||'-'||SECTION.SECTION_NUMBER" DataValueField="section_id" OnSelectedIndexChanged="ddlClassSelect_SelectedIndexChanged">
                    <asp:ListItem Value="0">-- Select a Class First --</asp:ListItem>
                </asp:DropDownList>
            </div>

             <div style="font-size:20pt">Select a Student</div>
            <!-- Textfield with Floating DropDown for students -->
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="text-align: left;">
                <label style="padding-left: 1%;">Students:</label>
                <asp:DropDownList ID="ddlStudentsSelect" class="mdl-textfield__input" runat="server" DataSourceID="sqlStudents" DataTextField="FULL_NAME" DataValueField="user_id" Enabled="false">
                </asp:DropDownList>
            </div>

            <div style="text-align: center">
            <asp:Button ID="btnStudenttoClass" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" ForeColor="White" runat="server" Text="Add Student To Class" OnClick="btnStudenttoClass_Click" />
            </div>
        </div>
    </div>

     <div class="demo-card-wide mdl-shadow--3dp mdl-card" ID="cardAlreadyEnrolled" runat="server" style="width: 70%; left: 17%; margin-top:2%">
        <div class="mdl-card__supporting-text" style="text-align: center">
            <label style="padding-left: 1%; font-size:20pt">Students Enrolled In This Class Currently:</label>
            <br />
            <br />
    <asp:GridView ID="gvCurrentStudents" runat="server" DataSourceID="sqlCurrentStudents" DataKeyNames="enrollment_id" OnRowDeleted="gvCurrentStudents_RowDeleted">
    <Columns>
        <asp:TemplateField HeaderText="Delete">
                    <ItemTemplate>
                     <asp:LinkButton ID="lnkdelete" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" runat="server" ForeColor="White" CommandName="delete">Delete</asp:LinkButton>
                    </ItemTemplate>
            </asp:TemplateField>
    </Columns>
    </asp:GridView>
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
select class.title || '/' || class.code || '-' || section.section_number, section_id
  from section, class
 where section.class_id = class.class_id
 order by class.title asc">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sqlStudents" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
SELECT f_name || ' ' || l_name as full_name, user_id
  FROM end_user
 WHERE permission_level = 'S'
   AND user_id NOT IN (SELECT user_id
               FROM end_user
                    JOIN enrollment ON (student_id = user_id)
              WHERE section_id = :p_SectionID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlClassSelect" Name="p_SectionID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
                </div>
         </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="adminPageSpecificJS" runat="server">
</asp:Content>