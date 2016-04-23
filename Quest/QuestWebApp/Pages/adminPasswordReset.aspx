<%@ Page Title="Admin | Reset Password" Language="C#" MasterPageFile="~/Master-Pages/admin.master" AutoEventWireup="true" CodeBehind="adminPasswordReset.aspx.cs" Inherits="QuestWebApp.Pages.adminPasswordReset" StylesheetTheme="validationSkin" %>
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
                <asp:DropDownList ID="ddlClassSelect" CssClass="mdl-textfield__input" runat="server" OnSelectedIndexChanged="ddlClassSelect_SelectedIndexChanged1" AutoPostBack="True" DataSourceID="sqlUsers" DataTextField="FULL_NAME" DataValueField="USER_ID"> 
                </asp:DropDownList>
                <asp:SqlDataSource ID="sqlUsers" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
SELECT null as l_name, '- Please Select a User -' AS full_name, null AS user_id
  FROM dual
UNION
SELECT l_name, F_NAME || ' ' || L_NAME as FULL_NAME, user_id
  FROM end_user
 WHERE permission_level = :permission
       ORDER BY l_name NULLs first" UpdateCommand="BEGIN
  end_users.changePassword
           (p_EndUserID =&gt; :p_EndUserID, 
             p_Password  =&gt; :p_Password);
END;">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="rblTypeUser" Name="permission" PropertyName="SelectedValue" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="p_EndUserID" />
                        <asp:Parameter Name="p_Password" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                </div> 
            </div>
    </div>

     <div class="demo-card-wide mdl-shadow--3dp mdl-card" id="cardUpdatePassword" runat="server" style="width: 70%; left: 17%">
        <div class="mdl-card__supporting-text" style="text-align: center">
            <br />

            <!-- Textfield with Floating Label for teacher password -->
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <label id="lblPassword" class="mdl-textfield__label" style="bottom: 0px" runat="server" for="txtbxTeacherPassword">New Password:</label>
                <asp:TextBox ID="txtbxTeacherPassword" CssClass="mdl-textfield__input" TextMode="password" runat="server" />
            </div>
                <!-- fix the regex for the password -->
            <div>
                <asp:RequiredFieldValidator SkinID="validatorSkin" runat="server" ID="valUserPassReq" ControlToValidate="txtbxTeacherPassword" ErrorMessage="Please enter password" SetFocusOnError="True" ValidationGroup="grpAddUser"></asp:RequiredFieldValidator>
</div>

            

            <!-- Textfield with Floating Label for teacher confirm password -->
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <label class="mdl-textfield__label" style="bottom: 0px" for="sample3">Confirm New Password:</label>
                <asp:TextBox ID="txtbxTeacherConfirmPassword" CssClass="mdl-textfield__input" TextMode="password" runat="server" />
            </div>
            <br />
            <div style="text-align:center">
            <asp:CompareValidator ID="valConfirmPassMatch" style="left:41%" runat="server" ErrorMessage="Passwords must match" ControlToValidate="txtbxTeacherConfirmPassword" ControlToCompare="txtbxTeacherPassword" SetFocusOnError="true" ValidationGroup="grpAddUser" Display="Dynamic" CssClass="mdl-textfield__error"></asp:CompareValidator>
             </div>
            <br />
            <div><asp:RequiredFieldValidator SkinID="validatorSkin" runat="server" ID="valConfirmPassReq" ControlToValidate="txtbxTeacherConfirmPassword" ErrorMessage="Please confirm password" SetFocusOnError="True" ValidationGroup="grpAddUser"></asp:RequiredFieldValidator>
           </div>

             <asp:LinkButton CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" ID="updatePassword" runat="server" ForeColor="White" OnClick="updatePassword_Click" ValidationGroup="grpAddUser">
                            Update
                </asp:LinkButton>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="adminPageSpecificJS" runat="server">
</asp:Content>
