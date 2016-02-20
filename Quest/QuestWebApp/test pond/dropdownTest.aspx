<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownTest.aspx.cs" Inherits="QuestWebApp.test_pond.dropdownTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    
    <link href="../Assets/Styles/dropdown.css" rel="stylesheet" />
   <link rel='stylesheet prefetch' href='http://fian.my.id/marka/static/marka/css/marka.css'/>

</head>
<body>

    <form id="form1" runat="server">
    <div>
    


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


    </div>
    </form>
</body>

    
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src='http://fian.my.id/marka/static/marka/js/marka.js'></script>
    <script src="../Assets/JS/dropdown.js"></script>
</html>
