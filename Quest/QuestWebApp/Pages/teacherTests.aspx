<%@ Page Title="Teacher | Tests" Language="C#" MasterPageFile="~/Master-Pages/teacher.master" AutoEventWireup="true" CodeBehind="teacherTests.aspx.cs" Inherits="QuestWebApp.Pages.teacherTests" %>

<asp:Content ID="Content1" ContentPlaceHolderID="teacherBreadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="teacherHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="teacherExtraReferances" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="teacherWithSidebarSidebar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="teacherWithSidebarBodyContent" runat="server">


    <div class="demo-card-wide mdl-shadow--3dp mdl-card" style="width: 70%; left: 17%">
        <div class="mdl-card__supporting-text" style="text-align: center">
            <div style="font-size: 20pt">Select a Class</div>
            <!-- Textfield with Floating DropDown for classes -->
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="text-align: left;">
                <label style="padding-left: 1%;"> My Classes:</label>
                <asp:DropDownList ID="ddlClassSelect" CssClass="mdl-textfield__input" runat="server" DataSourceID="sqlTeacherClasses" DataTextField="FULL_NAME" DataValueField="SECTION_ID" OnSelectedIndexChanged="ddlClassSelect_SelectedIndexChanged" AutoPostBack="true">
                </asp:DropDownList>
                <asp:SqlDataSource ID="sqlTeacherClasses" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
SELECT code || '-' || section_number || '/' || title as FULL_NAME, section_id
  FROM section
  JOIN class USING (class_id)
 WHERE teacher_id = :teacherID">
                    <SelectParameters>
                        <asp:SessionParameter Name="teacherID" SessionField="UserID" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
            <asp:RadioButtonList ID="rblTypeTest" CssClass="mdl-textfield_label" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="rblTypeTest_SelectedIndexChanged">
                <asp:ListItem Text="Live Tests" Value="L" />
                <asp:ListItem Text="Past Tests" Value="P" />
                <asp:ListItem Text="Draft Tests" Value="D" />
            </asp:RadioButtonList>

        </div>
    </div>
    
    <%--live card--%>
    <asp:SqlDataSource ID="sqlLiveTest" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
SELECT test_id, 'Test Name: ' || t.title AS test_title, 'Class: ' || c.title AS class_title, 
       'Due Date: ' || TO_DATE( due_date, 'DD-MON-YY') AS due_date
  FROM test t
       JOIN section    s  USING (section_id)
       JOIN class      c  USING (class_id)
 WHERE teacher_id = :p_UserID 
       AND sysdate &lt; due_date
       AND sysdate &gt; due_date - effective_date
       AND section_id = :section_id">
        <SelectParameters>
            <asp:SessionParameter Name="p_UserID" SessionField="UserID" />
            <asp:ControlParameter Name="section_id" ControlID="ddlClassSelect" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <main class="mdl-layout__content" style="width: 100%;">
        <div class="content-grid mdl-grid">
            <asp:ListView ID="lvLiveTests" runat="server" OnItemCommand="lstLiveTests_ItemCommand" DataSourceID="sqlLiveTest">
                <ItemTemplate>
                    <div class="mdl-cell mdl-cell--4-col">
                        <div class="demo-card-wide mdl-shadow--3dp mdl-card" id="cardLiveTest" runat="server">
                            <div class="mdl-card__supporting-text" style="text-align: center;">
                                <div style="font-size: 12pt">
                                    <asp:Label ID="lblTestTitle" runat="server" Text='<%#Bind("test_title") %>'> </asp:Label>
                                    <br />
                                    <br />
                                    <asp:Label ID="lblClassTitle" runat="server" Text='<%#Bind("class_title") %>'> </asp:Label>
                                    <br />
                                    <br />
                                    <asp:Label ID="lblDueDate" runat="server" Text='<%#Bind("due_date") %>'> </asp:Label>
                                </div>
                                <br />
                                <asp:Button CommandArgument='<%#Bind("test_id") %>' CommandName="EditTest" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" ForeColor="White" ID="btnResumeTest" runat="server" Text="Resume Creation" />
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </main>

    <%--Past Tests--%>
    <asp:SqlDataSource ID="sqlPastTests" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
