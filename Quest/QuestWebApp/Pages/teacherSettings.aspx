<%@ Page Title="Teacher | Settings" Language="C#" MasterPageFile="~/Master-Pages/teacher.master" AutoEventWireup="true" CodeBehind="teacherSettings.aspx.cs" Inherits="QuestWebApp.Pages.teacherSettings" StylesheetTheme="validationSkin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="teacherBreadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="teacherHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="teacherExtraReferances" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="teacherWithSidebarSidebar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="teacherWithSidebarBodyContent" runat="server">

        <!-- Card for changing password a user -->

    <div class="demo-card-wide mdl-shadow--3dp mdl-card" style="width: 41%; left: 30%;">
        <div class="mdl-card__supporting-text" style="text-align: center">
            <br />

            <div style="font-size: 200%">Update User Password</div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <label id="Label1" class="mdl-textfield__label" style="bottom: 0px" runat="server" for="txtbxTeacherPassword">Old Password:</label>
                <asp:TextBox ID="txtOldPassword" CssClass="mdl-textfield__input" runat="server" TextMode="password" />
            </div>
            <div>
                <asp:RequiredFieldValidator SkinID="validatorSkin" runat="server" ID="RequiredFieldValidator2" ControlToValidate="txtOldPassword" ErrorMessage="Please enter password"  SetFocusOnError="True" ValidationGroup="grpUpdatePass" ForeColor="Red"></asp:RequiredFieldValidator></div>


            <!-- Textfield with Floating Label for teacher password -->
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <label id="lblPassword" class="mdl-textfield__label" style="bottom: 0px" runat="server" for="txtbxTeacherPassword">New Password:</label>
                <asp:TextBox ID="txtbxTeacherPassword" CssClass="mdl-textfield__input" TextMode="password" runat="server" />
                </div>
            <div>
                <!-- fix the regex for the password -->
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" SkinID="validatorRegexSkin" runat="server" ControlToValidate="txtbxTeacherPassword" ErrorMessage="Weak password" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,15}$" ForeColor="Red"></asp:RegularExpressionValidator>
<br />
                <asp:RequiredFieldValidator SkinID="validatorSkin" runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtbxTeacherPassword" ErrorMessage="Please enter password"  SetFocusOnError="True" ValidationGroup="grpUpdatePass" ForeColor="Red"></asp:RequiredFieldValidator>
<br />
<div id="helpIconPass" class="icon material-icons" style="margin-left: -5%;" tabindex="-5">help</div>
                <div class="mdl-tooltip" for="helpIconPass">
                    Password SHOULD be 8-15 characters long,<br>
                    contain at least 1 number,
                    <br />
                    1 upper-case letter,
                    <br />
                    and 1 lower-case letter
                </div>

                

            </div>

            <!-- Textfield with Floating Label for teacher confirm password -->
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <label class="mdl-textfield__label" style="bottom: 0px" for="sample3">Confirm New Password:</label>
                <asp:TextBox ID="txtbxTeacherConfirmPassword" CssClass="mdl-textfield__input" TextMode="password" runat="server" />
            </div>
            <div>
                <asp:CompareValidator ID="valConfirmPassMatch" runat="server" style="left:38%" ErrorMessage="Passwords must match" ControlToValidate="txtbxTeacherConfirmPassword" ControlToCompare="txtbxTeacherPassword" SetFocusOnError="true" ValidationGroup="grpUpdatePass" Display="Dynamic" CssClass="mdl-textfield__error" ForeColor="Red"></asp:CompareValidator>
                <br />
                <asp:RequiredFieldValidator SkinID="validatorSkin" runat="server" ID="valCinfirmPassReq" ControlToValidate="txtbxTeacherConfirmPassword" ErrorMessage="Please confirm password" SetFocusOnError="True" ValidationGroup="grpUpdatePass" ForeColor="Red"></asp:RequiredFieldValidator></div>
            <br />
            <br />

             <asp:LinkButton CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" ForeColor="White" ID="updatePassword" runat="server" OnClick="clickUpdatePassword" ValidationGroup="grpUpdatePass">
                            Update
                </asp:LinkButton>
        </div>
    </div>
    <br />

    <div class="demo-card-wide mdl-shadow--3dp mdl-card" style="width: 41%; left: 30%;" id="cdEnable" runat="server">
        <div class="mdl-card__supporting-text" style="text-align: center">
            <br />

            <div style="font-size: 200%">Enable E-mail Feature</div>
            <br />
            <div>Would you like to enable the e-mail feature?</div>
            <br />
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <asp:TextBox ID="tbemail" class="mdl-textfield__input" type="text" runat="server" />
                <label class="mdl-textfield__label" style="bottom: 0px" for="sample3">E-mail:</label>
            </div>
            <div>
                <asp:RequiredFieldValidator SkinID="validatorSkin" runat="server" ID="valEnableEmail" ControlToValidate="tbemail" ErrorMessage="Please enter email address"  SetFocusOnError="True" ValidationGroup="grpEnableEmail" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <asp:TextBox ID="tbpassword" class="mdl-textfield__input" type="password" runat="server" />
                <label class="mdl-textfield__label" style="bottom: 0px" for="sample3">Password:</label>
            </div>
            <div>
                <asp:RequiredFieldValidator SkinID="validatorSkin" runat="server" ID="valEnableEmailPassword" ControlToValidate="tbpassword" ErrorMessage="Please enter email password"  SetFocusOnError="True" ValidationGroup="grpEnableEmail" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <asp:TextBox ID="tbStudentLogin" class="mdl-textfield__input" type="text" runat="server" />
                <label class="mdl-textfield__label" style="bottom: 0px" for="sample3">Student ID:</label> 
            </div>
           <div><asp:RequiredFieldValidator SkinID="validatorSkin" runat="server" ID="valEnableEmailID" ControlToValidate="tbStudentLogin" ErrorMessage="Please enter Student ID"  SetFocusOnError="True" ValidationGroup="grpEnableEmail" ForeColor="Red"></asp:RequiredFieldValidator>
</div> 
            <br />
            <asp:LinkButton CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" ForeColor="White" runat="server" OnClick="btnEnable_Click" ValidationGroup="grpEnableEmail">
                            Enable
            </asp:LinkButton>
        </div>
    </div>
    <br />
    <div class="demo-card-wide mdl-shadow--3dp mdl-card" style="width: 41%; left: 30%;" id="cdDisable" runat="server">
        <div class="mdl-card__supporting-text" style="text-align: center">
            <br />

            <div style="font-size: 200%">Disable E-mail Feature</div>
            <br />
            <div>Would you like to disable the e-mail feature?</div>
            <br />
            <br />
            <br />
            
            </div>
        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="bottom: 30px; left: 41%;">
                <asp:LinkButton CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" ForeColor="White" ID="btnDisable" runat="server" OnClick="btnDisable_Click">
                            Disable
                </asp:LinkButton>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="teacherPageSpecificJS" runat="server">
</asp:Content>