<%@ Page Title="Settings" Language="C#" MasterPageFile="~/Master-Pages/withSidebar.master" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="QuestWebApp.Pages.Settings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="breadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="extraReferances" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="withSidebarSidebar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="withSidebarBodyContent" runat="server">

    <!-- Card for changing password a user -->

    <div class="demo-card-wide mdl-shadow--3dp mdl-card" style="width: 41%; left: 30%;">
        <div class="mdl-card__supporting-text" style="text-align: center">
                        <br />

                        <div style="font-size:200%">Change User Password</div>
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" >
                            <label id="Label1" class="mdl-textfield__label" style="bottom: 0px" runat="server" for="txtbxTeacherPassword">Old Password:</label>
                            <asp:TextBox ID="TextBox1"  class="mdl-textfield__input" type="password" runat="server"/>
                            </div>
                                
                               
                       <!-- Textfield with Floating Label for teacher password -->
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" >
                            <label id="lblPassword" class="mdl-textfield__label" style="bottom: 0px" runat="server" for="txtbxTeacherPassword">New Password:</label>
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
                            <label class="mdl-textfield__label" style="bottom: 0px" for="sample3">Confirm New Password:</label>
                            <asp:TextBox ID="txtbxTeacherConfirmPassword" class="mdl-textfield__input" type="password" runat="server" />
                            <asp:CompareValidator ID="valConfirmPassMatch" runat="server" ErrorMessage="Passwords must match" ControlToValidate="txtbxTeacherConfirmPassword" ControlToCompare="txtbxTeacherPassword" SetFocusOnError="true" ValidationGroup="grpAddUser" Display="Dynamic" CssClass="mdl-textfield__error"></asp:CompareValidator>
                            <asp:RequiredFieldValidator SkinID="validatorSkin" runat="server" ID="valCinfirmPassReq" ControlToValidate="txtbxTeacherConfirmPassword" ErrorMessage="Please confirm password"  SetFocusOnError="True" ValidationGroup="grpAddUser"></asp:RequiredFieldValidator>
                        </div>
    </div>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="pageSpecificJS" runat="server">
</asp:Content>
