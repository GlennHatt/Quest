<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestCreation.aspx.cs" Inherits="QuestWebApp.Pages.TestCreation" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <div id="divErrorMessage" runat = "server" class="diverrormessage"> </div>

        <asp:Repeater  ID="rptTBs"  runat="server" >
        <ItemTemplate>
            <asp:TextBox ID="tb" runat="server"   />
            <asp:CheckBox ID="chk" runat="server" /> 
            <asp:DropDownList ID="drp" runat="server" >
                <asp:ListItem>One</asp:ListItem> 
                <asp:ListItem>Two</asp:ListItem> 
                <asp:ListItem>Three</asp:ListItem> 
            </asp:DropDownList>
            <br /> 
        </ItemTemplate> 
    </asp:Repeater>
      
    <asp:Button ID="btnAdd" runat="server" Text="Add a TextBox" OnClick="btnAdd_Click" />



    <div>
        

        <asp:Label ID="lblSectionID" runat="server" Text="Please choose Section ID: "></asp:Label>
        <asp:DropDownList ID="ddlSectionId" runat="server">
            <asp:ListItem Value="1">BA 403-2</asp:ListItem>
            <asp:ListItem>SP 410-1</asp:ListItem>
            <asp:ListItem>BA 101-5</asp:ListItem>
            <asp:ListItem>SP 101-A2</asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:Label ID="lblTestName" runat="server" Text="Name this test: "></asp:Label>
        <asp:TextBox ID="txtTestName" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="lblTimeLimit" runat="server" Text="Time Limit for test: "></asp:Label>
        <asp:DropDownList ID="ddlTimeLimit" runat="server">
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
        <asp:Label ID="lblDatePicker" runat="server" Text="When will this test be taken: "></asp:Label>
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
        <asp:Button ID="btnCheckChoices" runat="server" Text="Review Choices" OnClick="btnCheckChoices_Click" />
        <br />
        <asp:Label ID="lblCheckChoices" runat="server" Text=""></asp:Label>
        <br />
        <br />
    
        <asp:Label ID="lblQuestionChoice" runat="server" AutoPostBack="true" Text="Choose a question type: "></asp:Label>
    
        <asp:RadioButtonList ID="rblChooseQuestion" runat="server">
            <asp:ListItem>Multiple Choice</asp:ListItem>
            <asp:ListItem>True False</asp:ListItem>
            <asp:ListItem>Short Answer</asp:ListItem>
            <asp:ListItem>Matching</asp:ListItem>
            <asp:ListItem>Essay</asp:ListItem>
        </asp:RadioButtonList>
    
        <asp:Label ID="lblPointValue" runat="server" Text="Point Value: "></asp:Label>
        <asp:DropDownList ID="ddlPointValue" runat="server">
            <asp:ListItem Value="1"></asp:ListItem>
            <asp:ListItem Value="2"></asp:ListItem>
            <asp:ListItem Value="3"></asp:ListItem>
            <asp:ListItem Value="4"></asp:ListItem>
            <asp:ListItem Value="5"></asp:ListItem>
            <asp:ListItem Value="6"></asp:ListItem>
            <asp:ListItem Value="7"></asp:ListItem>
            <asp:ListItem Value="8"></asp:ListItem>
            <asp:ListItem Value="9"></asp:ListItem>
            <asp:ListItem Value="10"></asp:ListItem>
        </asp:DropDownList>
        <br />
    
        <asp:Button ID="btnChooseQuestion" runat="server" Text="Add Question" OnClick="btnChooseQuestion_Click" Width="120px" />
    
        <asp:Label ID="lblWarning" runat="server" Text=""></asp:Label>
    
        <br />
        <asp:Button ID="btnSaveQuestion" runat="server" Text="Save Question" Width="120px" OnClick="btnSaveQuestion_Click" />
        <br />
        <br />
   <!-- <asp:Label ID="lblMultiChoice" runat="server" Text="Multiple Choice"></asp:Label>
    
        <br />
        <asp:Label ID="lblMCQuestion" runat="server" Text="Question: "></asp:Label>
    
        <asp:TextBox ID="txtMCQuestion" runat="server" Width="200px"></asp:TextBox>
    
        <br />
        <asp:Label ID="lblMCAnswers" runat="server" Text="Choices:"></asp:Label>
    
        <br />
        <asp:RadioButton ID="rdbMC1" runat="server" GroupName ="MutlipleChoice" Checked="True"/>
        <asp:TextBox ID="txtMC1" runat="server"></asp:TextBox>
        <br />
        <asp:RadioButton ID="rdbMC2" runat="server" GroupName ="MutlipleChoice"/>
        <asp:TextBox ID="txtMC2" runat="server"></asp:TextBox>
        <br />
        <asp:RadioButton ID="rdbMC3" runat="server" GroupName ="MutlipleChoice"/>
        <asp:TextBox ID="txtMC3" runat="server"></asp:TextBox>
        <br />
        <asp:RadioButton ID="rdbMC4" runat="server" GroupName ="MutlipleChoice"/>
        <asp:TextBox ID="txtMC4" runat="server"></asp:TextBox>
    -->
        <br />
        <br />
        <asp:Label ID="lblTrueFalse" runat="server" Text="True/False"></asp:Label>
    
        <br />
        <asp:Label ID="lblTFQuestion" runat="server" Text="Question: "></asp:Label>
    
        <asp:TextBox ID="txtTFQuestion" runat="server"></asp:TextBox>
    
        <asp:RadioButtonList ID="rblTrueFalse" runat="server">
            <asp:ListItem Selected="True">True</asp:ListItem>
            <asp:ListItem>False</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <asp:Label ID="lblFillBlank" runat="server" Text="Fill in the Blank"></asp:Label>
    
        <br />
        <asp:Label ID="lblFBStatementBegin" runat="server" Text="Before Blank: "></asp:Label>
        <asp:TextBox ID="txtFBStatementBegin" runat="server" Width="184px"></asp:TextBox>
        <br />
        <asp:Label ID="lblFBAnswer" runat="server" Text="Word/Statement left out: "></asp:Label>
        <asp:TextBox ID="txtFBAnswer" runat="server" Width="115px"></asp:TextBox>
        <br />
        <asp:Label ID="lblFBStatementEnd" runat="server" Text="After Blank: "></asp:Label>
        <asp:TextBox ID="txtFBStatementEnd" runat="server" Width="194px"></asp:TextBox>
    
        <br />
        <br />
    
    </div>
        <asp:Label ID="lblMatching" runat="server" Text="Matching"></asp:Label>
        <br />
        <asp:Label ID="lblSectionName" runat="server" Text="Section:"></asp:Label>
        &nbsp;<asp:TextBox ID="txtSectionName" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="lblQuestion" runat="server" Text="Question"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Label ID="lblAnswer" runat="server" Text="Answer"></asp:Label>
        <br />
        <asp:TextBox ID="txtMQuestion1" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtMAnswer1" runat="server"></asp:TextBox>
        <br />
        <asp:TextBox ID="txtMQuestion2" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtMAnswer2" runat="server"></asp:TextBox>
        <br />
        <asp:TextBox ID="txtMQuestion3" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtMAnswer3" runat="server"></asp:TextBox>
        <br />
        <asp:TextBox ID="txtMQuestion4" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtMAnswer4" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="lblEssay" runat="server" Text="Essay"></asp:Label>
        <br />
        <asp:Label ID="lblEQuestion" runat="server" Text="Question: "></asp:Label>
        <asp:TextBox ID="txtEQuestion" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="AnswerBank" runat="server" Text="All questions added     "></asp:Label>
        <asp:Button ID="displayQuestions" runat="server" Text="Show" OnClick="displayQuestions_Click" />
        <br />
        <asp:TextBox ID="txtTest" runat="server" Height="191px" Width="609px" TextMode="MultiLine"></asp:TextBox>
    </form>
</body>
</html>
