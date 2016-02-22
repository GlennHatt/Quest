<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Pages/admin.master" AutoEventWireup="true" CodeBehind="adminDashboard.aspx.cs" Inherits="QuestWebApp.Pages.adminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="adminBreadcrumbs" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="adminHead" runat="server">
    <title>Admin | Home</title>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="adminExtraReferances" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="adminWithSidebarSidebar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="adminWithSidebarBodyContent" runat="server">
    <!--<InsertParameters>
            <asp:ControlParameter ControlID="txtbxTeacherEmail" Name="p_Email" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtbxTeacherPassword" Name="p_Password" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtbxTeacherFirstName" Name="p_FName" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtbxTeacherLastName" Name="p_LName" PropertyName="Text" />
        </InsertParameters>-->
    <asp:SqlDataSource ID="sqlTeacher" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" InsertCommand="
DECLARE
  v_dummy pls_integer;
BEGIN
 v_dummy := END_USERS.add(
    p_Email           =&gt; 'a',
    p_Password        =&gt; 'b',
    p_FName           =&gt; @p_FName,
    p_LName           =&gt; 'd',
    p_PermissionLevel =&gt; 'T');
END;" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="SELECT * FROM END_USER">
        <InsertParameters>
            <asp:ControlParameter ControlID="txtbxTeacherFirstName" Name="p_FName" PropertyName="Text" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlStudent" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" InsertCommand="
END_USERS.add(
    p_Email           =&gt; :p_Email,
    p_Password        =&gt; :p_Password,
    P_FName           =&gt; :p_FName,
    p_LName           =&gt; :p_LName,
    p_PermissionLevel =&gt; :p_PermissionLevel);
  RETURN :v_Dummy;" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="SELECT * FROM END_USER">
        <InsertParameters>
            <asp:ControlParameter ControlID="txtbxStudentEmail" Name="p_Email" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtbxStudentPassword" Name="p_Password" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtbxStudentFirstName" Name="p_FName" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtbxStudentLastName" Name="p_LName" PropertyName="Text" />
            <asp:Parameter DefaultValue="S" Name="p_PermissionLevel" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlClass" runat="server"></asp:SqlDataSource>
    <main class="mdl-layout__content">
        <div class="content-grid mdl-grid">
            <div class="mdl-cell mdl-cell--4-col">
                <!-- Card for adding a teacher -->
                <!--
<style>
.demo-card-wide.mdl-cardAddTeacher {

  margin:10%;
  width: 400px;
  height: 578px;
}

</style> -->

                <div class="demo-card-wide mdl-cardAddTeacher mdl-shadow--3dp">
                    <div class="mdl-card__supporting-text" style="text-align: center">
                        <h1>Add a Teacher </h1>
                        <!-- Textfield with Floating Label for teacher First name -->
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <asp:TextBox ID="txtbxTeacherFirstName" class="mdl-textfield__input" type="text" runat="server" />
                            <label class="mdl-textfield__label" for="sample3">First Name:</label>
                        </div>

                        <!-- Textfield with Floating Label for teacher Last name -->
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <asp:TextBox ID="txtbxTeacherLastName" class="mdl-textfield__input" type="text" runat="server" />
                            <label class="mdl-textfield__label" for="sample3">Last Name:</label>
                        </div>

                        <!-- Textfield with Floating Label for teacher Email -->
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <asp:TextBox ID="txtbxTeacherEmail" class="mdl-textfield__input" type="text" runat="server" />
                            <label class="mdl-textfield__label" for="sample3">Email Address:</label>
                        </div>

                        <!-- Textfield with Floating Label for teacher password -->
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <asp:TextBox ID="txtbxTeacherPassword"  class="mdl-textfield__input" type="password" runat="server" OnTextChanged="txtbxTeacherPassword_TextChanged" />
                            <asp:label ID="lblPassword" class="mdl-textfield__label" runat="server" for="sample3">Password:</asp:label>
                        </div>

                        <!-- Textfield with Floating Label for teacher confirm password -->
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <asp:TextBox ID="txtbxTeacherConfirmPassword" class="mdl-textfield__input" type="password" runat="server" />
                            <label class="mdl-textfield__label" for="sample3">Confirm Password:</label>
                        </div>
                    </div>

                    <div style="text-align: right">
                        <!-- Colored FAB button with ripple -->

                        <asp:LinkButton ID="btnAddTeacher" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored" Style="right: 13px; bottom: 13px" runat="server" OnClick="btnAddTeacher_Click">
                            <i class="material-icons">add</i>
                        </asp:LinkButton>
                    </div>
                </div>

            </div>
            <div class="mdl-cell mdl-cell--4-col">
                <!-- Card for adding a student -->
                <!--
