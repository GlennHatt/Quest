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
<asp:SqlDataSource ID="sqlAdminUsers" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
SELECT *
  FROM end_user" UpdateCommand="
BEGIN
  end_users.change(
    :user_id,
    :username,
    :password,
    :f_name,
    :l_name,
    :email,
    :email_password,
    :permission_level);
END;">
             
    </asp:SqlDataSource>
            <asp:SqlDataSource ID="sqlPermissions" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="SELECT DISTINCT &quot;PERMISSION_LEVEL&quot; FROM &quot;END_USER&quot;"></asp:SqlDataSource>    
<asp:GridView CssClass="table table-hover table-mc-light-blue" ID="GVUser" runat="server" RowStyle-Wrap="false" DataSourceID="sqlAdminUsers" CellSpacing="-1" GridLines="None" OnRowDataBound="GVUser_RowDataBound" AutoGenerateColumns="False" DataKeyNames="user_id" OnPreRender="grdEventsAvailable_PreRender1" > 
    <EditRowStyle CssClass="GridViewEditRow" />
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <%--<asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" Text="Edit" CommandName="Edit" CommandArgument='<%#Bind("user_id") %>' />
                        </ItemTemplate>

                    </asp:TemplateField>--%>
            <%--<asp:BoundField DataField="user_id" HeaderText="User ID" SortExpression="USER_ID" Visible="false"/> --%>
            <asp:BoundField DataField="email" HeaderText="E-Mail" SortExpression="EMAIL" />
            <asp:BoundField DataField="email_password" HeaderText="E-Mail Password" SortExpression="EMAIL_PASSWORD" />
            <asp:BoundField DataField="username" HeaderText="Username" SortExpression="USERNAME" />
            <asp:BoundField DataField="f_name" HeaderText="First Name" SortExpression="FIRSTNAME" />
            <asp:BoundField DataField="l_name" HeaderText="Last Name" SortExpression="LASTNAME" />
            <asp:BoundField  DataField="password" HeaderText="Password" SortExpression="PASSWORD" />
            <asp:TemplateField HeaderText="Classification" SortExpression="CLASSIFICATION">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="sqlPermissions" DataTextField="PERMISSION_LEVEL" DataValueField="PERMISSION_LEVEL" SelectedValue='<%# Bind("PERMISSION_LEVEL") %>'>
                    </asp:DropDownList>
                    
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="TextBox1" runat="server" Text='<%# Bind("permission_level") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
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
  
            <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
            <script src="../Assets/JS/ResponsiveTable.js"></script>

    <script type="text/javascript">
    var xPos, yPos;
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_beginRequest(BeginRequestHandler);
    prm.add_endRequest(EndRequestHandler);
    function BeginRequestHandler(sender, args) {
        xPos = $get('scrollDiv').scrollLeft;
        yPos = $get('scrollDiv').scrollTop;
    }
    function EndRequestHandler(sender, args) {
        $get('scrollDiv').scrollLeft = xPos;
        $get('scrollDiv').scrollTop = yPos;
    }
</script>

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="adminPageSpecificJS" runat="server">
</asp:Content>


