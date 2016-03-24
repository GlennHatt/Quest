<%@ Page Title="" Language="C#"  MasterPageFile="~/Master-Pages/admin.master" AutoEventWireup="true" CodeBehind="adminDashboard.aspx.cs" Inherits="QuestWebApp.Pages.adminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="adminBreadcrumbs" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="adminHead" runat="server">
    <title>Admin | Home</title>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="adminExtraReferances" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="adminWithSidebarSidebar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="adminWithSidebarBodyContent" runat="server" >
    <script>


    </script>
    <asp:SqlDataSource ID="sqlTeacher" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" InsertCommand="
DECLARE
  v_dummy pls_integer;
BEGIN
 v_dummy := END_USERS.add(
    p_Email           =&gt; :p_Email,
    p_Password        =&gt; :p_Password,
    p_FName           =&gt; :p_FName,
    p_LName           =&gt; :p_LName,
    p_PermissionLevel =&gt; :p_PermissionLevel);
END;"
        ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="SELECT * FROM END_USER">
        <InsertParameters>
            <asp:ControlParameter ControlID="txtbxTeacherEmail" Name="p_Email" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtbxTeacherConfirmPassword" Name="p_Password" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtbxTeacherFirstName" Name="p_FName" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtbxTeacherLastName" Name="p_LName" PropertyName="Text" />
            <asp:ControlParameter ControlID="ddlUserSelect" Name="p_PermissionLevel" PropertyName="SelectedValue" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlClass" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" InsertCommand="
DECLARE
   v_dummy pls_integer;
BEGIN
   v_dummy := classes.add(
      p_Code   =&gt; :p_Code,
      p_Title  =&gt; :p_Title);
END;"
        ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="SELECT CLASS_ID FROM CLASS">
        <InsertParameters>
            <asp:Parameter />
            <asp:ControlParameter ControlID="txtbxCourseNumber" Name="p_Code" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtbxClassTitle" Name="p_Title" PropertyName="Text" />
        </InsertParameters>
    </asp:SqlDataSource> 
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>

    

    <main class="mdl-layout__content">
        <div class="content-grid mdl-grid">
            <div id="cardUser" class="mdl-cell mdl-cell--4-col">
                <!-- Card for adding a user -->

                <asp:Label ID="lblWarning" runat="server" Text="" ForeColor="Red"></asp:Label>
                <div class="demo-card-wide mdl-card-addClass mdl-shadow--3dp demo-card-square mdl-card">
                    <div class="mdl-card__supporting-text" style="text-align: center">
                        Card Size:<br />

                        <!-- Hidden links for navigating to cards -->
                        <a id="cardUserLink" href="#cardUser" style="display:none;"></a>
                        <a id="cardNewClassLink" href="#cardNewClass" style="display:none;"></a>
                        <a id="cardNewSectionLink" href="#cardNewSection" style="display:none;"></a>

                        <button style="background-color: #FF6E40;" ID="btnResizeUserSm" disabled="disabled" onclick="changeUserCardSize('cardUser', 'btnResizeUserSm', 'btnResizeUserLrg'); return false" Class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--colored">Small</button>
                        <button style="background-color: #FF6E40;" ID="btnResizeUserLrg"  onclick="changeUserCardSize('cardUser', 'btnResizeUserSm', 'btnResizeUserLrg'); return false" Class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--colored">Large</button>
                        <h1>Add New User</h1>
                        <!-- Textfield with Floating Label for teacher First name-->
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <asp:TextBox ID="txtbxTeacherFirstName" class="mdl-textfield__input" type="text" runat="server" />
                            <asp:RequiredFieldValidator SkinID="validatorSkin" runat="server" ID="valUserFname" ControlToValidate="txtbxTeacherFirstName" ErrorMessage="Please enter first name"  SetFocusOnError="True" ValidationGroup="grpAddUser"></asp:RequiredFieldValidator>
                            <label class="mdl-textfield__label" style="bottom: 0px" for="sample3">First Name:</label>
                            
                        </div>
                                
                               
                        <!-- Textfield with Floating Label for teacher Last name -->
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <label class="mdl-textfield__label" style="bottom: 0px" for="sample3">Last Name:</label>
                            <asp:TextBox ID="txtbxTeacherLastName" class="mdl-textfield__input" type="text" runat="server" />
                            <asp:RequiredFieldValidator SkinID="validatorSkin" runat="server" ID="valUserLname" ControlToValidate="txtbxTeacherLastName" ErrorMessage="Please enter last name"  SetFocusOnError="True" ValidationGroup="grpAddUser"></asp:RequiredFieldValidator>
                            
                        </div>

                        <!-- Textfield with Floating Label for teacher Email -->
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <label class="mdl-textfield__label" style="bottom: 0px" for="sample3">Email Address:</label>
                            <asp:TextBox ID="txtbxTeacherEmail" class="mdl-textfield__input" type="text" runat="server" TextMode="Email" />
                            <asp:RegularExpressionValidator ID="valUserEmail" SkinID="validatorRegexSkin" runat="server" ControlToValidate="txtbxTeacherEmail" ErrorMessage="Invalid email" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator SkinID="validatorSkin" runat="server" ID="valUserEmailReq" ControlToValidate="txtbxTeacherEmail" ErrorMessage="Please enter email"  SetFocusOnError="True" ValidationGroup="grpAddUser"></asp:RequiredFieldValidator>
                            
                        </div>

                        <!-- Textfield with Floating Label for teacher password -->
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" >
                            <label id="lblPassword" class="mdl-textfield__label" style="bottom: 0px" runat="server" for="txtbxTeacherPassword">Password:</label>
                            <asp:TextBox ID="txtbxTeacherPassword"  class="mdl-textfield__input" type="password" runat="server"/>
                                                            <!-- Multiline Tooltip -->
 <div id="helpIconPass" class="icon material-icons" style="margin-left: -5%;" tabindex="-5">help</div>
