﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Pages/withoutSidebar.master" AutoEventWireup="true" CodeBehind="error.aspx.cs" Inherits="QuestWebApp.Pages.error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="withoutSidebarBreadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="withoutSidebarHead" runat="server">
    <title>Oops!</title>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="withoutSidebarExtraReferances" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="withoutSidebarHeadBodyContent" runat="server">



    <style>

          .demo-card-wide.mdl-card {
    width: 58%;
    margin: 0 auto;
    margin-top:10%;
  }
  .demo-card-wide > .mdl-card__title {
    color: #fff;
    height: 176px;
  }
  .demo-card-wide > .mdl-card__menu {
    color: #fff;
  }
    </style>
                <style>

                    .testAlert {
                        font-size: 590%;
                        line-height: 130%;
                        color: #EE7600;
                        margin-bottom: -7%;
                    }
                </style>

                <div class="mdl-card mdl-shadow--2dp demo-card-wide ">
                    <div class="mdl-card__supporting-text " style="text-align: center">
                        <i class="material-icons testAlert">sentiment_dissatisfied</i>
                        <div style="font-size: 300%; margin-bottom: 7%; margin-top: 5%;">Oh no!</div>
                        You've wandered off the path, hurry and get back to safety.
                    </div>
                    <div style="text-align: right">
                        <br />
                        <asp:LinkButton ID="btnTaketest" runat="server" class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" Style="background-color: #EE7600; color: white; left: -13px; bottom: 10px;">
                            Back to Home
                        </asp:LinkButton>
                    </div>
                </div>
            


     <!-- Wide card with share menu button 
    <div class="mdl-card mdl-shadow--2dp demo-card-wide">
      <div class="mdl-card__title">
          <i class="material-icons testAlert">sentiment_dissatisfied</i>
        <h2 class="mdl-card__title-text">Oh no!</h2>
      </div>
      <div class="mdl-card__supporting-text">
        You've wandered off the path, hurry and get back to safety.
      </div>
      <div class="mdl-card__actions mdl-card--border">
        <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
          Get Started
        </a>
      </div>
      <div class="mdl-card__menu">
        <button class="mdl-button mdl-button--icon mdl-js-button mdl-js-ripple-effect">
          <i class="material-icons">share</i>
        </button>
      </div>
    </div> -->
            


</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="withoutSidebarPageSpecificJS" runat="server">





</asp:Content>