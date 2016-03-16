<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="QuestWebApp.Pages.login" %>

<!DOCTYPE html>

    <script runat="server">
        void login_click()
        {

        }
    </script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Quest Login</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="unsernameText" runat="server"> Username: </asp:Label>
        <asp:TextBox ID="username" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="passwordText" runat="server"> Password: </asp:Label>
        <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
        <br />
        <asp:button ID="loginButton" runat="server" text="Login" OnClick="loginButton_Click" />
        <asp:Label ID="answer" runat="server" Text=""></asp:Label>
    </div>
    </form>
</body>
</html>
