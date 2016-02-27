<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Pages/admin.master" AutoEventWireup="true" CodeBehind="dropdownList.aspx.cs" Inherits="QuestWebApp.test_pond.dropdownList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="adminBreadcrumbs" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="adminHead" runat="server">
    <link href="../Assets/Styles/dropdown.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="adminExtraReferances" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="adminWithSidebarSidebar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="adminWithSidebarBodyContent" runat="server">


    
		<div class="container">
			<h1>Material Design Dropdown Button</h1>
			<div class="button-group">
			<i id="icon"></i>
			<a id="input" href="">Choose an option</a>
			  <ul id="dropdown-menu">
			    <li><a href="#">Action</a></li>
			    <li><a href="#">Another action</a></li>
			    <li><a href="#">Something else </a></li>
			    <li><a href="#">Account Settings</a></li>
			    <li><a href="#">Help and Feedback</a></li>
			  </ul>
			</div>
		</div>



</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="adminPageSpecificJS" runat="server">

    <script src="../Assets/JS/dropdown.js"></script>

</asp:Content>
