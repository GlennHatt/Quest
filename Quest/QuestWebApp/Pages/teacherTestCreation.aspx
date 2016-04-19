<%@ Page Title="Teacher | Test Creation" Language="C#" MasterPageFile="~/Master-Pages/teacher.master" AutoEventWireup="true" CodeBehind="teacherTestCreation.aspx.cs" Inherits="QuestWebApp.Pages.teacherTestCreation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="teacherBreadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="teacherHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="teacherExtraReferances" runat="server">

   <%-- <script src="../Assets/JS/Datepicker/moment.js"></script>
    <script src="../Assets/JS/Datepicker/jquery-2.1.3.min.js"></script>
    <script src="../Assets/JS/Datepicker/knockout-3.4.0.js"></script>
    <script src="../Assets/JS/Datepicker/material.datepicker.js"></script>
    <link href="../Assets/Styles/material.datepicker.css" rel="stylesheet" />--%>

    <link href="../Assets/Styles/datepicker.css" rel="stylesheet" />




</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="teacherWithSidebarSidebar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="teacherWithSidebarBodyContent" runat="server">
    

    <asp:SqlDataSource ID="SQLSectionSelect" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
SELECT section_id, c.title || '/' || c.code || '-' || section_number AS section_title
  FROM section s
       JOIN class c USING (class_id)"></asp:SqlDataSource>
 <!--Commented out for test (it selects only sections that pertain to that teacher)
     WHERE teacher_id = :session_id">
        <SelectParameters>
            <asp:SessionParameter Name="session_id" SessionField="UserID" />
        </SelectParameters>
    </asp:SqlDataSource> -->
    <div class="demo-card-wide mdl-shadow--3dp demo-card-square mdl-card" style="width:70%; right:-16%; height:1200px;">
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
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter a Test Name" ControlToValidate="txtName" SetFocusOnError="True" ValidationGroup="nameValidator" ForeColor="Red"></asp:RequiredFieldValidator>
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
    <asp:Label ID="lblDate" cssclass="mdl-textfield__input" runat="server" Text=" Test Start Date: " />
    <%--<asp:Calendar ID="cldrTestDay" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" Width="350px" NextPrevFormat="FullMonth">
        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
        <NextPrevStyle Font-Size="8pt" ForeColor="#333333" Font-Bold="True" VerticalAlign="Bottom" />
        <OtherMonthDayStyle ForeColor="#999999" />
        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
        <TodayDayStyle BackColor="#CCCCCC" />
    </asp:Calendar>--%>
        </div>
        </div>
        
        
    
        <!-- start datepicker -->
        <%--<input id="field" style="font-size:16px;height:30px;border-radius:2px;border:1 solid gray;padding:0px 10px; display:none;" ><br><br>
		<script>
			var options = {};
			$('#field').datepicker(options);
		</script>--%>
        <div class="searchbox" >
<div class="searchslide search1 on">
<div id="search" class="bbox" >
<fieldset>
<div id="datepickbox1" class="datepickbox"><input type="text" id="indnap" name="h" title=""  value="" class="searchinput datepicker" placeholder="When?" runat="server"/></div>
</fieldset>
</div>
<div id="zebracontainer1" class="zbc">
</div>
</div><!--/searchslide-->
</div><!--/searchbox-->

        <!-- end datepicker -->

        <div style="text-align:center">
    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
        <asp:Label ID="Label1" cssclass="mdl-textfield__input" runat="server" Text=" Test Start Time: " />
        
        <asp:DropDownList ID="ddlTime" runat="server" cssclass="mdl-textfield__input">
        </asp:DropDownList>
            </div>
            </div>

        <div style="text-align:center">
    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
        <asp:Label ID="Label2" cssclass="mdl-textfield__input" runat="server" Text=" Allow student to save test: " />
        
        <asp:DropDownList ID="ddlSavable" runat="server" cssclass="mdl-textfield__input">
            <asp:ListItem Selected="True" Value="Y">Yes</asp:ListItem>
            <asp:ListItem Value="N">No</asp:ListItem>
        </asp:DropDownList>
            </div>
            </div>
    <div style="text-align:center"><asp:Button CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" ID="btnAddInfo" runat="server" Text="Create Test" OnClick="btnAddInfo_Click" ForeColor="White" ValidationGroup="nameValidator" /></div>
    </div> 
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="teacherPageSpecificJS" runat="server">
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src="../Assets/JS/Datepicker/datepicker.js"></script>
    
</asp:Content>