<div class="mdl-tooltip" for="helpIconPass">
Password must be 8-15 characters long,<br>contain at least 1 number, <br />1 upper-case letter, <br /> and 1 lower-case letter
                        </div>


                        
                            <!-- fix the regex for the password -->
                            <asp:RegularExpressionValidator ID="valUserPass" SkinID="validatorRegexSkin" runat="server" ControlToValidate="txtbxTeacherPassword" ErrorMessage="Weak password" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,15}$"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator SkinID="validatorSkin" runat="server" ID="valUserPassReq" ControlToValidate="txtbxTeacherPassword" ErrorMessage="Please enter password"  SetFocusOnError="True" ValidationGroup="grpAddUser"></asp:RequiredFieldValidator>

                            
                        </div>
                                                                                
                        <!-- Textfield with Floating Label for teacher confirm password -->
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <label class="mdl-textfield__label" style="bottom: 0px" for="sample3">Confirm Password:</label>
                            <asp:TextBox ID="txtbxTeacherConfirmPassword" class="mdl-textfield__input" type="password" runat="server" />
                            <asp:CompareValidator ID="valConfirmPassMatch" runat="server" ErrorMessage="Passwords must match" ControlToValidate="txtbxTeacherConfirmPassword" ControlToCompare="txtbxTeacherPassword" SetFocusOnError="true" ValidationGroup="grpAddUser" Display="Dynamic" CssClass="mdl-textfield__error"></asp:CompareValidator>
                            <asp:RequiredFieldValidator SkinID="validatorSkin" runat="server" ID="valCinfirmPassReq" ControlToValidate="txtbxTeacherConfirmPassword" ErrorMessage="Please confirm password"  SetFocusOnError="True" ValidationGroup="grpAddUser"></asp:RequiredFieldValidator>
                        </div>

                        <!-- Textfield with Floating DropDown for user type -->
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="text-align:left;">
                            <Label style="padding-left:1%; " >User Type:</Label>
                            <asp:DropDownList ID="ddlUserSelect" class="mdl-textfield__input" runat="server" AppendDataBoundItems="true">
                                <asp:ListItem Value="S">Student</asp:ListItem>
                                <asp:ListItem Value="T">Teacher</asp:ListItem>
                                <asp:ListItem Value="A">Administrator</asp:ListItem>
                            </asp:DropDownList>
                            
                        </div>

                    </div>
                    <div style="text-align: right">
                        <!-- Colored FAB button with ripple -->
                        <asp:LinkButton ID="btnAddTeacher"  class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored" Style="right: 13px; bottom: 13px" runat="server" OnClick="btnAddTeacher_Click">
                            <i class="material-icons">add</i>
                        </asp:LinkButton>
                    </div>
                </div>


            </div>


            <!-- Card for adding a class -->
            <div id="cardNewClass" class="mdl-cell mdl-cell--4-col">
                <div class="demo-card-wide mdl-card-addClass mdl-shadow--3dp demo-card-square mdl-card">
                    <div class="mdl-card__supporting-text" style="text-align: center">
                        Card Size:<br />
                        <button style="background-color: #FF6E40;" ID="btnResizeClassSm" disabled="disabled" onclick="changeUserCardSize('cardNewClass', 'btnResizeClassSm', 'btnResizeClassLrg'); return false" Class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--colored">Small</button>
                        <button style="background-color: #FF6E40;" ID="btnResizeClassLrg"  onclick="changeUserCardSize('cardNewClass', 'btnResizeClassSm', 'btnResizeClassLrg'); return false" Class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--colored">Large</button>
                        <h1>Add a Class </h1>
                        <!-- Textfield with Floating Label for Title -->
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <asp:TextBox ID="txtbxClassTitle" class="mdl-textfield__input" type="text" runat="server" />
                            <label class="mdl-textfield__label" style="bottom: 0px" for="sample3">Title:</label>
                            <asp:RequiredFieldValidator SkinID="validatorSkin" runat="server" ID="valClassTitle" ControlToValidate="txtbxClassTitle" ErrorMessage="Please enter class name"  SetFocusOnError="True" ValidationGroup="grpAddClass"></asp:RequiredFieldValidator>
                           <%-- <span id="lblClasstitleError" runat="server" class="mdl-textfield__error">Enter class title</span>--%>
                        </div>

                        <!-- Textfield with Floating Label for Course Number -->
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <asp:TextBox ID="txtbxCourseNumber" class="mdl-textfield__input" type="text" runat="server" />
                            <label class="mdl-textfield__label" style="bottom: 0px" for="sample3">Course Number:</label>
                            <asp:RequiredFieldValidator SkinID="validatorSkin" runat="server" ID="valCourseNumber" ControlToValidate="txtbxCourseNumber" ErrorMessage="Please enter course number"  SetFocusOnError="True" ValidationGroup="grpAddClass"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="valCourseNumRegex" SkinID="validatorRegexSkin" runat="server" ControlToValidate="txtbxCourseNumber" ErrorMessage="Invalid course number" ValidationExpression="[A-Z]{2} [1-9]{3}"></asp:RegularExpressionValidator>
                            <%--<span id="lblClassNumError" runat="server" class="mdl-textfield__error">Enter Course Number</span>--%>
                        </div>

                        <div style="text-align: right">
                            <!-- Colored FAB button with ripple -->
                            <asp:LinkButton ID="btnAddClass" ValidationGroup="grpAddClass" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored" Style="bottom: -7px" runat="server" OnClick="btnAddClass_Click">
                                <i id="myTest" class="material-icons">add</i>
                            </asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Card for adding a section to a course -->
            <div id="cardNewSection" class="mdl-cell mdl-cell--4-col">

                <div class="demo-card-wide mdl-card-addClass mdl-shadow--3dp demo-card-square mdl-card" style="padding-bottom:1%">


                    <div class="mdl-card__supporting-text" style="text-align: center">
                        Card Size: <br >
                        <button style="background-color: #FF6E40;" ID="btnResizeSectionSm" disabled="disabled" onclick="changeUserCardSize('cardNewSection', 'btnResizeSectionSm', 'btnResizeSectionLrg'); return false" Class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--colored">Small</button>
                        <button style="background-color: #FF6E40;" ID="btnResizeSectionLrg"  onclick="changeUserCardSize('cardNewSection', 'btnResizeSectionSm', 'btnResizeSectionLrg'); return false" Class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--colored">Large</button>
                        <h1>Add a Section </h1>
                        <div class="mdl-textfield mdl-js-textfield" style="text-align:left;">
                            <Label style="padding-left:1%; " >Semester:</Label>
                            <asp:DropDownList ID="ddlSemester" runat="server" class="mdl-textfield__input" DataTextField="Semester:">
                            </asp:DropDownList>
                            <%-- <span id="lblSemesterError" runat="server" class="mdl-textfield__error">Select a semester</span>--%>
                        </div>

                        <div class="mdl-textfield mdl-js-textfield" style="text-align:left;">
                            <Label style="padding-left:1%; " >Section:</Label>
                            <asp:DropDownList ID="ddlSection" runat="server" class="mdl-textfield__input" DataTextField="Semester:">
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

                        <div class="mdl-textfield mdl-js-textfield" style="text-align:left;">
                            <Label style="padding-left:1%; " >Course:</Label>
                            <asp:DropDownList ID="ddlCourses" runat="server" class="mdl-textfield__input" DataTextField="CLASS_ID" DataSourceID="sqlClass" DataValueField="CLASS_ID">
                                <asp:ListItem Value="Course:"></asp:ListItem>
                            </asp:DropDownList>
                            <%--<span id="lblAddSectionCourseError" runat="server" class="mdl-textfield__error">Select a course</span>--%>
                        </div>

                        <div class="mdl-textfield mdl-js-textfield" style="text-align:left;">
                            <Label style="padding-left:1%; " >Teacher:</Label>
                            <asp:DropDownList ID="ddlTeacher" runat="server" class="mdl-textfield__input" DataTextField="USER_ID" DataSourceID="sqlTeacherSelect" DataValueField="USER_ID">
                                <asp:ListItem Value="Teacher:"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sqlTeacherSelect" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
select user_id
from   end_user
where  permission_level = 'T'"
                            ></asp:SqlDataSource>
                            <%--<span id="lblTeacherError" runat="server" class="mdl-textfield__error">Select a teacher</span>--%>
                        </div>

                        <div style="text-align: right">
                            <!-- Colored FAB button with ripple -->
                            <asp:LinkButton ID="btnAddSection" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored" Style="bottom: -15px" runat="server" OnClick="btnAddSection_Click">
           <i class="material-icons">add</i>
                            </asp:LinkButton>
                        </div>

                    </div>
                </div>
            </div>



        </div>

    </main>
    <asp:ScriptManager ID="jquery" runat="server"></asp:ScriptManager>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="adminPageSpecificJS" runat="server">
    <script src="../Assets/JS/loginJS.js"></script>
</asp:Content>
