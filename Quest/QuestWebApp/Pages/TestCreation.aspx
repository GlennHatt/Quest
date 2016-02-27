<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Pages/teacher.master" AutoEventWireup="true" CodeBehind="testCreation.aspx.cs" Inherits="QuestWebApp.Pages.testCreation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="teacherBreadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="teacherHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="teacherExtraReferances" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="teacherWithSidebarSidebar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="teacherWithSidebarBodyContent" runat="server">
    <asp:SqlDataSource ID="SQLSectionSelect" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
SELECT section_id, c.code || '-' || section_number AS section_title
  FROM section s
       JOIN class c USING (class_id)" />
    <asp:Label ID="lblSection" runat="server" Text="Section: " />
    <asp:DropDownList ID="ddlSection" runat="server" DataSourceID="SQLSectionSelect" DataTextField="section_title" DataValueField="section_id" />
    <br />

    <asp:Label ID="lblName" runat="server" Text="Name: " />
    <asp:TextBox ID="txtName" runat="server" />
    <br />

    <asp:Label ID="lblTimeLimit" runat="server" Text="Time Limit: " />
    <asp:DropDownList ID="ddlTimeLimit" runat="server" >
        <asp:ListItem Value="5">5 minutes</asp:ListItem>
        <asp:ListItem Value="10">10 minutes</asp:ListItem>
        <asp:ListItem Value="15">15 minutes</asp:ListItem>
        <asp:ListItem Value="20">20 minutes</asp:ListItem>
        <asp:ListItem Value="25">25 minutes</asp:ListItem>
        <asp:ListItem Value="30">30 minutes</asp:ListItem>
        <asp:ListItem Value="45">45 minutes</asp:ListItem>
        <asp:ListItem Value="50">50 minutes</asp:ListItem>
        <asp:ListItem Value="60">1 hour</asp:ListItem>
        <asp:ListItem Value="80">1 hour 20 minutes</asp:ListItem>
        <asp:ListItem Value="0">No Time Limit</asp:ListItem>
    </asp:DropDownList>
    <br />

    <asp:Label ID="lblDate" runat="server" Text="Date: " />
    <asp:Calendar ID="cldrTestDay" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px">
        <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
        <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
        <OtherMonthDayStyle ForeColor="#999999" />
        <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
        <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
        <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
        <WeekendDayStyle BackColor="#CCCCFF" />
    </asp:Calendar>
    <br />
    
    <asp:Button ID="btnAddInfo" runat="server" Text="Press Me" OnClick="btnAddInfo_Click"  />

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="teacherPageSpecificJS" runat="server">
</asp:Content>
