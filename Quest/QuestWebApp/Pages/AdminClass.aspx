﻿<%@ Page Title="Admin | Classes" Language="C#" MasterPageFile="~/Master-Pages/admin.master" AutoEventWireup="true" CodeBehind="adminClass.aspx.cs" Inherits="QuestWebApp.Pages.AdminClass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="adminBreadcrumbs" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="adminHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="adminExtraReferances" runat="server">
    <script src="../Assets/JS/modernizerResponsiveTable.js"></script>
    <link href="../Assets/Styles/Responsive-Tables/responsiveTableNormalize.css" rel="stylesheet" />
    <link href="../Assets/Styles/Responsive-Tables/ResponsiveTableClass.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="adminWithSidebarSidebar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="adminWithSidebarBodyContent" runat="server">

    <div class="mdl-card mdl-shadow--3dp demo-card-wide" style="width: 85%; margin-left:7%;">
        <div class="table-responsive-vertical shadow-z-1">
            <asp:GridView CssClass="table table-hover table-mc-light-blue" ID="GVClass" runat="server" AutoGenerateColumns="False" DataSourceID="sqlAdminClasses" RowStyle-Wrap="false" CellSpacing="-1" GridLines="None" OnRowDataBound="GVClass_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="CODE" HeaderText="Class Code" SortExpression="CODE"></asp:BoundField>
                    <asp:BoundField DataField="TITLE" HeaderText="Class Name" SortExpression="TITLE"></asp:BoundField>
                    <asp:BoundField DataField="SECTION_NUMBER" HeaderText="Section Number" SortExpression="SECTION_NUMBER"></asp:BoundField>
                    <asp:BoundField DataField="L_NAME" HeaderText="Last Name" SortExpression="L_NAME"></asp:BoundField>
                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:LinkButton ID="deleteButton" runat="server"><i class="material-icons testAlert">clear</i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <br />
    </div>
    <asp:SqlDataSource runat="server" ID="sqlAdminClasses" ConnectionString='<%$ ConnectionStrings:ProductionDB %>' ProviderName='<%$ ConnectionStrings:ProductionDB.ProviderName %>' SelectCommand="
select class.code, class.title, section.section_number, end_user.l_name 
from class, section, end_user 
where end_user.user_id = section.teacher_id
and section.class_id = class.class_id"></asp:SqlDataSource>
    <%--</div>--%>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="adminPageSpecificJS" runat="server">

    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src="../Assets/JS/ResponsiveTable.js"></script>
</asp:Content>