<%@ Page Title="Student | Teachers & Classes" Language="C#" MasterPageFile="~/Master-Pages/student.master" AutoEventWireup="true" CodeBehind="studentTeachersAndClasses.aspx.cs" Inherits="QuestWebApp.Pages.studentTeachersAndClasses" %>
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


    <style>

        ::-webkit-input-placeholder { /* WebKit, Blink, Edge */
    color:    white;
}
:-moz-placeholder { /* Mozilla Firefox 4 to 18 */
   color:    white;
   opacity:  1;
}
::-moz-placeholder { /* Mozilla Firefox 19+ */
   color:    white;
   opacity:  1;
}
:-ms-input-placeholder { /* Internet Explorer 10-11 */
   color:    white;
}
:placeholder-shown { /* Standard (https://drafts.csswg.org/selectors-4/#placeholder) */
  color:    white;
}

    </style>

    <asp:SqlDataSource ID="sqlStudentsClasses" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
SELECT s.section_id, 'Teacher: ' || eu.f_name || ' ' || eu.l_name as full_name, 'Class: ' || c.title as class_title, 'Average Grade: ' || COALESCE(CAST(ROUND((SUM(qt.points_earned)/SUM(DISTINCT t.possible_points))*100, 2) as varchar(200)), 'No Grades Yet') as average_grade
                   FROM test t
                         JOIN test_taken     tt USING (test_id)
                         JOIN question_taken qt USING (test_taken_id)
                         JOIN enrollment e  USING (enrollment_id)
                         JOIN section    s  ON (s.section_id = e.section_id)
                         JOIN class      c  USING (class_id)
                         JOIN end_user   eu   ON (s.teacher_id = eu.user_id)
                   WHERE student_id   = :UserID
                   GROUP BY s.section_id, f_name, l_name, c.title">
        <SelectParameters>
            <asp:SessionParameter Name="UserID" SessionField="UserID" />
        </SelectParameters>
    </asp:SqlDataSource>


    
    <main class="mdl-layout__content" style="width: 99%; padding-right: 1%;">
            <div class="content-grid mdl-grid" style="width: 100%;">
                <asp:ListView ID="lstStudentTests" runat="server" DataSourceID="sqlStudentsClasses">
                  <ItemTemplate >  
                        <div class="mdl-cell mdl-cell--4-col ">
                            <div class="demo-card-wide mdl-cardTakeTest mdl-shadow--3dp mdl-card" style="width:100%;">
                                <div class="mdl-card__supporting-text" style="text-align: center">
                                    <h3>
                                        <asp:Label ID="lblClass" runat="server" Text='<%# Eval("class_title") %>'></asp:Label></h3>
                                        <asp:Label ID="lblTeacher" runat="server" Text='<%# Eval("full_name") %>'></asp:Label>
                                    <h3>
                                        <asp:Label ID="lblGrade" runat="server" Text='<%# Eval("average_grade") %>'></asp:Label></h3>
                                </div>
                                <%--<div id="mailButton" class="overbox" runat="server">
                                        <div class="material-button alt-2"><span id="overbox" class="shape"><i class="material-icons" style="position: absolute;font-size: 298%;color: white;top: 31%;left: 33%;">mail</i></span></div>
                                        <div class="title">Email</div><br />
                                    <div class="input mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <asp:Label ID="lblMessageSubject" class="mdl-textfield__label" runat="server" style="bottom:0px; "> Subject: </asp:Label>
                                        <asp:TextBox ID="txtbxMessageSubject" class="mdl-textfield__input" type="text" runat="server" />
                                    </div>
                                    <div class="input">
                                        <textarea id="txtbxMessageBody" runat="server" class="mdl-textfield__input" rows="3" placeholder="Message:" style="color:white;"></textarea>
                                    </div>
                                    <div class="button" style="text-align:right; ">
                                        <button ID="btnCancelMessage" type="button" onclick="myClosure()" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored" style="background-color:rgb(76,175,80); color:white;margin-right:5%;"  >
                                        <i class="material-icons">clear</i>
                                        </button>
                                        <asp:LinkButton ID="btnSendMessage" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored" style="background-color:rgb(76,175,80); color:white;" runat="server" OnClick="btnSendMessage_Click">
                                            <i class="material-icons">done</i>
                                        </asp:LinkButton>--%>
                                    </div>
                                </div>
                  </ItemTemplate>
</asp:ListView>
                </div>
    </main>
    <br />
       <%-- <asp:GridView ID="GridView1" runat="server" DataSourceID="sqlStudentsClasses"></asp:GridView>--%>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="studentPageSpecificJS" runat="server">

    <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script src="js/modernizr.js"></script>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src="../Assets/JS/dialog.js"></script>
</asp:Content>