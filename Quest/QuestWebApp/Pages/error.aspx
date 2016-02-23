<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Pages/withoutSidebar.master" AutoEventWireup="true" CodeBehind="error.aspx.cs" Inherits="QuestWebApp.Pages.error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="withoutSidebarBreadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="withoutSidebarHead" runat="server">
    <title>Oops!</title>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="withoutSidebarExtraReferances" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="withoutSidebarHeadBodyContent" runat="server">

    <main class="mdl-layout__content" style="width: 99%; padding-right: 1%;">
        <div class="content-grid mdl-grid" style="width: 100%;">

            <div class="mdl-cell mdl-cell--12-col">


                <div class="mdl-cell mdl-cell--6-col" id="testAlertTemplate" runat="server">
                
                <!-- Card for When a Test is Due -->

                <style>
                    /*
.demo-card-wide.mdl-card {

  margin:10%;
  width: 400px;
  height: 200px;
} */

                    .testAlert {
                        font-size: 590%;
                        line-height: 130%;
                        color: #EE7600;
                        margin-bottom: -7%;
                    }
                </style>

                <div class="mdl-card mdl-shadow--3dp  demo-card-square">
                    <div class="mdl-card__supporting-text " style="text-align: center">
                        <i class="material-icons testAlert">sentiment_dissatisfied</i>
                        <div style="font-size: 300%; margin-bottom: 7%; margin-top: 5%;">Oh no!</div>
                        You've wandered off the path, hurry and get back to safety.
                    </div>
                    <div style="text-align: right">
                        <br />
                        <asp:LinkButton ID="btnTaketest" runat="server" class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" Style="background-color: #EE7600; color: white; left: -13px; bottom: 10px;">
                            Back to Camp
                        </asp:LinkButton>
                    </div>
                </div>
            </div>




            </div>

            </div>
        </main>


</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="withoutSidebarPageSpecificJS" runat="server">





</asp:Content>
