<%@ Page Title="Quest Log In" Language="C#" MasterPageFile="~/Master-Pages/login.master" AutoEventWireup="true" CodeBehind="loginTest.aspx.cs" Inherits="QuestWebApp.Pages.loginTest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="loginBreadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="loginHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="loginExtraReferances" runat="server">

    <link href="../Assets/Styles/loginStyles.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="loginBodyContent" runat="server">
    <div style="text-align: center; color: white">
        <h1>Ready, Set, Quest
            <br />
        </h1>
    </div>
    <div class="materialContainer">
        <div class="box">

            <div class="title">LOGIN</div>

            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <label class="mdl-textfield__label" for="sample3">E-mail</label>
                <asp:TextBox ID="username" runat="server" class="mdl-textfield__input"></asp:TextBox>
            </div>

            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <label class="mdl-textfield__label" for="sample3">Password</label>
                <asp:TextBox ID="password" runat="server" class="mdl-textfield__input" TextMode="Password"></asp:TextBox>

            </div>

            <div class="button login" style="text-align: center">
                <asp:Button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" ID="loginButton" runat="server" Text="Login" OnClick="loginButton_Click" />
                <asp:Label ID="answer" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </div>
    <div style="margin:500px; margin-left: 1300px; font-size:12ex; color: white">
    Product of RPG 
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="loginPageSpecificJS" runat="server">
    <script src="../Assets/JS/loginJS.js"></script>

</asp:Content>
