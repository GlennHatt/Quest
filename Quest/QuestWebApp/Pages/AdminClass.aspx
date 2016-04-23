<%@ Page Title="Admin | Sections" Language="C#" MasterPageFile="~/Master-Pages/admin.master" AutoEventWireup="true" CodeBehind="adminClass.aspx.cs" Inherits="QuestWebApp.Pages.adminClass" %>

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
                <asp:DropDownList ID="ddlSortBy" runat="server" CssClass="mdl-textfield__input" DataTextField="Sort By">
                    <asp:ListItem Value="Class Code"></asp:ListItem>
                    <asp:ListItem Value="Class Name"></asp:ListItem>
                    <asp:ListItem Value="Full Name"></asp:ListItem>
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

    <div class="mdl-card mdl-shadow--3dp demo-card-wide" style="width: 85%; margin-left: 7%;">
        <div class="table-responsive-vertical shadow-z-1">


            <!-- The following code is unaltered code from http://stackoverflow.com/questions/5288682/maintain-panel-scroll-position-on-partial-postback-asp-net -->
            <!-- This fixes the partial post pack not maintaining scroll possition error -->
<%--            <asp:ScriptManager ID="ScriptManager1" runat="server" ScriptMode="Release" />
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
                    <asp:Panel ID="pnlEditQuestions" runat="server">--%>
                        <!-- End borrowed Code, except the closeing tags... -->


                        <asp:GridView CssClass="table table-hover table-mc-light-blue" ID="GVClass" runat="server" AutoGenerateColumns="False" DataSourceID="sqlAdminClasses" RowStyle-Wrap="false" CellSpacing="-1" GridLines="None" OnRowDataBound="GVClass_RowDataBound" DataKeyNames="section_id" OnRowUpdated="GVClass_RowUpdated" OnPreRender="GVClass_PreRender" OnDataBound="GVClass_DataBound" OnRowCommand="GVClass_RowCommand">
                            <Columns>
                                <asp:TemplateField HeaderText="Edit">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkEdit" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" runat="server" ForeColor="White" CommandName="Edit">Edit</asp:LinkButton>
                                        <asp:HiddenField ID="hdnSectionID" runat="server" Value='<%#Bind("section_id") %>' />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:LinkButton ID="lnkUpdate" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" runat="server" ForeColor="White" CommandName="Update">Update</asp:LinkButton>
                                        <asp:LinkButton ID="lnkCancel" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" runat="server" ForeColor="White" CommandName="Cancel">Cancel</asp:LinkButton>
                                        <asp:HiddenField ID="hdnSectionID" runat="server" Value='<%#Bind("section_id") %>' />
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


                                        <div class="btn" id="myButton" onclick="setElements(this, event)" runat="server">
                                            <div class="btn-back">
                                                <p>Are you sure?</p>
                                                <asp:LinkButton CssClass="mdl-navigation__link" ID="btnDone" runat="server" Text="Settings" OnClick="btnDone" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'> <i class="material-icons yes">done</i></asp:LinkButton>
                                                <asp:LinkButton CssClass="mdl-navigation__link" ID="btnClear" runat="server" Text="Settings" OnClientClick="closeBox(this, event)"> <i class="material-icons no">clear</i></asp:LinkButton>
                                            </div>
                                            <div class="btn-front" id="btnFront" runat="server">Delete</div>
                                        </div>

                                    </ItemTemplate>

                                </asp:TemplateField>
                            </Columns>

                            <RowStyle Wrap="False"></RowStyle>
                        </asp:GridView>
<%--                    </asp:Panel>
                </ContentTemplate>
            </asp:UpdatePanel>--%>
        </div>
        <br />
    </div>

    <asp:SqlDataSource runat="server" ID="sqlAdminClasses" ConnectionString='<%$ ConnectionStrings:ProductionDB %>' ProviderName='<%$ ConnectionStrings:ProductionDB.ProviderName %>' SelectCommand="
select semester, class_id, title, section_id, code || '/' || c.title as CODE_TITLE, section_number, l_name || ', ' || f_name as full_name, user_id 
 from class c
      JOIN section s USING (class_id)
      JOIN end_user e ON (s.teacher_id = e.user_id)"
        UpdateCommand="
BEGIN
    sections.change(
        p_SectionID     =&gt; :section_id,
        p_TeacherID     =&gt; :user_id,
        p_ClassID       =&gt; :class_id,
        p_Semester      =&gt; :semester,
        p_SectionNumber =&gt; :section_number);
END;"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlTeachers" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
SELECT user_id, f_name || ' ' || l_name as FULL_NAME
  FROM end_user
 WHERE permission_level = 'T'
   AND  active != 'false'
       OR permission_level = 'A'"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlClasses" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
SELECT class_id, code || '/' || title as CODE_TITLE
  FROM class
 "></asp:SqlDataSource>
    =
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="adminPageSpecificJS" runat="server">
    <script src="../Assets/JS/deleteButton.js"></script>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src="../Assets/JS/ResponsiveTable.js"></script>
</asp:Content>
