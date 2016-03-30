<%@ Page Title="Admin | Users" Language="C#" MasterPageFile="~/Master-Pages/admin.master" AutoEventWireup="true" CodeBehind="adminUser.aspx.cs" Inherits="QuestWebApp.Pages.AdminUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="adminBreadcrumbs" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="adminHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="adminExtraReferances" runat="server">
    <script src="../Assets/JS/modernizerResponsiveTable.js"></script>
    <%--<script src="http://s.codepen.io/assets/libs/modernizr.js" type="text/javascript"></script>--%>
    <link href="../Assets/Styles/Responsive-Tables/responsiveTableNormalize.css" rel="stylesheet" />
    <link href="../Assets/Styles/Responsive-Tables/ResponsiveTableUsers.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="adminWithSidebarSidebar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="adminWithSidebarBodyContent" runat="server">
    
    <%--Link http://ngenioussolutions.com/blog/responsive-gridview-for-mobile-phone-tablet-and-desktop-display-in-asp-net/--%>

   
    <div class="mdl-card mdl-shadow--3dp demo-card-wide " style="width: 85%; margin-left:7%;">
        <div class="table-responsive-vertical shadow-z-1">
<asp:GridView CssClass="table table-hover table-mc-light-blue" ID="GVUser" runat="server" RowStyle-Wrap="false" DataSourceID="sqlAdminUsers" CellSpacing="-1" GridLines="None" OnRowDataBound="GVUser_RowDataBound" AutoGenerateColumns="False" >
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="USER_ID" HeaderText="User ID" SortExpression="USER_ID" Visible="false"/>
            <asp:BoundField DataField="EMAIL" HeaderText="E-Mail" SortExpression="EMAIL" />
            <asp:BoundField DataField="EMAIL_PASSWORD" HeaderText="E-Mail Password" SortExpression="EMAIL_PASSWORD" />
            <asp:BoundField DataField="USERNAME" HeaderText="Username" SortExpression="USERNAME" />
            <asp:BoundField DataField="FIRSTNAME" HeaderText="First Name" SortExpression="FIRSTNAME" />
            <asp:BoundField DataField="LASTNAME" HeaderText="Last Name" SortExpression="LASTNAME" />
            <asp:BoundField DataField="PASSWORD" HeaderText="Password" SortExpression="PASSWORD" />
            <asp:BoundField DataField="CLASSIFICATION" HeaderText="Classification" SortExpression="CLASSIFICATION" />
            <asp:TemplateField HeaderText="Active">
            <ItemTemplate>
                <asp:LinkButton cssclass="mdl-button mdl-js-button mdl-button--raised" ID="activeButton" runat="server" Text="Active" BackColor="Green" ForeColor="White" OnClick="active_Click"/> 
            </ItemTemplate>
        </asp:TemplateField>
        </Columns>
    
<RowStyle Wrap="False"></RowStyle>
    
    </asp:GridView>
            </div>
        </div>


    <%--<div class="table-responsive-vertical shadow-z-1">
    <asp:GridView ID="GridView1" CssClass="table table-hover table-mc-light-blue" runat="server" OnRowDataBound="GridView1_RowDataBound" CellSpacing="-1" GridLines="None">
        <%--<Columns>
            <asp:BoundField DataField="ID" HeaderText="Id" />
            <asp:BoundField DataField="Name" HeaderText="Name" />
            <asp:BoundField DataField="Link" HeaderText="Link" />
            <asp:BoundField DataField="Status" HeaderText="Status" />
        </Columns>--%>
    </asp:GridView>
        </div>--%>

        

<%--    <div class="table-responsive-vertical shadow-z-1">
    <table id="" class="table table-hover table-mc-light-blue">
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
  </div>--%>
   


  
            <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
            <script src="../Assets/JS/ResponsiveTable.js"></script>
        	  <asp:SqlDataSource ID="sqlAdminUsers" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
SELECT user_id, username, email Email, email_password, f_name FirstName, l_name LastName, password, permission_level Classification
  FROM end_user" UpdateCommand="
BEGIN
  end_users.change(
    p_EndUserID       t_EndUserID,
    p_Username        t_Username,
    p_Password        t_Password,
    p_FName           t_FName,
    p_LName           t_LName,
    p_Email           t_Email,
    p_EmailPassword   t_EmailPassword,
    p_PermissionLevel t_PermissionLevel)
END;">
             
    </asp:SqlDataSource>
    <!--     <UpdateParameters>
                      <asp:Parameter Name="EndUserID"  />
                      <asp:Parameter Name="Username" />
                      <asp:Parameter Name="Password" />
                      <asp:Parameter Name="FName" />
                      <asp:Parameter Name="LName" />
                      <asp:Parameter Name="Email" />
                      <asp:Parameter Name="EmailPassword" />
                      <asp:Parameter Name="PermissionLevel" />
                  </UpdateParameters> -->
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="adminPageSpecificJS" runat="server">
</asp:Content>


