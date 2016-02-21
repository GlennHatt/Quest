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


    <main class="mdl-layout__content">
        <div class="content-grid mdl-grid">


            <!-- Card for adding a class -->
            <div class="mdl-cell mdl-cell--4-col">
                <div class="demo-card-wide mdl-card-addClass mdl-shadow--3dp demo-card-square mdl-card">
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
                            <asp:LinkButton ID="btnAddClass" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored" Style="right: 13px; bottom: -3px" runat="server">
          <i class="material-icons">add</i>
                            </asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Card for adding a section to a course -->
            <div class="mdl-cell mdl-cell--4-col">

                <div class="demo-card-wide mdl-card-addClass mdl-shadow--3dp demo-card-square mdl-card" style="height: 500px;">


                    <div class="mdl-card__supporting-text" style="text-align: center">
                        <h1>Add a Section </h1>
                        <div class="mdl-textfield mdl-js-textfield">
                            <asp:DropDownList ID="ddlSemester" runat="server" class="mdl-textfield__input" DataTextField="Semester:">
                            </asp:DropDownList>
                        </div>

                        <div class="mdl-textfield mdl-js-textfield">
                            <asp:DropDownList ID="ddlSection" runat="server" class="mdl-textfield__input" DataTextField="Semester:">
                                <asp:ListItem Value="Section #:"></asp:ListItem>
                                <asp:ListItem Value="1"></asp:ListItem>
                                <asp:ListItem Value="2"></asp:ListItem>
                                <asp:ListItem Value="3"></asp:ListItem>
                                <asp:ListItem Value="4"></asp:ListItem>
                                <asp:ListItem Value="5"></asp:ListItem>
                                <asp:ListItem Value="6"></asp:ListItem>
                                <asp:ListItem Value="7"></asp:ListItem>
                                <asp:ListItem Value="8"></asp:ListItem>
                                <asp:ListItem Value="9"></asp:ListItem>
                                <asp:ListItem Value="10"></asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <div class="mdl-textfield mdl-js-textfield">
                            <asp:DropDownList ID="ddlCourses" runat="server" class="mdl-textfield__input" DataTextField="Semester:">
                                <asp:ListItem Value="Course:"></asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <div class="mdl-textfield mdl-js-textfield">
                            <asp:DropDownList ID="ddlTeacher" runat="server" class="mdl-textfield__input" DataTextField="Semester:">
                                <asp:ListItem Value="Teacher:"></asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <div style="text-align: right">
                            <!-- Colored FAB button with ripple -->
                            <asp:LinkButton ID="btnAddSection" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored" Style="right: 13px; bottom: -3px" runat="server">
          <i class="material-icons">add</i>
                            </asp:LinkButton>
                        </div>

                    </div>
                </div>
            </div>



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

                <div class="demo-card-wide mdl-cardAddTeacher mdl-shadow--3dp demo-card-square mdl-card">
                    <div class="mdl-card__supporting-text" style="text-align: center">
                        <h1>Add a Teacher </h1>
                        <!-- Textfield with Floating Label for teacher First name -->
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <asp:TextBox ID="txtbxTeacherfirstName" class="mdl-textfield__input" type="text" runat="server" />
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
                            <asp:TextBox ID="txtbxTeacherPassword" class="mdl-textfield__input" type="text" runat="server" />
                            <label class="mdl-textfield__label" for="sample3">Password:</label>
                        </div>

                        <!-- Textfield with Floating Label for teacher confirm password -->
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <asp:TextBox ID="txtbxTeacherConfirmPassword" class="mdl-textfield__input" type="text" runat="server" />
                            <label class="mdl-textfield__label" for="sample3">Confirm Password:</label>
                        </div>
                    </div>

                    <div style="text-align: right">
                        <!-- Colored FAB button with ripple -->

                        <asp:LinkButton ID="btnAddTeacher" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored" Style="right: 13px; bottom: 13px" runat="server">
                            <i class="material-icons">add</i>
                        </asp:LinkButton>
                    </div>
                </div>

            </div>

            <!-- Card for adding a student -->

            <div class="mdl-cell mdl-cell--4-col">


                <div class="demo-card-wide mdl-cardAddStudent mdl-shadow--3dp demo-card-square mdl-card">
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
                            <asp:TextBox ID="txtbxStudentPassword" class="mdl-textfield__input" type="text" runat="server" />
                            <label class="mdl-textfield__label" for="sample3">Password:</label>
                        </div>

                        <!-- Textfield with Floating Label for student confirm password -->
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <asp:TextBox ID="txtbxStudentConfirmPassword" class="mdl-textfield__input" type="text" runat="server" />
                            <label class="mdl-textfield__label" for="sample3">Confirm Password:</label>
                        </div>
                    </div>


                    <div style="text-align: right">
                        <!-- Colored FAB button with ripple -->
                        <asp:LinkButton ID="btnAddStudent" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored" Style="right: 13px; bottom: 13px" runat="server">
          <i class="material-icons">add</i>
                        </asp:LinkButton>
                    </div>
                </div>
            </div>






        </div>
    </main>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="adminPageSpecificJS" runat="server">
</asp:Content>
