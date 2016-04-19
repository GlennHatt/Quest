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
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="text-align: center;">
                <label style="padding-left: 1%;">Classes:</label>
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
                <asp:ListItem Text="Live Test" Value="L" />
                <asp:ListItem Text="Past Test" Value="P" />
                <asp:ListItem Text="Draft Test" Value="D" />
            </asp:RadioButtonList>

        </div>
    </div>

    <%--old card--%>
    <main class="mdl-layout__content" style="width: 100%;">
        <div class="content-grid mdl-grid">
            <div id="cardUser" class="mdl-cell mdl-cell--4-col">
                <div class="demo-card-wide mdl-shadow--3dp mdl-card" id="cardPastTest" runat="server">
                    <div class="mdl-card__supporting-text" style="text-align: center;">
                        <div style="font-size: 17pt">
                            <asp:Label ID="lblTestName" runat="server" Text="(Test Name)"> </asp:Label>
                            <br />
                            <br />
                            <asp:Label ID="lblDate" runat="server" Text="(Due Date)"> </asp:Label>
                        </div>
                        <br />
                        <div>Select a Student</div>
                        <!-- Textfield with Floating DropDown for students -->
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="text-align: left;">
                            <label style="padding-left: 1%;">Students:</label>
                            <asp:DropDownList ID="ddlStudentsSelect" CssClass="mdl-textfield__input" runat="server" DataSourceID="sqlSectionStudents" DataTextField="FULL_NAME" DataValueField="USER_ID">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sqlSectionStudents" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
SELECT f_name || ' ' || l_name as full_name, user_id
  FROM section
  JOIN enrollment USING (section_id)
  JOIN end_user   ON (student_id = user_id)
 WHERE section_id = :section_id">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlClassSelect" Name="section_id" PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                        <br />
                        <asp:Button CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" ForeColor="White" ID="btnViewTest" runat="server" Text="View Test" />
                    </div>
                </div>
            </div>
        </div>
    </main>

    <%--live card--%>
    <main class="mdl-layout__content" style="width: 100%;">
        <div class="content-grid mdl-grid">
            <div class="mdl-cell mdl-cell--4-col">
                <div class="demo-card-wide mdl-shadow--3dp mdl-card" id="cardLiveTest" runat="server">
                    <div class="mdl-card__supporting-text" style="text-align: center;">
                        <div style="font-size: 17pt">
                            <asp:Label ID="lblTestName2" runat="server" Text="(Test Name)"> </asp:Label>
                            <br />
                            <br />
                            <asp:Label ID="lblStudent" runat="server" Text="(Student Name)"> </asp:Label>
                            <br />
                            <br />
                            <asp:Label ID="lblPendingScore" runat="server" Text="(Pending Score)"> </asp:Label>
                        </div>
                        <br />
                        <asp:Button CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" ForeColor="White" ID="btnViewTest2" runat="server" Text="View Test" />
                    </div>
                </div>
                <asp:SqlDataSource ID="sqlPastTests" runat="server"></asp:SqlDataSource>
            </div>
        </div>
    </main>

    <%--pending card--%>
    <asp:SqlDataSource ID="sqlDraftTest" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
SELECT test_id, title
  FROM test
       JOIN section USING (section_id)
 WHERE teacher_id = :p_TeacherID
       AND sysdate &lt; due_date - effective_date">
        <SelectParameters>
            <asp:SessionParameter Name="p_TeacherID" SessionField="UserID" />
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
                                    <asp:Label ID="lblTestTitle" runat="server" Text='<%#Bind("title") %>'> </asp:Label>
                                    <br />
                                    <br />
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