SELECT test_id, 'Test Name: ' || t.title AS test_title, 'Class: ' || c.title AS class_title, 
       'Due Date: ' || TO_DATE( due_date, 'DD-MON-YY') AS due_date, 'Student: ' || eu.f_name || ' ' || eu.l_name as student_name
  FROM test t
       JOIN section    s  USING (section_id)
       JOIN enrollment e  USING (section_id)
       JOIN class      c  USING (class_id)
       JOIN end_user   eu ON    (eu.user_id = e.student_id)
 WHERE teacher_id = :p_UserID
       AND sysdate > due_date + 1
       AND section_id = :section_id">
        <SelectParameters>
            <asp:SessionParameter Name="p_UserID" SessionField="UserID" />
            <asp:ControlParameter ControlID="ddlClassSelect" Name="section_id" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <main class="mdl-layout__content" style="width: 100%;">
        <div class="content-grid mdl-grid">
            <asp:ListView ID="lvPastTests" runat="server" OnItemCommand="lstDraftTests_ItemCommand" DataSourceID="sqlPastTests">
                <ItemTemplate>
                    <div id="cardUser" class="mdl-cell mdl-cell--4-col">
                        <div class="demo-card-wide mdl-shadow--3dp mdl-card" id="cardPastTest" runat="server">
                            <div class="mdl-card__supporting-text" style="text-align: center;">
                                <div style="font-size: 12pt">
                                    <asp:Label ID="lblTestTitle" runat="server" Text='<%#Bind("test_title") %>'> </asp:Label>
                                    <br />
                                    <br />
                                    <asp:Label ID="lblClassTitle" runat="server" Text='<%#Bind("class_title") %>'> </asp:Label>
                                    <br />
                                    <br />
                                    <asp:Label ID="lblDueDate" runat="server" Text='<%#Bind("due_date") %>'> </asp:Label>
                                    <br />
                                    <br />
                                    <asp:Label ID="lblStudentName" runat="server" Text='<%#Bind("student_name") %>'> </asp:Label>
                                </div>
                                <br />
                                <br />
                                <asp:Button CommandArgument='<%#Bind("test_id") %>' CommandName="ViewTest" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" ForeColor="White" ID="btnViewTest" runat="server" Text="View Test" />
                                </div>
                            </div>
                        </div>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </main>


    <%--draft card--%>
    <asp:SqlDataSource ID="sqlDraftTest" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
SELECT test_id, 'Name: ' || t.title AS test_title, 'Class: ' || c.title AS class_title, 
       'Available: ' || TO_DATE( due_date - effective_date, 'DD-MON-YY') AS live_date
  FROM test t
       JOIN section    s  USING (section_id)
       JOIN class      c  USING (class_id)
 WHERE teacher_id = :p_UserID
       AND sysdate   &lt; due_date - effective_date
       AND section_id = :section_id">
        <SelectParameters>
            <asp:SessionParameter Name="p_UserID" SessionField="UserID" />
            <asp:ControlParameter ControlID="ddlClassSelect" Name="section_id" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <main class="mdl-layout__content" style="width: 100%;">
        <div class="content-grid mdl-grid">
            <asp:ListView ID="lstDraftTests" runat="server" OnItemCommand="lstDraftTests_ItemCommand" DataSourceID="sqlDraftTest">
                <ItemTemplate>
                    <div class="mdl-cell mdl-cell--4-col">
                        <div class="demo-card-wide mdl-shadow--3dp mdl-card" id="cardPendingTest" runat="server">
                            <div class="mdl-card__supporting-text" style="text-align: center;">
                                <div style="font-size: 17pt">
                                    <br />
                                    <asp:Label ID="lblTestTitle" runat="server" Text='<%#Bind("test_title") %>'> </asp:Label>
                                    <br />
                                    <br />
                                    <asp:Label ID="lblLiveDate" runat="server" Text='<%#Bind("live_date") %>'> </asp:Label>
                                    <br />
                                    <br />
                                    <br />
                                    <asp:Button CommandArgument='<%#Bind("test_id") %>' CommandName="EditTest" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" ForeColor="White" ID="btnResumeTest" runat="server" Text="Resume Creation" />
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </main>

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="teacherPageSpecificJS" runat="server">
</asp:Content>
