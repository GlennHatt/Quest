<%@ Page Title=" Teacher | Tests" Language="C#" MasterPageFile="~/Master-Pages/teacher.master" AutoEventWireup="true" CodeBehind="teacherTests.aspx.cs" Inherits="QuestWebApp.Pages.teacherTests" %>
<asp:Content ID="Content1" ContentPlaceHolderID="teacherBreadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="teacherHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="teacherExtraReferances" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="teacherWithSidebarSidebar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="teacherWithSidebarBodyContent" runat="server">
    

    <div class="demo-card-wide mdl-shadow--3dp mdl-card" style="width: 70%; left: 17%">
        <div class="mdl-card__supporting-text" style="text-align: center">
           <div style="font-size:20pt">Select a Class</div>
            <!-- Textfield with Floating DropDown for classes -->
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="text-align: center;">
                <label style="padding-left: 1%;">Classes:</label>
                <asp:DropDownList ID="ddlClassSelect" class="mdl-textfield__input" runat="server"> 
                </asp:DropDownList>
                </div> 
            <asp:RadioButtonList ID="rblTypeTest" CssClass="mdl-textfield_label" runat="server" RepeatDirection="Horizontal" AutoPostBack="true">
                <asp:ListItem Text="Live Test" Value="L" />
                <asp:ListItem Text="Past Test" Value="P" />
                <asp:ListItem Text="Draft Test" Value="D" />
            </asp:RadioButtonList>

            </div>
            </div>

    <%--old card--%>
    <main class="mdl-layout__content" style="width:100%;">
        <div class="content-grid mdl-grid">
            <div id="cardUser" class="mdl-cell mdl-cell--4-col">
    <div class="demo-card-wide mdl-shadow--3dp mdl-card">
        <div class="mdl-card__supporting-text" style="text-align: center;">
            <div style ="font-size:17pt">
            <asp:Label ID="lblTestName" runat="server" Text="(Test Name)"> </asp:Label>
                <br />
                <br />
            <asp:Label ID="lblDate" runat="server" Text="(Due Date)"> </asp:Label>
            </div>
            <br />
     <div>Select a Student</div>
            <!-- Textfield with Floating DropDown for students -->
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="text-align: left;">
                <label style="padding-left: 1%;">Students:</label>
                <asp:DropDownList ID="ddlStudentsSelect" class="mdl-textfield__input" runat="server">
                </asp:DropDownList>
            </div>
            <br />
            <asp:Button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" ForeColor="White" ID="btnViewTest" runat="server" Text="View Test"/>
    </div>
        </div>
                </div>
            </div>
        </main>

    <%--live card--%>
    <main class="mdl-layout__content" style="width:100%;">
        <div class="content-grid mdl-grid">
            <div id="cardLiveTest" class="mdl-cell mdl-cell--4-col">
              <div class="demo-card-wide mdl-shadow--3dp mdl-card">
        <div class="mdl-card__supporting-text" style="text-align: center;">
            <div style ="font-size:17pt">
            <asp:Label ID="lblTestName2" runat="server" Text="(Test Name)"> </asp:Label>
                <br />
                <br />
            <asp:Label ID="lblStudent" runat="server" Text="(Student Name)"> </asp:Label>
                 <br />
                <br />
            <asp:Label ID="lblPendingScore" runat="server" Text="(Pending Score)"> </asp:Label>
            </div>
            <br />
            <asp:Button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" ForeColor="White" ID="btnViewTest2" runat="server" Text="View Test"/>
    </div>
        </div>  
            
            </div>
            </div>
        </main>

     <%--pending card--%>
    <main class="mdl-layout__content" style="width:100%;">
        <div class="content-grid mdl-grid">
            <div id="cardPendingTest" class="mdl-cell mdl-cell--4-col">
              <div class="demo-card-wide mdl-shadow--3dp mdl-card">
        <div class="mdl-card__supporting-text" style="text-align: center;">
            <div style ="font-size:17pt">
                <br />
            <asp:Label ID="Label1" runat="server" Text="(Test Name)"> </asp:Label>
                <br />
                <br />
                <br />
                <br />
                <br />
            <asp:Button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" ForeColor="White" ID="btnResumeTest" runat="server" Text="Resume Creation"/>
    </div>
            </div>
        </div>  
            
            </div>
            </div>
        </main>

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="teacherPageSpecificJS" runat="server">
</asp:Content>
