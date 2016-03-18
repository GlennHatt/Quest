<%@ Page Title="Admin | Users" Language="C#" MasterPageFile="~/Master-Pages/admin.master" AutoEventWireup="true" CodeBehind="adminUser.aspx.cs" Inherits="QuestWebApp.Pages.AdminUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="adminBreadcrumbs" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="adminHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="adminExtraReferances" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="adminWithSidebarSidebar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="adminWithSidebarBodyContent" runat="server">
    <%--<div class="mdl-card mdl-shadow--3dp demo-card-wide " style="width: 850px;">--%>
<%--<asp:GridView CssClass="mdl-data-table mdl-js-data-table mdl-data-table mdl-shadow--2dp customTable2" ID="GVUser" runat="server" AutoGenerateColumns="False" DataSourceID="sqlAdminUsers">
        <Columns>
            <asp:BoundField DataField="EMAIL" HeaderText="E-Mail" SortExpression="EMAIL" />
            <asp:BoundField DataField="FIRSTNAME" HeaderText="First Name" SortExpression="FIRSTNAME" />
            <asp:BoundField DataField="LASTNAME" HeaderText="Last Name" SortExpression="LASTNAME" />
            <asp:BoundField DataField="PASSWORD" HeaderText="Password" SortExpression="PASSWORD" />
            <asp:BoundField DataField="CLASSIFICATION" HeaderText="Classification" SortExpression="CLASSIFICATION" />
            <asp:TemplateField HeaderText="Active">
            <ItemTemplate>
                <asp:LinkButton class="mdl-button mdl-js-button mdl-button--raised" ID="activeButton" runat="server" Text="Active" BackColor="Green"></asp:LinkButton> 
            </ItemTemplate>
        </asp:TemplateField>
        </Columns>
    </asp:GridView>--%>--%>

<!DOCTYPE html>
<html >
  <head>
    <meta charset="UTF-8">
    <title>Material Design - Responsive Table</title>
    <script src="http://s.codepen.io/assets/libs/modernizr.js" type="text/javascript"></script>

<link href="../Assets/Styles/ResponsiveTable.css" rel="stylesheet" />
    
    <link rel="stylesheet" href="css/normalize.css">

    
        <link rel="stylesheet" href="css/style.css">

  </head>

  <body>

    <div id="demo">
  <!-- Responsive table starts here -->
  <!-- For correct display on small screens you must add 'data-title' to each 'td' in your table -->
  <div class="table-responsive-vertical shadow-z-1">
  <!-- Table starts here -->
  <table id="table" class="table table-hover table-mc-light-blue">
      <thead>
        <tr>
          <th>ID</th>
          <th>Name</th>
          <th>Link</th>
          <th>Status</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td data-title="ID">1</td>
          <td data-title="Name">Material Design Color Palette</td>
          <td data-title="Link">
            <a href="https://github.com/zavoloklom/material-design-color-palette" target="_blank">GitHub</a>
          </td>
          <td data-title="Status">Completed</td>
        </tr>
        <tr>
          <td data-title="ID">2</td>
          <td data-title="Name">Material Design Iconic Font</td>
          <td data-title="Link">
            <a href="http://codepen.io/zavoloklom/pen/uqCsB" target="_blank">Codepen</a>
            <a href="https://github.com/zavoloklom/material-design-iconic-font" target="_blank">GitHub</a>
          </td>
          <td data-title="Status">Completed</td>
        </tr>
        <tr>
          <td data-title="ID">3</td>
          <td data-title="Name">Material Design Hierarchical Display</td>
          <td data-title="Link">
            <a href="http://codepen.io/zavoloklom/pen/eNaEBM" target="_blank">Codepen</a>
            <a href="https://github.com/zavoloklom/material-design-hierarchical-display" target="_blank">GitHub</a>
          </td>
          <td data-title="Status">Completed</td>
        </tr>
        <tr>
          <td data-title="ID">4</td>
          <td data-title="Name">Material Design Sidebar</td>
          <td data-title="Link"><a href="http://codepen.io/zavoloklom/pen/dIgco" target="_blank">Codepen</a></td>
          <td data-title="Status">Completed</td>
        </tr>
        <tr>
          <td data-title="ID">5</td>
          <td data-title="Name">Material Design Tiles</td>
          <td data-title="Link">
            <a href="http://codepen.io/zavoloklom/pen/wtApI" target="_blank">Codepen</a>
          </td>
          <td data-title="Status">Completed</td>
        </tr>
        <tr>
          <td data-title="ID">6</td>
          <td data-title="Name">Material Design Typography</td>
          <td data-title="Link">
            <a href="http://codepen.io/zavoloklom/pen/IkaFL" target="_blank">Codepen</a>
            <a href="https://github.com/zavoloklom/material-design-typography" target="_blank">GitHub</a>
          </td>
          <td data-title="Status">Completed</td>
        </tr>
        <tr>
          <td data-title="ID">7</td>
          <td data-title="Name">Material Design Buttons</td>
          <td data-title="Link">
            <a href="http://codepen.io/zavoloklom/pen/Gubja" target="_blank">Codepen</a>
          </td>
          <td data-title="Status">In progress</td>
        </tr>
        <tr>
          <td data-title="ID">8</td>
          <td data-title="Name">Material Design Form Elements</td>
          <td data-title="Link">
            <a href="http://codepen.io/zavoloklom/pen/yaozl" target="_blank">Codepen</a>
          </td>
          <td data-title="Status">In progress</td>
        </tr>
        <tr>
          <td data-title="ID">9</td>
          <td data-title="Name">Material Design Email Template</td>
          <td data-title="Link">
            <a href="http://codepen.io/zavoloklom/pen/qEVqzx" target="_blank">Codepen</a>
          </td>
          <td data-title="Status">Completed</td>
        </tr>
        <tr>
          <td data-title="ID">10</td>
          <td data-title="Name">Material Design Animation Timing (old one)</td>
          <td data-title="Link">
            <a href="http://codepen.io/zavoloklom/pen/Jbrho" target="_blank">Codepen</a>
          </td>
          <td data-title="Status">Completed</td>
        </tr>
      </tbody>
    </table>
  </div>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

        <script src="js/index.js"></script>
<script src="../Assets/JS/ResponsiveTable.js"></script>
    </div>
  </body>
</html>

        	  <asp:SqlDataSource ID="sqlAdminUsers" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="select email Email, f_name FirstName, l_name LastName, password, permission_level Classification
from end_user"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="adminPageSpecificJS" runat="server">
</asp:Content>
