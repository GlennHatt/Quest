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
    <link rel='stylesheet prefetch' href='http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css'>

        <link rel="stylesheet" href="css/style.css">

    <asp:SqlDataSource ID="SQLSectionSelect" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
SELECT section_id, c.code || '-' || section_number AS section_title
  FROM section s
       JOIN class c USING (class_id)" />
    <div class="demo-card-wide mdl-shadow--3dp demo-card-square mdl-card" style="width:70%; right:-25%">
        <div style="text-align:center">
            <h1>Create A Test</h1>
        </div>
    <div style="text-align:center">
    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
    <asp:Label ID="lblSection" cssclass="mdl-textfield__input" runat="server" Text="Section: " />
    <asp:DropDownList ID="ddlSection" cssclass="mdl-textfield__input" runat="server" DataSourceID="SQLSectionSelect" DataTextField="section_title" DataValueField="section_id" />
    </div>
        </div>

    <div style="text-align:center">
    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
    <label class="mdl-textfield__label"style="bottom:0px"> Test Name:</label>
    <asp:TextBox ID="txtName" cssclass="mdl-textfield__input" runat="server" />
    </div>
        </div>

    <div style="text-align:center">
    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
    <asp:Label ID="lblTimeLimit" cssclass="mdl-textfield__input" runat="server" Text="Time Limit: " />
    <asp:DropDownList ID="ddlTimeLimit" cssclass="mdl-textfield__input" runat="server" >
        <asp:ListItem Value="5">5 minutes</asp:ListItem>
        <asp:ListItem Value="10">10 minutes</asp:ListItem>
        <asp:ListItem Value="15">15 minutes</asp:ListItem>
        <asp:ListItem Value="20">20 minutes</asp:ListItem>
        <asp:ListItem Value="25">25 minutes</asp:ListItem>
        <asp:ListItem Value="30">30 minutes</asp:ListItem>
        <asp:ListItem Value="45">45 minutes</asp:ListItem>
        <asp:ListItem Value="50" Selected="True">50 minutes</asp:ListItem>
        <asp:ListItem Value="60">1 hour</asp:ListItem>
        <asp:ListItem Value="80">1 hour 20 minutes</asp:ListItem>
        <asp:ListItem Value="0">No Time Limit</asp:ListItem>
    </asp:DropDownList>
         </div>
        </div>

<div style="text-align:center">
    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
    <asp:Label ID="lblDate" cssclass="mdl-textfield__input" runat="server" Text=" Due Date: " />
    <asp:Calendar ID="cldrTestDay" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" Width="350px" NextPrevFormat="FullMonth">
        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
        <NextPrevStyle Font-Size="8pt" ForeColor="#333333" Font-Bold="True" VerticalAlign="Bottom" />
        <OtherMonthDayStyle ForeColor="#999999" />
        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
        <TodayDayStyle BackColor="#CCCCCC" />
    </asp:Calendar>
        </div>
        </div>
        <div style="text-align:center"><asp:Button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" ID="btnAddInfo" runat="server" Text="Create Test" OnClick="btnAddInfo_Click" /></div>
        </div> 
    

    <link href="../Assets/Styles/DatePicker.css" rel="stylesheet" />
<input type="text" data-type="date" />
<div id="material-header-holder" >
  <div class="ui-datepicker-material-header">
    <div class="ui-datepicker-material-day">
    </div>
    <div class="ui-datepicker-material-date">
      <div class="ui-datepicker-material-month">
      </div>
      <div class="ui-datepicker-material-day-num">
      </div>
      <div class="ui-datepicker-material-year">
      </div>
    </div>
  </div>
</div>
        <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.js'></script>
<script src="../Assets/JS/DatePicker.js"></script>
        <script src="js/index.js"></script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="teacherPageSpecificJS" runat="server">

        <script src="../Assets/JS/DatePicker.js"></script>

</asp:Content>
