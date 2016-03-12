<%@ Page Title="Student | Scores " Language="C#" MasterPageFile="~/Master-Pages/withSidebar.master" AutoEventWireup="true" CodeBehind="studentScores.aspx.cs" Inherits="QuestWebApp.Pages.StudentScores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="breadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="extraReferances" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="withSidebarSidebar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="withSidebarBodyContent" runat="server">
    <main class="mdl-layout__content">
        <div class="content-grid mdl-grid">
            <div class="mdl-cell mdl-cell--6-col">
                <div class="demo-card-wide mdl-card-pickClass mdl-shadow--3dp demo-card-square mdl-card">
                    <div class="mdl-card__supporting-text" style="text-align: center">
                        <h1>Classes</h1>
                        <!-- Textfield with Floating DropDown for user type -->
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <asp:DropDownList class="mdl-textfield__input" ID="ddlStudentClasses" runat="server" DataSourceID="classesDropDown" DataTextField="TITLE" DataValueField="TITLE"></asp:DropDownList>
                            <asp:SqlDataSource ID="classesDropDown" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="select title from class"></asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </div>
             <div class="mdl-cell mdl-cell--6-col">
            <div class="demo-card-wide mdl-card-testAverage mdl-shadow--3dp demo-card-square mdl-card">
                    <div class="mdl-card__supporting-text" style="text-align: center">
                        <h1>Class Average</h1>
                        <asp:Label runat="server" ID="lbltestAverage"> (Class Average) </asp:Label>
                    </div>
                </div>
                 </div>
                         <div class="mdl-cell mdl-cell--6-col">
            <div class="demo-card-wide mdl-card-TestScore mdl-shadow--3dp demo-card-square mdl-card">
                    <div class="mdl-card__supporting-text" style="text-align: center">
                        <asp:Label runat="server" ID="lbltestName"> <h3>(Test Name)</h3>  </asp:Label>
                        <asp:Label runat="server" ID="lbScore"> <h3>(Test Score)</h3> </asp:Label>
                        <asp:Label runat="server" ID="lblDateSub"> <h3>(Date Submitted)</h3> </asp:Label>
                        <div style="margin-right: -430px; margin-top: -21px;">
                        <asp:LinkButton ID="btnContactTeacher" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored" runat="server">
                            <i class="material-icons" style="color:white">mail</i>
                        </asp:LinkButton>
                            </div>
                    </div>
                </div>
                 </div>
        </div>
    </main>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="pageSpecificJS" runat="server">
</asp:Content>
