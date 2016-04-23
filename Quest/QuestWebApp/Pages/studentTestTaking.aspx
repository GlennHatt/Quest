﻿<%@ Page Title="Student | Taking Test" Language="C#" MasterPageFile="~/Master-Pages/takingTest.master" AutoEventWireup="true" CodeBehind="studentTestTaking.aspx.cs" Inherits="QuestWebApp.Pages.studentTestTaking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="takingTestBreadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="takingTestHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="takingTestExtraReferances" runat="server">
    <link href="../Assets/Styles/timer/materialize.css" rel="stylesheet" />
    <%--<link href="../Assets/Styles/timer/materialize.min.css" rel="stylesheet" />--%>
    <link href="../Assets/Styles/timer/timerstyles.css" rel="stylesheet" />



</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="takingTestBodyContent" runat="server">
    <asp:ScriptManager ID="ScriptMgr" runat="server" EnablePageMethods="true">
                </asp:ScriptManager>
    <!-- begin timer -->

    <div class="wrapper">



        <div class="app">

            <div class="container alarm hidden">


                <div class="control input-field">
                    <input id="alarm-input" type="text" class="validate">
                    <label for="alarm-input">Set Time</label>
                </div>

                <div class="control switch">
                    <label>
                        Off
						<input type="checkbox" id="alarm-btn">
                        <span class="lever"></span>
                        On
                    </label>
                </div>

                <div class="control checkbox">
                    <input type="checkbox" id="alarm-sounds" />
                    <label for="alarm-sounds">Sounds</label>
                </div>



                <div class="clock z-depth-1 inactive">
                    <span>Not Set</span>
                    <div class="overlay waves-effect"></div>
                </div>
            </div>



            <div class="container timer " style="color: white;">
                <div class="controlform">
                    <div class="control input-field">
                        <input id="timer-input" type="number" onclick="setTime(document.getElementById('timer-input').value)">
                        <label for="timer-input">Minutes</label>
                    </div>

                    <a id="btnStartTimer" class="timer-btn start waves-effect"><i class="material-icons">add</i></a>
                    <a class="timer-btn pause waves-effect"><i class="mdi-av-pause"></i></a>
                    <a id="btnResetTimer" class="timer-btn reset waves-effect"><i class="mdi-av-replay"></i></a>

                    <div class="control checkbox">
                        <input type="checkbox" id="timer-sounds" />
                        <label for="timer-sounds">Sounds</label>
                    </div>

                </div>

                <!--<div id="timerClock" runat="server" class="clock inactive z-depth-1 waves-effect"></div>-->
                <input type="text" id="timerClock" name="timerClock" value="" class="clock inactive z-depth-1 waves-effect fixTimer" />

                <!-- Simple MDL Progress Bar -->
<div id="p1" class="mdl-progress mdl-js-progress" style="top: -42px;height:21px;z-index:2;width:70%;margin-left:15%;" ></div>
<script>
  document.querySelector('#p1').addEventListener('mdl-componentupgraded', function() {
    this.MaterialProgress.setProgress(0);
  });
</script>
            </div>


        </div>

        <div id="times-up-modal" class="modal">
            <div class="modal-content">
                <h3>Time's Up!</h3>
            </div>
            <div class="modal-footer">
                <a href="#!" class="dismiss-alarm-sounds modal-action waves-effect waves-red btn-flat">Dismiss Alarm</a>
            </div>
        </div>

    </div>



    <!-- end timer -->
    <div class="mdl-card mdl-card-sizing" style="min-height:0px;height:98px;top:103px;margin-bottom:100px;width:80%;margin-left:10%;">
        <div class="mdl-card__supporting-text" style="text-align: center;width:100%;">
            Question Card Sizing:<br />
            <asp:LinkButton ID="btnSmall" runat="server" OnClick="btnSmall_Click" OnClientClick="postingBack()" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--colored" ForeColor="White" BackColor="#FF6E40">Small</asp:LinkButton>
            <asp:LinkButton ID="btnLarge" runat="server" OnClick="btnLarge_Click" OnClientClick="postingBack()" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--colored" ForeColor="White" BackColor="#FF6E40">Large</asp:LinkButton>
        </div>
    </div>
    <main class="mdl-layout__content" style="width: 100%;">
        <div class="content-grid mdl-grid" style="width: 99.4%;">
            <br />
            <br />
            <asp:SqlDataSource ID="sqlTestQuestions" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="        
