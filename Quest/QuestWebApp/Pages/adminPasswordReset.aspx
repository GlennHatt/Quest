<%@ Page Title="Admin | Reset Password" Language="C#" MasterPageFile="~/Master-Pages/admin.master" AutoEventWireup="true" CodeBehind="adminPasswordReset.aspx.cs" Inherits="QuestWebApp.Pages.adminPasswordReset" %>
<asp:Content ID="Content1" ContentPlaceHolderID="adminBreadcrumbs" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="adminHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="adminExtraReferances" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="adminWithSidebarSidebar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="adminWithSidebarBodyContent" runat="server">

    <style>
        .center
        {
            text-align:center;
        }
    </style>

<div class="demo-card-wide mdl-shadow--3dp mdl-card" style="width: 70%; left: 17%">
        <div class="mdl-card__supporting-text" style="text-align: center">
            <div style="font-size:20pt">Reset Password</div>
            <br />
           <div style="font-size:17pt">Select a User</div>
            <!-- Textfield with Floating DropDown for Users -->
            <asp:RadioButtonList ID="rblTypeUser" CssClass="mdl-textfield_label center" runat="server" RepeatDirection="Horizontal" AutoPostBack="true">
                <asp:ListItem Text="Admin User" Value="A" />
                <asp:ListItem Text="Teacher User" Value="T" />
                <asp:ListItem Text="Student User" Value="S" />
            </asp:RadioButtonList>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="text-align: center;">
                <label style="padding-left: 1%;">Users:</label>
                <asp:DropDownList ID="ddlClassSelect" class="mdl-textfield__input" runat="server" OnSelectedIndexChanged="ddlClassSelect_SelectedIndexChanged1" AutoPostBack="true"> 
                    <asp:ListItem Text="cat"> </asp:ListItem>
                    <asp:ListItem Text="dog"> </asp:ListItem>

                </asp:DropDownList>
                </div> 
            </div>
    </div>

     <div class="demo-card-wide mdl-shadow--3dp mdl-card" id="cardUpdatePassword" runat="server" style="width: 70%; left: 17%">
        <div class="mdl-card__supporting-text" style="text-align: center">
            <br />

            <div style="font-size: 200%">Update User Password</div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <label id="Label1" class="mdl-textfield__label" style="bottom: 0px" runat="server" for="txtbxTeacherPassword">Old Password:</label>
                <asp:TextBox ID="TextBox1" class="mdl-textfield__input" type="password" runat="server" />
            </div>


            <!-- Textfield with Floating Label for teacher password -->
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
            <br />
            <br />

             <asp:LinkButton CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" ID="updatePassword" runat="server" ForeColor="White">
                            Update
                </asp:LinkButton>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="adminPageSpecificJS" runat="server">
</asp:Content>
