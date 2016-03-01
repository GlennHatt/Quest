<%@ Page Title="Student | Teachers & Classes" Language="C#" MasterPageFile="~/Master-Pages/student.master" AutoEventWireup="true" CodeBehind="studentTeachersandClasses.aspx.cs" Inherits="QuestWebApp.Pages.studentTeachersandClasses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="studentBreadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="studentHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="studentExtraReferances" runat="server">

    <script src="http://s.codepen.io/assets/libs/modernizr.js" type="text/javascript"></script>
    <link href="../Assets/Styles/dialog.css" rel="stylesheet" />


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="studentSidebar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="studentWithSidebarBodyContent" runat="server">


    <main class="mdl-layout__content">
        <div class="content-grid mdl-grid">
            <div class="mdl-cell mdl-cell--4-col ">
                <!-- Card for Creating a test -->


                <div class="demo-card-wide mdl-cardTakeTest mdl-shadow--3dp mdl-card">
                    <div class="mdl-card__supporting-text" style="text-align: center">
                        <h3><asp:Label ID="lblClass" runat="server" Text="Class"></asp:Label></h3>
                        <h3><asp:Label ID="lblTeacher" runat="server" Text="Teacher"></asp:Label></h3>
                        <p>Current Grade:<asp:Label ID="lblcurGrade" runat="server" Text=" B+(89%)"></asp:Label></p>
                    </div>
                    <div style="text-align: right">
                        <asp:LinkButton ID="btnCreateTest" runat="server" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect" Style="background-color: #EE7600; color: white; left: -13px; bottom: 10px;" OnClick="btnCreateTest_Click">
                            <i class="material-icons">mail</i>
                        </asp:LinkButton>
                        <div class="btn-wrapper">
					<a href="#"type="button" class="btn" id="submit">Add
   					</a>
					<a href="#" class="btn" id="cancel" style="color:black">Cancel</a>
				</div>
                    </div>
                </div>
            </div>
        </div>
    </main>



    <div class="protect">
		<div class="fab">
			<svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="24px" height="24px" viewBox="-129 130.5 24 24">
				<path d="M-112 133.5h-10c-1.1 0-2 0.9-2 2l0 16l7-3l7 3v-16C-110 134.4-110.9 133.5-112 133.5z M-112 148.5l-5-2.2l-5 2.2v-13h10 V148.5z M-118 144.9h2v-3h3v-2h-3v-3h-2v3h-3v2h3V144.9z" />
			</svg>

			<div class='cntt-wrapper'>
				<div id="fab-hdr">
					<h1>FAB to Modal Window</h1>
				</div>

				

					<div class="material-input">
						<input type="text" >
						<label>Name</label> <span></span>
					</div>

					<div class="material-input">
						<input type="text" >
						<label>Email</label> <span></span>
					</div>

					<div class="material-input">
						<input type="text" >
						<label>Site</label> <span></span>
					</div>

				

				<!--<div class="btn-wrapper">
					<a href="#"type="button" class="btn" id="submit">Add
   					</a>
					<a href="#" class="btn" id="cancel" style="color:black">Cancel</a>
				</div> -->

			</div>
		</div>
	</div>


</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="studentPageSpecificJS" runat="server">
    
    <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script src="js/modernizr.js"></script>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src="../Assets/JS/dialog.js"></script>

</asp:Content>
