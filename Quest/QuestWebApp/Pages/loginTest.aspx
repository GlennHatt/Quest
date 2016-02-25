<%@ Page Title="Quest Log In" Language="C#" MasterPageFile="~/Master-Pages/login.master" AutoEventWireup="true" CodeBehind="loginTest.aspx.cs" Inherits="QuestWebApp.Pages.loginTest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="loginBreadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="loginHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="loginExtraReferances" runat="server">

    <link href="../Assets/Styles/loginStyles.css" rel="stylesheet" />
    <link href='https://fonts.googleapis.com/css?family=Quicksand:400,700' rel='stylesheet' type='text/css'>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="loginBodyContent" runat="server">
    <div style="text-align: center; color: white">
        <h1 style="font-family: 'Quicksand', sans-serif; font-weight:bold">Quest Testing Center!
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

            <div class="button login" style="text-align: center;">
                <asp:Button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" ID="loginButton" runat="server" Text="Login" OnClick="loginButton_Click" />
                <asp:Label ID="answer" runat="server" Text=""></asp:Label>
                <br />
                <a href="http://localhost:52416/Pages/AboutUsPage.aspx"> <i class="material-icons testAlert" style="margin-right:4px; font-size: 35px";>info</i> </a>
            </div>
                 <div style="text-align: right; margin-top: 104px;"> Forget Your Password?</div>
        </div>
    </div>
    <div style="text-align: right; color: white; margin-top: 590px; font-size: 34px; font-family: 'Quicksand', sans-serif; font-weight:bold">
        Product of RPG
        <img src="../Assets/Images/transparent.png" height="50" width="50" />
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="loginPageSpecificJS" runat="server">
    <script src="../Assets/JS/loginJS.js"></script>

</asp:Content>