SELECT q.question_id, weight, type, test_order,
       e.question_text AS essay_question, 
       m.question_text AS matching_question,
       mc.question_text AS multiple_choice_question, mc.choice_id AS multiple_choice_answer,
       tf.question_text AS true_false_question,      tf.answer    AS true_false_answer,
       before_text, after_text, sa.answer AS short_answer_answer, row_number() over(order by test_order) seq 
  FROM question q
       LEFT OUTER JOIN question_essay           e  ON (q.question_id = e.question_id  AND q.type = 'E')
       LEFT OUTER JOIN question_matching        m  ON (q.question_id = m.question_id  AND q.type = 'M')
       LEFT OUTER JOIN question_multiple_choice mc ON (q.question_id = mc.question_id AND q.type = 'MC')
       LEFT OUTER JOIN question_short_answer    sa ON (q.question_id = sa.question_id AND q.type = 'SA')
       LEFT OUTER JOIN question_true_false      tf ON (q.question_id = tf.question_id AND q.type = 'TF')
 WHERE test_id = :p_TestID
       AND type != 'M'
 ORDER BY test_order
 ">
                <SelectParameters>
                    <asp:SessionParameter SessionField="TestID" Name="p_TestID" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="p_TestTakenID" />
                    <asp:Parameter Name="p_QuestionID" />
                    <asp:Parameter Name="p_Answer" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:Label ID="lblTimeLimit" runat="server" CssClass="hide" />
            <asp:Label ID="lblProgressBar" runat="server" CssClass="hide"/>
            <button id="btnTimeLimit" onclick="setClientTime(document.getElementById('<%=lblTimeLimit.ClientID%>').textContent); return false;" class="hide"></button>

            <asp:ListView ID="lstQuestions" runat="server" DataSourceID="sqlTestQuestions" OnItemDataBound="lstQuestions_ItemDataBound" OnDataBound="lstQuestions_DataBound">
                <ItemTemplate>
                    <div id="questionCard" class="mdl-cell mdl-cell--6-col" runat="server">
                        <div class="demo-card-wide mdl-card-addClass mdl-shadow--6dp demo-card-square mdl-card">
                            <div class="mdl-card__supporting-text" style="text-align: center" id="divQuestion">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    
                                    <asp:HiddenField ID="hdnQuestionID" Value='<%# Bind("question_id") %>' runat="server" />
                                    <asp:HiddenField ID="hdnQuestionType" Value='<%# Bind("type") %>' runat="server" />
                                    <asp:Label ID="Label1" runat="server" Text='Question Number:' />
                                    <asp:Label ID="lblQuestionNum" runat="server" Text='<%#Bind("seq") %>' />
                                    <br />
                                    <asp:Label ID="lblDispWeight" runat="server" Text="Point Value: "></asp:Label>
                                    <asp:Label ID="lblWeight" Text='<%# Eval("weight") %>' runat="server" />
                                </div>
                            </div>
                            <!-- Essay -->
                            <div runat="server" class="mdl-card__supporting-text" style="text-align: center" id="divE">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <asp:Label ID="lblEQuestion" CssClass="mdl-textfield" Text='<%# Eval("essay_question") %>' runat="server" />
                                    <asp:TextBox ID="txtEAnswer" runat="server" TextMode="MultiLine" CssClass="mdl-textfield__input" OnTextChanged="questionChanged"/>
                                </div>
                            </div>
                            <!-- Matching -->
                            <!-- Multiple Choice -->
                            <div runat="server" class="mdl-card__supporting-text" style="text-align: center" id="divMC">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <asp:HiddenField ID="hdnMCAnswer" runat="server" Value='<%#Bind("multiple_choice_answer") %>' />
                                    <asp:SqlDataSource ID="sqlMCChoices" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" ProviderName="<%$ ConnectionStrings:ProductionDB.ProviderName %>" SelectCommand="
