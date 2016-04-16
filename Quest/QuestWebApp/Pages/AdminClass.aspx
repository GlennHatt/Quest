<%@ Page Title="Admin | Class" Language="C#" MasterPageFile="~/Master-Pages/admin.master" AutoEventWireup="true" CodeBehind="adminClass.aspx.cs" Inherits="QuestWebApp.Pages.adminClass" %>

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
                                        <asp:LinkButton ID="lnkUpdate" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" runat="server" ForeColor="White" CommandName="Update" OnClick="lnkUpdate_Click">Update</asp:LinkButton>
                                        <asp:LinkButton ID="lnkCancel" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" runat="server" ForeColor="White" CommandName="Cancel">Cancel</asp:LinkButton>
                         </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Semester" SortExpression="SEMESTER">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList4" runat="server" SelectedValue='<%# Bind("semester") %>'>
                                <asp:ListItem Text="Spring 2016" Value="Spring 2016" />                                
                                <asp:ListItem Text="Fall 2016" Value="Fall 2016" />
                                <asp:ListItem Text="Spring 2017" Value="Spring 2017"></asp:ListItem>
                                <asp:ListItem Text="Fall 2017" Value="Fall 2017"></asp:ListItem>
                                <asp:ListItem Text="Spring 2018" Value="Spring 2018"></asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("semester") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Class Code" SortExpression="CODE_TITLE">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="sqlClasses" DataTextField="CODE_TITLE" DataValueField="class_id" SelectedValue='<%# Bind("class_id") %>'>
                                        </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("CODE_TITLE") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Section Number" SortExpression="SECTION_NUMBER">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("section_number") %>'>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("section_number") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Teacher Name" SortExpression="FULL_NAME">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="sqlTeachers" DataTextField="FULL_NAME" DataValueField="user_id" SelectedValue='<%# Bind("user_id") %>'>
                                        </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("FULL_NAME") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
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

<RowStyle Wrap="False"></RowStyle>
            </asp:GridView>
        </div>
        <br />
    </div>

    <asp:SqlDataSource runat="server" ID="sqlAdminClasses" ConnectionString='<%$ ConnectionStrings:ProductionDB %>' ProviderName='<%$ ConnectionStrings:ProductionDB.ProviderName %>' SelectCommand="
select semester, class_id, section_id, code || '/' || c.title as CODE_TITLE, section_number, l_name || ', ' || f_name as full_name, user_id 
 from class c
      JOIN section s USING (class_id)
      JOIN end_user e ON (s.teacher_id = e.user_id)" UpdateCommand="
BEGIN
    sections.change(
        p_SectionID     => :section_id,
        p_TeacherID     => :user_id,
        p_ClassID       => :class_id,
        p_Semester      => :semester,
        p_SectionNumber => :section_number);
END;">

    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlTeachers" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="SELECT user_id, f_name || ' ' || l_name as FULL_NAME
  FROM end_user
 WHERE permission_level = 'T'
       OR permission_level = 'A'"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlClasses" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
SELECT class_id, code || '/' || title as CODE_TITLE
  FROM class
 "></asp:SqlDataSource>
    <%--</div>--%>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="adminPageSpecificJS" runat="server">
    <script src="../Assets/JS/deleteButton.js"></script>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src="../Assets/JS/ResponsiveTable.js"></script>
</asp:Content>
