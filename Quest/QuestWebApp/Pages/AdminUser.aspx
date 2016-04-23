<%@ Page Title="Admin | Users" Language="C#" MasterPageFile="~/Master-Pages/admin.master" AutoEventWireup="true" CodeBehind="adminUser.aspx.cs" Inherits="QuestWebApp.Pages.adminUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="adminBreadcrumbs" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="adminHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="adminExtraReferances" runat="server">
    <script src="../Assets/JS/modernizerResponsiveTable.js"></script>
    <%--<script src="http://s.codepen.io/assets/libs/modernizr.js" type="text/javascript"></script>--%>
    <link href="../Assets/Styles/Responsive-Tables/responsiveTableNormalize.css" rel="stylesheet" />
    <link href="../Assets/Styles/Responsive-Tables/ResponsiveTableUsers.css" rel="stylesheet" />

    <style>
        table, tr, td, th {
            border-collapse: collapse;
        }

            tr.header {
                cursor: pointer;
            }
    </style>


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="adminWithSidebarSidebar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="adminWithSidebarBodyContent" runat="server">


    <div class="mdl-card mdl-shadow--3dp demo-card-wide sortButton" style="width: 85%; margin: 5%; margin-left: 7%;">
        <div class="mdl-card__supporting-text" style="text-align: center; width: 100%;">
            <div class="mdl-textfield mdl-js-textfield" style="text-align: left;">
                <label style="padding-left: 1%;">Sort By:</label>
                <asp:DropDownList ID="ddlSortBy" runat="server" CssClass="mdl-textfield__input" DataTextField="Sort By">
                    <asp:ListItem Value="First Name"></asp:ListItem>
                    <asp:ListItem Value="Last Name"></asp:ListItem>
                    <asp:ListItem Value="E-mail"></asp:ListItem>
                    <asp:ListItem Value="Username"></asp:ListItem>
                    <asp:ListItem Value="Classification"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="mdl-textfield mdl-js-textfield" style="text-align: left;">
                <label style="padding-left: 1%;">Order By:</label>
                <asp:DropDownList ID="ddlSortDirection" runat="server" CssClass="mdl-textfield__input">
                    <asp:ListItem Value="Ascending"></asp:ListItem>
                    <asp:ListItem Value="Descending"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <br />
            <asp:LinkButton ID="btnSortUsers" CssClass="mdl-button mdl-js-button mdl-button--colored mdl-js-ripple-effect mdl-button--colored" BackColor="#FF6E40" ForeColor="White" runat="server" OnClick="btnSortUsers_Click">
           Sort
            </asp:LinkButton>
        </div>
        <%--Link http://ngenioussolutions.com/blog/responsive-gridview-for-mobile-phone-tablet-and-desktop-display-in-asp-net/--%>
    </div>



    <div class="mdl-card mdl-shadow--3dp demo-card-wide " style="width: 85%; margin-left: 7%;">
        <div class="table-responsive-vertical shadow-z-1">
            <asp:SqlDataSource ID="sqlAdminUsers" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" OnUpdating="sqlAdminUsers_Updating" SelectCommand="
SELECT user_id, f_name, l_name, permission_level, email, password, username, email_password, DECODE(active, 'true', 'Active',
                                                                                                            'false', 'Inactive') AS active, receive_email
  FROM end_user"
                UpdateCommand="
BEGIN
  null;
