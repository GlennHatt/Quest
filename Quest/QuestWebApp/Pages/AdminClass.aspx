<%@ Page Title="Admin | Classes" Language="C#" MasterPageFile="~/Master-Pages/admin.master" AutoEventWireup="true" CodeBehind="adminClass.aspx.cs" Inherits="QuestWebApp.Pages.AdminClass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="adminBreadcrumbs" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="adminHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="adminExtraReferances" runat="server">
    <script src="../Assets/JS/modernizerResponsiveTable.js"></script>
    <link href="../Assets/Styles/Responsive-Tables/responsiveTableNormalize.css" rel="stylesheet" />
    <link href="../Assets/Styles/Responsive-Tables/ResponsiveTableClass.css" rel="stylesheet" />
    <link href="../Assets/Styles/deleteButton.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="adminWithSidebarSidebar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="adminWithSidebarBodyContent" runat="server">

        <div class="mdl-card mdl-shadow--3dp demo-card-wide sortButton" style="width: 85%; margin: 5%; margin-left: 7%;">
        <div class="mdl-card__supporting-text" style="text-align: center; width: 100%;">
            <div class="mdl-textfield mdl-js-textfield" style="text-align: left;">
                <label style="padding-left: 1%;">Sort By:</label>
                <asp:DropDownList ID="ddlSortBy" runat="server" class="mdl-textfield__input" DataTextField="Sort By">
                    <asp:ListItem Value="Class Code"></asp:ListItem>
                    <asp:ListItem Value="Class Name"></asp:ListItem>
                    <asp:ListItem Value="Full Name"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="mdl-textfield mdl-js-textfield" style="text-align: left;">
                <asp:DropDownList ID="ddlSortDirection" runat="server" class="mdl-textfield__input">
                    <asp:ListItem Value="Ascending"></asp:ListItem>
                    <asp:ListItem Value="Descending"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <br />
            <asp:LinkButton ID="btnSortUsers" class="mdl-button mdl-js-button mdl-button--colored mdl-js-ripple-effect mdl-button--colored" BackColor="#FF6E40" ForeColor="White" runat="server" OnClick="btnSortUsers_Click">
           Sort
            </asp:LinkButton>
        </div>
        <%--Link http://ngenioussolutions.com/blog/responsive-gridview-for-mobile-phone-tablet-and-desktop-display-in-asp-net/--%>
    </div>

    <div class="mdl-card mdl-shadow--3dp demo-card-wide" style="width: 85%; margin-left:7%;">
        <div class="table-responsive-vertical shadow-z-1">
            <asp:GridView CssClass="table table-hover table-mc-light-blue" ID="GVClass" runat="server" AutoGenerateColumns="False" DataSourceID="sqlAdminClasses" RowStyle-Wrap="false" CellSpacing="-1" GridLines="None" OnRowDataBound="GVClass_RowDataBound" DataKeyNames="section_id">
                <Columns>
                    <asp:TemplateField HeaderText="Edit">
                    <ItemTemplate>
                     <asp:LinkButton ID="lnkEdit" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" runat="server" ForeColor="White" CommandName="Edit">Edit</asp:LinkButton>
                    </ItemTemplate>
                        <EditItemTemplate>
                                        <asp:LinkButton ID="lnkUpdate" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" runat="server" ForeColor="White" CommandName="Update">Update</asp:LinkButton>
                                        <asp:LinkButton ID="lnkCancel" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" runat="server" ForeColor="White" CommandName="Cancel">Cancel</asp:LinkButton>
                         </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="CODE" HeaderText="Class Code" SortExpression="CODE"></asp:BoundField>
                    <asp:BoundField DataField="TITLE" HeaderText="Class Name" SortExpression="TITLE"></asp:BoundField>
                    <asp:BoundField DataField="SECTION_NUMBER" HeaderText="Section Number" SortExpression="SECTION_NUMBER"></asp:BoundField>
                    <asp:BoundField DataField="FULL_NAME" HeaderText="Full Name" SortExpression="FULL_NAME" ReadOnly="true"></asp:BoundField>
                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            

<div class="btn" id="myButton" onclick="setElements(this, event)">
  <div class="btn-back">
    <p>Are you sure?</p>
      <asp:LinkButton class="mdl-navigation__link" id="btnDone" runat="server" Text="Settings" OnClick="btnDone" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>' > <i class="material-icons yes">done</i></asp:LinkButton>
    <asp:LinkButton class="mdl-navigation__link" id="btnClear" runat="server" Text="Settings" OnClientClick="closeBox(this, event)"> <i class="material-icons no">clear</i></asp:LinkButton>
  </div>
  <div class="btn-front">Delete</div>
</div> 
                           
                        </ItemTemplate>
                        
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <br />
    </div>

    <asp:SqlDataSource runat="server" ID="sqlAdminClasses" ConnectionString='<%$ ConnectionStrings:ProductionDB %>' ProviderName='<%$ ConnectionStrings:ProductionDB.ProviderName %>' SelectCommand="
select class.class_id, section.section_id, class.code, class.title, section.section_number, end_user.l_name || ', ' || end_user.f_name as full_name 
from class, section, end_user 
where end_user.user_id = section.teacher_id
and section.class_id = class.class_id" UpdateCommand="
        BEGIN
    classes.change(
    :class.class_id,
    :class.code,
    :class.title );
END;">

    </asp:SqlDataSource>
    <%--</div>--%>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="adminPageSpecificJS" runat="server">

    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src="../Assets/JS/ResponsiveTable.js"></script>
    <script src="../Assets/JS/deleteButton.js"></script>
</asp:Content>
