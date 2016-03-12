<%@ Page Title="Teacher | Test Creation" Language="C#" MasterPageFile="~/Master-Pages/teacher.master" AutoEventWireup="true" CodeBehind="testCreation.aspx.cs" Inherits="QuestWebApp.Pages.testCreation" %>
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
    <div class="demo-card-wide mdl-card-addClass mdl-shadow--3dp demo-card-square mdl-card">
    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
    <asp:Label ID="lblSection" class="mdl-textfield__input" runat="server" Text="Section: " />
    <asp:DropDownList ID="ddlSection" class="mdl-textfield__input" runat="server" DataSourceID="SQLSectionSelect" DataTextField="section_title" DataValueField="section_id" />
    </div>

    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
    <label class="mdl-textfield__label"style="bottom:0px"> Test Name: </label>
    <asp:TextBox ID="txtName" class="mdl-textfield__input" runat="server" />
    </div>

    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
    <asp:Label ID="lblTimeLimit" class="mdl-textfield__input" runat="server" Text="Time Limit: " />
    <asp:DropDownList ID="ddlTimeLimit" class="mdl-textfield__input" runat="server" >
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
         </div>

    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
    <asp:Label ID="lblDate" class="mdl-textfield__input" runat="server" Text=" Due Date: " />
    <asp:Calendar ID="cldrTestDay" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" Width="350px" NextPrevFormat="FullMonth">
        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
        <NextPrevStyle Font-Size="8pt" ForeColor="#333333" Font-Bold="True" VerticalAlign="Bottom" />
        <OtherMonthDayStyle ForeColor="#999999" />
        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
        <TodayDayStyle BackColor="#CCCCCC" />
    </asp:Calendar>
        <br />
        <br />
        <asp:Button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" ID="btnAddInfo" runat="server" Text="Create Test" OnClick="btnAddInfo_Click"  />
        </div>
      
        </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="teacherPageSpecificJS" runat="server">
</asp:Content>