END;"></asp:SqlDataSource>
            <asp:SqlDataSource ID="sqlPermissions" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="SELECT DISTINCT &quot;PERMISSION_LEVEL&quot; FROM &quot;END_USER&quot;"></asp:SqlDataSource>

            <!-- The following code is unaltered code from http://stackoverflow.com/questions/5288682/maintain-panel-scroll-position-on-partial-postback-asp-net -->
            <!-- This fixes the partial post pack not maintaining scroll possition error -->
            <asp:ScriptManager ID="ScriptManager1" runat="server" ScriptMode="Release" />
            <script type="text/javascript">
                // It is important to place this JavaScript code after ScriptManager1
                var xPos, yPos;
                var prm = Sys.WebForms.PageRequestManager.getInstance();

                function BeginRequestHandler(sender, args) {
                    if ($get('<%=pnlEditQuestions.ClientID%>') != null) {
                // Get X and Y positions of scrollbar before the partial postback
                xPos = $get('<%=pnlEditQuestions.ClientID%>').scrollLeft;
                yPos = $get('<%=pnlEditQuestions.ClientID%>').scrollTop;
            }
        }

        function EndRequestHandler(sender, args) {
            if ($get('<%=pnlEditQuestions.ClientID%>') != null) {
                // Set X and Y positions back to the scrollbar
                // after partial postback
                $get('<%=pnlEditQuestions.ClientID%>').scrollLeft = xPos;
                $get('<%=pnlEditQuestions.ClientID%>').scrollTop = yPos;
            }
        }

        prm.add_beginRequest(BeginRequestHandler);
        prm.add_endRequest(EndRequestHandler);
            </script>

            <asp:UpdatePanel ID="updPnlEditQuestions" runat="server">
                <ContentTemplate>
                    <asp:Panel ID="pnlEditQuestions" runat="server">
                        <!-- End borrowed Code, except the closeing tags... -->


                        <asp:GridView CssClass="table table-hover table-mc-light-blue" ID="GVUser" runat="server" RowStyle-Wrap="false" DataSourceID="sqlAdminUsers" CellSpacing="-1" GridLines="None" OnRowDataBound="GVUser_RowDataBound" AutoGenerateColumns="False" DataKeyNames="user_id" OnPreRender="grdEventsAvailable_PreRender1" AllowSorting="True" OnRowUpdated="GVUser_RowUpdated" OnRowCancelingEdit="GVUser_RowCancelingEdit" OnRowCommand="GVUser_RowCommand" >
                            <EditRowStyle CssClass="GridViewEditRow" />
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblDispUser" Text='+' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkEdit" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" runat="server" ForeColor="White" CommandName="Edit">Edit</asp:LinkButton>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:LinkButton ID="lnkUpdate" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" runat="server" ForeColor="White" CommandName="Update" CommandArgument='<%# Bind("user_id") %>' ValidationGroup="updateUser">Update</asp:LinkButton>
                                        <asp:LinkButton ID="lnkCancel" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" runat="server" ForeColor="White" CommandName="Cancel">Cancel</asp:LinkButton>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="First Name" SortExpression="f_name">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtFirstName" runat="server" Text='<%# Bind("f_name") %>'></asp:TextBox><br />
                                        <asp:RequiredFieldValidator ValidationGroup="updateUser" SkinID="validatorSkin" runat="server" ID="valUserFname" ControlToValidate="txtFirstName" ErrorMessage="First name required"  SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblFirstName" runat="server" Text='<%# Bind("f_name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Last Name" SortExpression="l_name">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtLastName" runat="server" Text='<%# Bind("l_name") %>'></asp:TextBox><br />
                                        <asp:RequiredFieldValidator SkinID="validatorSkin" ValidationGroup="updateUser" runat="server" ID="valUserLname" ControlToValidate="txtLastName" ErrorMessage="Last name required"  SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblLastName" runat="server" Text='<%# Bind("l_name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="E-Mail" SortExpression="email">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="E-Mail Password" SortExpression="email_password">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtEmailPassword" runat="server" Text='<%# Bind("email_password") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("email_password") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Username" SortExpression="username">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtUsername" runat="server" Text='<%# Bind("username") %>'></asp:TextBox><br />
                                        <asp:RequiredFieldValidator SkinID="validatorSkin" ValidationGroup="updateUser" runat="server" ID="valUserName" ControlToValidate="txtUsername" ErrorMessage="Username required"  SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("username") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Classification" SortExpression="permission_level">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="ddlPermissionLevel" runat="server" DataSourceID="sqlPermissions" DataTextField="permission_level" DataValueField="permission_level" SelectedValue='<%# Bind("permission_level") %>'>
                                        </asp:DropDownList>

                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="TextBox1" runat="server" Text='<%# Bind("permission_level") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Active">
                                    <ItemTemplate>
                                        <asp:LinkButton CssClass="mdl-button mdl-js-button mdl-button--raised" ID="activeButton" runat="server" Text='<%# Bind("active") %>'  ForeColor="White" CommandArgument='<%# Bind("user_id") %>' CommandName="active" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>

                            <RowStyle Wrap="False"></RowStyle>

                        </asp:GridView>
                    </asp:Panel>
                </ContentTemplate>

            </asp:UpdatePanel>
        </div>
    </div>

    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src="../Assets/JS/ResponsiveTable.js"></script>




</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="adminPageSpecificJS" runat="server">

    <script>
        $('.header').click(function () {
            $(this).find('span').text(function (_, value) { return value == '-' ? '+' : '-' });
            $(this).nextUntil('tr.header').slideToggle(100, function () {
            });
        });

        //$(function () {
        //    $(".research tr:not(.header)").hide();
        //    $(".research tr:first-child").show();

        //    $(".research tr.accordion").click(function () {
        //        $(this).nextAll("tr").fadeToggle(500);
        //    }).eq(0).trigger('click');
        //});


    </script>
</asp:Content>


