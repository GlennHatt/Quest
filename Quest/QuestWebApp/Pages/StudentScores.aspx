﻿<%@ Page Title="Student | Scores" Language="C#" MasterPageFile="~/Master-Pages/student.master" AutoEventWireup="true" CodeBehind="studentScores.aspx.cs" Inherits="QuestWebApp.Pages.studentScores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="studentbreadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="studenthead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="studentextraReferances" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="studentSidebar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="studentwithSidebarBodyContent" runat="server">
     <main class="mdl-layout__content" style="width: 99%; padding-right: 1%;">
        <div class="content-grid mdl-grid" style="width: 100%;">
            <div class="mdl-cell mdl-cell--4-col">
                 <div class="demo-card-wide mdl-card-pickClass mdl-shadow--3dp demo-card-square mdl-card">
                    <div class="mdl-card__supporting-text" style="text-align: center">

                <h1>Classes</h1>
                        <!-- Textfield with Floating DropDown for user type -->
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <asp:DropDownList class="mdl-textfield__input" ID="ddlStudentClasses" runat="server" AutoPostBack="true" DataSourceID="classesDropDown" DataTextField="students_classes" DataValueField="SECTION_ID" OnSelectedIndexChanged="ddlStudentClasses_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="classesDropDown" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
                                 SELECT section_id, c.code || '-' || s.section_number || '/' || c.title as students_classes
                                   FROM enrollment e
                                        JOIN section s USING (section_id)
                                        JOIN class c   USING (class_id)
                                  WHERE e.student_id = :UserID
                                 ORDER BY c.code asc">
                                <SelectParameters>
                                    <asp:SessionParameter Name="UserID" SessionField="UserID" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </div>

            <asp:SqlDataSource ID="testInfo" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
                   SELECT 'Name: ' || title as title, 'Due Date: ' || due_date as due_date, 'Grade: ' || grade || '(' || ROUND(points_earned/possible_points*100, 2) || '%)' as score
                   FROM test t
                         JOIN test_taken tt USING (test_id)
                         JOIN enrollment e  USING (enrollment_id)
                   WHERE student_id   = :UserID
                   AND e.section_id   = :SectonID">
                                <SelectParameters>
                                    <asp:SessionParameter Name="UserID" SessionField="UserID" />  
                                    <asp:ControlParameter ControlID="ddlStudentClasses" Name="SectonID" PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
             

            <div class="mdl-cell mdl-cell--4-col">
            <div class="demo-card-wide mdl-card-testAverage mdl-shadow--3dp demo-card-square mdl-card">
                <div class="mdl-card__supporting-text" style="text-align: center">
                        <div style="font-size:30pt">Class Average</div>
                        <br /> <br /> <br /> <br />
                        <asp:Label runat="server" ID="lbltestAverage" Font-Size="30pt" Text=""> </asp:Label>
                    </div>
                <asp:SqlDataSource ID="sqlAverageGrade" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
                 SELECT ROUND(SUM(qt.points_earned)/SUM(t.possible_points)*100, 2) || '%' as class_grade
                   FROM test t
                         JOIN test_taken     tt USING (test_id)
                         JOIN question_taken qt USING (test_taken_id)
                         JOIN enrollment e  USING (enrollment_id)
                         JOIN section    s  ON (s.section_id = e.section_id)
                         JOIN class      c  USING (class_id)
                         JOIN end_user   eu   ON (s.teacher_id = eu.user_id)
                   WHERE student_id   = :UserID 
                     AND s.section_id = :SectionID">
                    <SelectParameters>
                        <asp:SessionParameter Name="UserID" SessionField="UserID" />
                        <asp:ControlParameter ControlID="ddlStudentClasses" Name="SectionID" PropertyName="SelectedValue" />
                    </SelectParameters>
                 </asp:SqlDataSource>
                 </div>

                </div>

            <asp:ListView ID="lstTestInfo" runat="server" DataSourceID="testInfo">
                    <ItemTemplate>
                        <div class="mdl-cell mdl-cell--4-col">
                            <div class="demo-card-wide mdl-card-TestScore mdl-shadow--3dp demo-card-square mdl-card">
                                <div class="mdl-card__supporting-text" style="text-align: center; font-size:18pt">
                                    <br />
                                    <br />
                                    <asp:Label runat="server" ID="lbltestName" Text='<%# Eval("title") %>'> </asp:Label>
                                    <br />
                                    <br />
                                    <asp:Label runat="server" ID="lblScore" Text='<%# Eval("due_date") %>'> </asp:Label>
                                    <br />
                                    <br />
                                    <asp:Label runat="server" ID="lbScore" Text='<%# Eval("score") %>'> </asp:Label>
                                    <%--<div style="margin-right: -430px; margin-top: -21px;">--%>
                                </div>
                            </div>
                        </div>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </main>

            
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="studentpageSpecificJS" runat="server">
</asp:Content>