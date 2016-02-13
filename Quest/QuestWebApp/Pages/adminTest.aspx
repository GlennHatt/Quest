<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Pages/admin.master" AutoEventWireup="true" CodeBehind="adminTest.aspx.cs" Inherits="QuestWebApp.Pages.adminTest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="adminBreadcrumbs" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="adminHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="adminExtraReferances" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="adminWithSidebarSidebar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="adminWithSidebarBodyContent" runat="server">
        
    <!-- Card for adding a teacher -->
<style>
.demo-card-wide.mdl-card {

  margin:10%;
  width: 400px;
  height: 500px;
}

</style>

<div class="demo-card-wide mdl-card mdl-shadow--3dp">
  <div class="mdl-card__supporting-text" style="text-align:center">
    <h1>Add a Teacher </h1>
      <!-- Textfield with Floating Label for teacher First name -->
  <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
    <input class="mdl-textfield__input" type="text" id="teachFirstName">
    <label class="mdl-textfield__label" for="sample3">First Name:</label>
  </div>

      <!-- Textfield with Floating Label for teacher Last name -->
  <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
    <input class="mdl-textfield__input" type="text" id="teachLastName">
    <label class="mdl-textfield__label" for="sample3">Last Name:</label>
  </div>

      <!-- Textfield with Floating Label for teacher Email -->
  <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
    <input class="mdl-textfield__input" type="text" id="teachEmail">
    <label class="mdl-textfield__label" for="sample3">Email Address:</label>
  </div>

      <!-- Textfield with Floating Label for teacher First name -->
  <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
    <input class="mdl-textfield__input" type="text" id="teachPass">
    <label class="mdl-textfield__label" for="sample3">Password:</label>
  </div>
</div>

  <div style="text-align:right">
     <!-- Colored FAB button with ripple -->

      <asp:LinkButton ID="LinkButton1" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored" style="right: 13px; bottom: 13px" runat="server"><i class="material-icons">add</i></asp:LinkButton>

    <!--<button class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored" style="right: 13px; bottom: 13px">
    <i class="material-icons">add</i>
    </button> -->
  </div>
</div>

        <!-- Card for adding a student -->
<style>
.demo-card-wide.mdl-card {

  margin:10%;
  width: 400px;
  height: 500px;
}

</style>

<div class="demo-card-wide mdl-card mdl-shadow--3dp">
  <div class="mdl-card__supporting-text" style="text-align:center">
    <h1>Add a Student </h1>

      <!-- Textfield with Floating Label for student First name -->
  <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
    <input class="mdl-textfield__input" type="text" id="studentFirstName">
    <label class="mdl-textfield__label" for="sample3">First Name:</label>
  </div>

      <!-- Textfield with Floating Label for student Last name -->
  <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
    <input class="mdl-textfield__input" type="text" id="studentLastName">
    <label class="mdl-textfield__label" for="sample3">Last Name:</label>
  </div>

      <!-- Textfield with Floating Label for student Email -->
  <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
    <input class="mdl-textfield__input" type="text" id="studentEmail">
    <label class="mdl-textfield__label" for="sample3">Email Address:</label>
  </div>

      <!-- Textfield with Floating Label for student First name -->
  <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
    <input class="mdl-textfield__input" type="text" id="studentPass">
    <label class="mdl-textfield__label" for="sample3">Password:</label>
  </div>
</div>

  <div style="text-align:right">
     <!-- Colored FAB button with ripple -->
    <button class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored">
    <i class="material-icons">add</i>
    </button>
  </div>
</div>

    <!-- Card for adding a class -->
<style>
.demo-card-wide.mdl-card-addClass {

  margin:10%;
  width: 400px;
  height: 400px;
}

</style>

<div class="demo-card-wide mdl-card-addClass mdl-shadow--3dp">
  <div class="mdl-card__supporting-text" style="text-align:center">
    <h1>Add a Class </h1>
      <!-- Textfield with Floating Label for Title -->
  <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
    <input class="mdl-textfield__input" type="text" id="classTitle">
    <label class="mdl-textfield__label" for="sample3">Title:</label>
  </div>

      <!-- Textfield with Floating Label for Course Number -->
  <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
    <input class="mdl-textfield__input" type="text" id="courseNumber">
    <label class="mdl-textfield__label" for="sample3">Course Number:</label>
  </div>

  <div style="text-align:right">
     <!-- Colored FAB button with ripple -->
    <button class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored">
    <i class="material-icons">add</i>
    </button>
  </div>
</div>
    </div>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="adminPageSpecificJS" runat="server">
</asp:Content>