SELECT choice_id, choice_text
  FROM question_multiple_choice_body
 WHERE question_id = :p_QuestionID
 ORDER BY set_order">
                                        <SelectParameters>
                                            <asp:ControlParameter Name="p_QuestionID" ControlID="hdnQuestionID" PropertyName="Value" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:Label ID="lblMCQuestion" CssClass="mdl-textfield" Text='<%# Eval("multiple_choice_question") %>' runat="server" />
                                    <asp:RadioButtonList ID="rblMCAnswer" runat="server" DataSourceID="sqlMCChoices" DataTextField="choice_text" DataValueField="choice_id" CssClass="mc" />
                                </div>
                            </div>
                            <!-- Short Answer -->
                            <div runat="server" class="mdl-card__supporting-text" style="text-align: center" id="divSA">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <asp:HiddenField ID="hdnSAAnswer" runat="server" Value='<%#Bind("short_answer_answer") %>' />
                                    <asp:Label ID="lblBeforeText" CssClass="mdl-textfield" Text='<%# Eval("before_text") %>' runat="server" />
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <asp:TextBox ID="txtSAAnswer" runat="server" CssClass="mdl-textfield__input" />
                                        <label class="mdl-textfield__label" style="bottom: 0px" for="sample3">Answer:</label>
                                    </div>
                                    <asp:Label ID="lblAfterText" CssClass="mdl-textfield" Text='<%# Eval("after_text") %>' runat="server" />
                                </div>
                            </div>
                            <!-- True False -->
                            <div runat="server" class="mdl-card__supporting-text" style="text-align: center" id="divTF">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <asp:HiddenField ID="hdnTFAnswer" Value='<%# Eval("true_false_answer") %>' runat="server" />
                                    <asp:Label ID="lblTFQuestion" CssClass="mdl-textfield" Text='<%# Eval("true_false_question") %>' runat="server" />
                                    <asp:RadioButtonList ID="rblTFAnswer" runat="server" CssClass="mdl-radio__button tf" RepeatDirection="Horizontal" OnSelectedIndexChanged="questionChanged">
                                        <asp:ListItem Text="True" Value="T" />
                                        <asp:ListItem Text="False" Value="F" />
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:ListView>

            <asp:Label ID="lblASP" runat="server" Text="Label" CssClass="hidden"></asp:Label>
            <div style="position: fixed; right: 41px; bottom: 80px; z-index: 2;">
                <asp:Button ID="btnSaveTest" Height="53px" ForeColor="White" BackColor="Green" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent saveTestButtonStyle" runat="server" Text="Save Test" OnClick="btnSaveTest_Click" />
            </div>
            <div style="position: fixed; right: 41px; bottom: 15px; z-index: 2;">
                <asp:Button ID="btnSubmitTest" Height="53px" ForeColor="White" BackColor="Green" CssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" runat="server" Text="Submit Test" OnClick="btnSubmitTest_Click" OnClientClick="postingBack();"/>
            </div>
            <asp:HiddenField ID="hdnQuestionTotal" runat="server" />
        </div>
        
    </main>

    <!-- This the code construction zone. Code may or may not be needed in this section-->
    <!--
    --------layout template for matching questions----------     
    <LayoutTemplate>
                                <table>
                                    <tr>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                </table>
                            </LayoutTemplate> -->
    <!--<td id="itemPlaceholder" runat="server"></td>
        
        
        
        
      ------------------NEED FOR ALL MATCHING-------------------  
        <asp:Label ID="Label1"  Text='<%# Eval("quest_id") %>' runat="server" Visible="false" />
                                <asp:Button ID="Button1" class="mdl-button mdl-js-button mdl-js-ripple-effect" Text='<%# Eval("matching_question") %>' runat="server" />
                                <br />
        
        -->
    <button style="display: none" id="testButton" onclick="return false"></button>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="takingTestPageSpecificJS" runat="server">

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="../Assets/JS/timer/materialize.min.js"></script>
    <script src="../Assets/JS/timer/jquery.timepicker.min.js"></script>
    <script src="../Assets/JS/timer/hammer.js"></script>
    <script src="../Assets/JS/timer/timerjs.js"></script>
    <script src="../Assets/JS/timer/alarm.js"></script>
    <script src="../Assets/JS/timer/timerjs2.js"></script>
    <script src="../Assets/JS/testTaking.js"></script>
    <script>

        var progressPercent = 0;
        var testProgress = [];
        var isPostingBack; // is the page posting back? flag value
        var totalQuestions;
        
        document.getElementById('btnResetTimer').click();
        document.getElementById('btnTimeLimit').click();
        document.getElementById('btnStartTimer').click();
        document.getElementById("alarm-sounds").checked = true;
        setFinishButton(document.getElementById("<%=btnSubmitTest.ClientID%>"));

        window.onload = function () {
            totalQuestions = document.getElementById("<%=hdnQuestionTotal.ClientID%>").value;
            //if (localStorage.getItem("testProgress")) {
            //    testProgress = JSON.parse(localStorage.getItem("testProgress"));
            //    progressPercent = localStorage.getItem("progressPercent");

            // wait for progress bar to load before incrementing
            //testProgress = JSON.parse(document.getElementById("<%=lblProgressBar.ClientID%>").textContent);
            progressArray = document.getElementById("<%=lblProgressBar.ClientID%>").textContent;
            testProgress = progressArray.split(',');
            
            setTimeout(function () {
                setProgressBar()
                //document.querySelector('.mdl-js-progress').MaterialProgress.setProgress();
            }, 500);
                
        }
        

        
        //console.log("test");
        
     //window.on

        window.onbeforeunload = function () {
setTimeout(function () {
                    document.getElementById("<%=btnSaveTest.ClientID%>").click();
            }, 1500);

            


            if (!isPostingBack)
            {

                isPostingBack = false;
                
                
                
                //console.log("save test");
                return "Are you sure you want to end the test?";
            }
        }

        function postingBack()
        {
            isPostingBack = true;
        }

        function questionChanged(questionNum)
        {
            var progressNum = 0;
          
            testProgress[questionNum] = true;

            for (var question in testProgress)
            {
                if (testProgress[question] == true)
                    progressNum++;
            }

            progressPercent = progressNum / totalQuestions * 100;
            document.querySelector('.mdl-js-progress').MaterialProgress.setProgress(progressPercent);
            
        }

        function setProgressBar()
        {
            var progressNum = 0;

            for (var question in testProgress) {
                if (testProgress[question] == "true")
                    progressNum++;
            }

            progressPercent = (progressNum / totalQuestions) * 100;
            console.log("progress percent: " + totalQuestions);
            document.querySelector('.mdl-js-progress').MaterialProgress.setProgress(progressPercent);
        }

        function setClientTime(time)
        {
            console.log(time);
            var timeInSeconds = 0;
            var timeArray = time.split(':');
            newTime = new Date();
            newTime.setHours(timeArray[0]);
            newTime.setMinutes(timeArray[1]);
            newTime.setSeconds(timeArray[2]);

            timeInSeconds += newTime.getSeconds();
            timeInSeconds += (newTime.getMinutes() * 60);
            timeInSeconds += (newTime.getHours() * 60 * 60);
            console.log(timeInSeconds);
            setTime(timeInSeconds);
            
        }

    </script>
</asp:Content>
