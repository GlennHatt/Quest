﻿<%@ Page Title="Admin | Settings" Language="C#" MasterPageFile="~/Master-Pages/admin.master" AutoEventWireup="true" CodeBehind="adminSettings.aspx.cs" Inherits="QuestWebApp.Pages.adminSettings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="adminBreadcrumbs" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="adminHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="adminExtraReferances" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="adminWithSidebarSidebar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="adminWithSidebarBodyContent" runat="server">
        <!-- Card for changing password a user -->

    <div class="demo-card-wide mdl-shadow--3dp mdl-card" style="width: 41%; left: 30%;">
        <div class="mdl-card__supporting-text" style="text-align: center">
            <br />

            <div style="font-size: 200%">Change User Password</div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <label id="Label1" class="mdl-textfield__label" style="bottom: 0px" runat="server" for="txtbxTeacherPassword">Old Password:</label>
                <asp:TextBox ID="TextBox1" class="mdl-textfield__input" type="password" runat="server" />
            </div>


            <!-- Textfield with Floating Label for teacher password-->
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <label id="lblPassword" class="mdl-textfield__label" style="bottom: 0px" runat="server" for="txtbxTeacherPassword">New Password:</label>
                <asp:TextBox ID="txtbxTeacherPassword" class="mdl-textfield__input" type="password" runat="server" />
                <!-- Multiline Tooltip -->
                <div id="helpIconPass" class="icon material-icons" style="margin-left: -5%;" tabindex="-5">help</div>
                <div class="mdl-tooltip" for="helpIconPass">
                    Password must be 8-15 characters long,<br>
                    contain at least 1 number,
                    <br />
                    1 upper-case letter,
                    <br />
                    and 1 lower-case letter
                </div>



                <!-- fix the regex for the password -->
                <asp:RegularExpressionValidator ID="valUserPass" SkinID="validatorRegexSkin" runat="server" ControlToValidate="txtbxTeacherPassword" ErrorMessage="Weak password" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,15}$"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator SkinID="validatorSkin" runat="server" ID="valUserPassReq" ControlToValidate="txtbxTeacherPassword" ErrorMessage="Please enter password" SetFocusOnError="True" ValidationGroup="grpAddUser"></asp:RequiredFieldValidator>


            </div>

            <!-- Textfield with Floating Label for teacher confirm password -->
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <label class="mdl-textfield__label" style="bottom: 0px" for="sample3">Confirm New Password:</label>
                <asp:TextBox ID="txtbxTeacherConfirmPassword" class="mdl-textfield__input" type="password" runat="server" />
                <asp:CompareValidator ID="valConfirmPassMatch" runat="server" ErrorMessage="Passwords must match" ControlToValidate="txtbxTeacherConfirmPassword" ControlToCompare="txtbxTeacherPassword" SetFocusOnError="true" ValidationGroup="grpAddUser" Display="Dynamic" CssClass="mdl-textfield__error"></asp:CompareValidator>
                <asp:RequiredFieldValidator SkinID="validatorSkin" runat="server" ID="valCinfirmPassReq" ControlToValidate="txtbxTeacherConfirmPassword" ErrorMessage="Please confirm password" SetFocusOnError="True" ValidationGroup="grpAddUser"></asp:RequiredFieldValidator>
            </div>
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
                <asp:RequiredFieldValidator SkinID="validatorSkin" runat="server" ID="valEnableEmail" ControlToValidate="tbemail" ErrorMessage="Please enter email address"  SetFocusOnError="True" ValidationGroup="grpEnableEmail"></asp:RequiredFieldValidator>

            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <asp:TextBox ID="tbpassword" class="mdl-textfield__input" type="text" runat="server" />
                <label class="mdl-textfield__label" style="bottom: 0px" for="sample3">Password:</label>
                <asp:RequiredFieldValidator SkinID="validatorSkin" runat="server" ID="valEnableEmailPassword" ControlToValidate="tbpassword" ErrorMessage="Please enter email password"  SetFocusOnError="True" ValidationGroup="grpEnableEmail"></asp:RequiredFieldValidator>

            </div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <asp:TextBox ID="tbStudentLogin" class="mdl-textfield__input" type="text" runat="server" />
                <label class="mdl-textfield__label" style="bottom: 0px" for="sample3">Student ID:</label>
                <asp:RequiredFieldValidator SkinID="validatorSkin" runat="server" ID="valEnableEmailID" ControlToValidate="tbStudentLogin" ErrorMessage="Please enter student ID"  SetFocusOnError="True" ValidationGroup="grpEnableEmail"></asp:RequiredFieldValidator>

            </div>
            <br />
            <asp:LinkButton ValidationGroup="grpEnableEmail" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" ID="btnEnable" runat="server" OnClick="btnEnable_Click">
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
                <asp:LinkButton CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" ID="btnDisable" runat="server" OnClick="btnDisable_Click">
                            Disable
                </asp:LinkButton>
        </div>
    </div>


</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="adminPageSpecificJS" runat="server">
</asp:Content>