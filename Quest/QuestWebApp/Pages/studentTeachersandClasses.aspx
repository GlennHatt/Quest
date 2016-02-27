<%@ Page Title="Student | Teachers & Classes" Language="C#" MasterPageFile="~/Master-Pages/student.master" AutoEventWireup="true" CodeBehind="studentTeachersandClasses.aspx.cs" Inherits="QuestWebApp.Pages.studentTeachersandClasses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="studentBreadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="studentHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="studentExtraReferances" runat="server">

    <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/dialog-polyfill/0.4.2/dialog-polyfill.min.css'/>
    <link rel='stylesheet prefetch' href='https://storage.googleapis.com/code.getmdl.io/1.0.6/material.indigo-pink.min.css'/>

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
                        <asp:LinkButton ID="btnCreateTest" runat="server" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect" Style="background-color: #EE7600; color: white; left: -13px; bottom: 10px;">
                            <i class="material-icons">mail</i>
                        </asp:LinkButton>
                    </div>
                </div>
            </div>

            
        </div>
    </main>


</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="studentPageSpecificJS" runat="server">
    <script src='https://cdnjs.cloudflare.com/ajax/libs/dialog-polyfill/0.4.2/dialog-polyfill.min.js'></script>
    <script src='https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.js'></script>

</asp:Content>