<style>
.demo-card-wide.mdl-cardAddStudent {

  margin: 10%;
  width: 400px;
  height: 578px;
}

</style> -->

                <div class="demo-card-wide mdl-cardAddStudent mdl-shadow--3dp">
                    <div class="mdl-card__supporting-text" style="text-align: center">
                        <h1>Add a Student </h1>




                        <!-- Textfield with Floating Label for student First name -->
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <asp:TextBox ID="txtbxStudentFirstName" class="mdl-textfield__input" type="text" runat="server" />
                            <label class="mdl-textfield__label" for="sample3">First Name:</label>
                        </div>

                        <!-- Textfield with Floating Label for student Last name -->
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <asp:TextBox ID="txtbxStudentLastName" class="mdl-textfield__input" type="text" runat="server" />
                            <label class="mdl-textfield__label" for="sample3">Last Name:</label>
                        </div>

                        <!-- Textfield with Floating Label for student Email -->
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <asp:TextBox ID="txtbxStudentEmail" class="mdl-textfield__input" type="text" runat="server" />
                            <label class="mdl-textfield__label" for="sample3">Email Address:</label>
                        </div>

                        <!-- Textfield with Floating Label for student password -->
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <asp:TextBox ID="txtbxStudentPassword" class="mdl-textfield__input" type="password" runat="server" />
                            <label class="mdl-textfield__label" for="sample3">Password:</label>
                        </div>

                        <!-- Textfield with Floating Label for student confirm password -->
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <asp:TextBox ID="txtbxStudentConfirmPassword" class="mdl-textfield__input" type="password" runat="server" />
                            <label class="mdl-textfield__label" for="sample3">Confirm Password:</label>
                        </div>
                    </div>


                    <div style="text-align: right">
                        <!-- Colored FAB button with ripple -->
                        <asp:LinkButton ID="btnAddStudent" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored" Style="right: 13px; bottom: 13px" runat="server" OnClick="btnAddStudent_Click">
          <i class="material-icons">add</i>
                        </asp:LinkButton>
                    </div>
                </div>
            </div>
            <div class="mdl-cell mdl-cell--4-col">
                <!-- Card for adding a class -->
                <!--
<style>
.demo-card-wide.mdl-card-addClass {

  margin:10%;
  width: 400px;
  height: 400px;
}

</style> -->

                <div class="demo-card-wide mdl-card-addClass mdl-shadow--3dp">
                    <div class="mdl-card__supporting-text" style="text-align: center">
                        <h1>Add a Class </h1>
                        <!-- Textfield with Floating Label for Title -->
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <asp:TextBox ID="txtbxClassTitle" class="mdl-textfield__input" type="text" runat="server" />
                            <label class="mdl-textfield__label" for="sample3">Title:</label>
                        </div>

                        <!-- Textfield with Floating Label for Course Number -->
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <asp:TextBox ID="txtbxCourseNumber" class="mdl-textfield__input" type="text" runat="server" />
                            <label class="mdl-textfield__label" for="sample3">Course Number:</label>
                        </div>

                        <div style="text-align: right">
                            <!-- Colored FAB button with ripple -->
                            <asp:LinkButton ID="btnAddClass" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored" Style="right: 13px; bottom: -12px" runat="server" OnClick="btnAddClass_Click">
          <i class="material-icons">add</i>
                            </asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="adminPageSpecificJS" runat="server">
</asp:Content>
