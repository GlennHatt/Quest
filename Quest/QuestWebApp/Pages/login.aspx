<%@ Page Title="Quest Log In" Language="C#" MasterPageFile="~/Master-Pages/login.master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="QuestWebApp.Pages.loginTest" %>

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
        <h1 style="font-family: 'Quicksand',sans-serif; text-align:center; font-weight: bold; font-size:600%" >Quest Testing Center!
            <br />
        </h1>
    </div>
    <div class="materialContainer">
        <div class="box" style="padding: 60px 40px 4px 50px;">
            <div class="title">LOGIN</div>

            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <label class="mdl-textfield__label" style="bottom:0px;" for="sample3">E-mail</label>
                <asp:TextBox ID="username" runat="server" class="mdl-textfield__input"></asp:TextBox>
            </div>

            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <label class="mdl-textfield__label" style="bottom:0px;" for="sample3">Password</label>
                <asp:TextBox ID="password" runat="server" class="mdl-textfield__input" TextMode="Password"></asp:TextBox>
            </div>

            <div class="button login" style="text-align: center;">
                <asp:Button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" ID="loginButton" runat="server" Text="Login" style="color:white" OnClick="loginButton_Click" />
                <br />
                <div style="text-align: center; font-size:13px;">
                    <asp:Label ID="answer" runat="server" Text="" Style="text-align: center;"></asp:Label></div>
            </div>
            <div style="text-align: right; margin-top: 104px; font-size: 13px;">Forget Your Password?</div>
        </div>
    </div>
    <div style="position: absolute; bottom: 38px; width: 320px; right: 0px; color: white; font-size: 34px; font-family: 'Quicksand', sans-serif; font-weight: bold">
        Product of RPG
        <img src="../Assets/Images/transparent.png" height="50" width="50" />
    </div>
    <div class="buttonDiscover" style= "position: absolute; bottom: 0px; width: 162px; right: 83px;">
        <asp:Button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" style="color:white" ID="Discover" runat="server" Text="Discover More" OnClick="discoverButton_Click" />
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="loginPageSpecificJS" runat="server">
    <script src="../Assets/JS/loginJS.js"></script>

</asp:Content>
