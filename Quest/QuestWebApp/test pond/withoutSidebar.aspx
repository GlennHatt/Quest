<%@ Page Title="" Language="C#" MasterPageFile="~/Master-Pages/withoutSidebar.master" AutoEventWireup="true" CodeBehind="withoutSidebar.aspx.cs" Inherits="QuestWebApp.test_pond.withoutSidebar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="withoutSidebarBreadCrumb" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="withoutSidebarHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="withoutSidebarExtraReferances" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="withoutSidebarHeadBodyContent" runat="server">

    




</asp:Content>

<asp:Content ID="mytest" ContentPlaceHolderID="withoutSidebarBodyContent" runat="server">

    <main class="mdl-layout__content">
                    <div class="content-grid mdl-grid">


                        <div class="mdl-cell mdl-cell--4-col">
                            <div class="demo-card-wide mdl-card-addClass mdl-shadow--6dp demo-card-square mdl-card">
                                <div class="mdl-card__supporting-text" style="text-align: center">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <asp:Label ID="Label1" class="mdl-textfield__input" Text='<%# Eval("tf_question") %>' runat="server" />
                                        <asp:RadioButton ID="RadioButton1" class="mdl-radio__button" Text="True" runat="server" GroupName="TFChoice" /> 
                                        <asp:RadioButton ID="RadioButton2" class="mdl-radio__button" Text="False" runat="server" GroupName="TFChoice" />
                                    </div>
                                </div>
                            </div>
                        </div><div class="mdl-cell mdl-cell--4-col">
                            <div class="demo-card-wide mdl-card-addClass mdl-shadow--6dp demo-card-square mdl-card">
                                <div class="mdl-card__supporting-text" style="text-align: center">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <asp:Label ID="Label2" class="mdl-textfield__input" Text='<%# Eval("tf_question") %>' runat="server" />
                                        <asp:RadioButton ID="RadioButton3" class="mdl-radio__button" Text="True" runat="server" GroupName="TFChoice" /> 
                                        <asp:RadioButton ID="RadioButton4" class="mdl-radio__button" Text="False" runat="server" GroupName="TFChoice" />
                                    </div>
                                </div>
                            </div>
                        </div><div class="mdl-cell mdl-cell--4-col">
                            <div class="demo-card-wide mdl-card-addClass mdl-shadow--6dp demo-card-square mdl-card">
                                <div class="mdl-card__supporting-text" style="text-align: center">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <asp:Label ID="Label3" class="mdl-textfield__input" Text='<%# Eval("tf_question") %>' runat="server" />
                                        <asp:RadioButton ID="RadioButton5" class="mdl-radio__button" Text="True" runat="server" GroupName="TFChoice" /> 
                                        <asp:RadioButton ID="RadioButton6" class="mdl-radio__button" Text="False" runat="server" GroupName="TFChoice" />
                                    </div>
                                </div>
                            </div>
                        </div><div class="mdl-cell mdl-cell--4-col">
                            <div class="demo-card-wide mdl-card-addClass mdl-shadow--6dp demo-card-square mdl-card">
                                <div class="mdl-card__supporting-text" style="text-align: center">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <asp:Label ID="Label4" class="mdl-textfield__input" Text='<%# Eval("tf_question") %>' runat="server" />
                                        <asp:RadioButton ID="RadioButton7" class="mdl-radio__button" Text="True" runat="server" GroupName="TFChoice" /> 
                                        <asp:RadioButton ID="RadioButton8" class="mdl-radio__button" Text="False" runat="server" GroupName="TFChoice" />
                                    </div>
                                </div>
                            </div>
                        </div><div class="mdl-cell mdl-cell--4-col">
                            <div class="demo-card-wide mdl-card-addClass mdl-shadow--6dp demo-card-square mdl-card">
                                <div class="mdl-card__supporting-text" style="text-align: center">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <asp:Label ID="Label5" class="mdl-textfield__input" Text='<%# Eval("tf_question") %>' runat="server" />
                                        <asp:RadioButton ID="RadioButton9" class="mdl-radio__button" Text="True" runat="server" GroupName="TFChoice" /> 
                                        <asp:RadioButton ID="RadioButton10" class="mdl-radio__button" Text="False" runat="server" GroupName="TFChoice" />
                                    </div>
                                </div>
                            </div>
                        </div><div class="mdl-cell mdl-cell--4-col">
                            <div class="demo-card-wide mdl-card-addClass mdl-shadow--6dp demo-card-square mdl-card">
                                <div class="mdl-card__supporting-text" style="text-align: center">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <asp:Label ID="Label6" class="mdl-textfield__input" Text='<%# Eval("tf_question") %>' runat="server" />
                                        <asp:RadioButton ID="RadioButton11" class="mdl-radio__button" Text="True" runat="server" GroupName="TFChoice" /> 
                                        <asp:RadioButton ID="RadioButton12" class="mdl-radio__button" Text="False" runat="server" GroupName="TFChoice" />
                                    </div>
                                </div>
                            </div>
                        </div><div class="mdl-cell mdl-cell--4-col">
                            <div class="demo-card-wide mdl-card-addClass mdl-shadow--6dp demo-card-square mdl-card">
                                <div class="mdl-card__supporting-text" style="text-align: center">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <asp:Label ID="Label7" class="mdl-textfield__input" Text='<%# Eval("tf_question") %>' runat="server" />
                                        <asp:RadioButton ID="RadioButton13" class="mdl-radio__button" Text="True" runat="server" GroupName="TFChoice" /> 
                                        <asp:RadioButton ID="RadioButton14" class="mdl-radio__button" Text="False" runat="server" GroupName="TFChoice" />
                                    </div>
                                </div>
                            </div>
                        </div><div class="mdl-cell mdl-cell--4-col">
                            <div class="demo-card-wide mdl-card-addClass mdl-shadow--6dp demo-card-square mdl-card">
                                <div class="mdl-card__supporting-text" style="text-align: center">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <asp:Label ID="Label8" class="mdl-textfield__input" Text='<%# Eval("tf_question") %>' runat="server" />
                                        <asp:RadioButton ID="RadioButton15" class="mdl-radio__button" Text="True" runat="server" GroupName="TFChoice" /> 
                                        <asp:RadioButton ID="RadioButton16" class="mdl-radio__button" Text="False" runat="server" GroupName="TFChoice" />
                                    </div>
                                </div>
                            </div>
                        </div><div class="mdl-cell mdl-cell--4-col">
                            <div class="demo-card-wide mdl-card-addClass mdl-shadow--6dp demo-card-square mdl-card">
                                <div class="mdl-card__supporting-text" style="text-align: center">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <asp:Label ID="Label9" class="mdl-textfield__input" Text='<%# Eval("tf_question") %>' runat="server" />
                                        <asp:RadioButton ID="RadioButton17" class="mdl-radio__button" Text="True" runat="server" GroupName="TFChoice" /> 
                                        <asp:RadioButton ID="RadioButton18" class="mdl-radio__button" Text="False" runat="server" GroupName="TFChoice" />
                                    </div>
                                </div>
                            </div>
                        </div><div class="mdl-cell mdl-cell--4-col">
                            <div class="demo-card-wide mdl-card-addClass mdl-shadow--6dp demo-card-square mdl-card">
                                <div class="mdl-card__supporting-text" style="text-align: center">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <asp:Label ID="Label10" class="mdl-textfield__input" Text='<%# Eval("tf_question") %>' runat="server" />
                                        <asp:RadioButton ID="RadioButton19" class="mdl-radio__button" Text="True" runat="server" GroupName="TFChoice" /> 
                                        <asp:RadioButton ID="RadioButton20" class="mdl-radio__button" Text="False" runat="server" GroupName="TFChoice" />
                                    </div>
                                </div>
                            </div>
                        </div><div class="mdl-cell mdl-cell--4-col">
                            <div class="demo-card-wide mdl-card-addClass mdl-shadow--6dp demo-card-square mdl-card">
                                <div class="mdl-card__supporting-text" style="text-align: center">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <asp:Label ID="Label11" class="mdl-textfield__input" Text='<%# Eval("tf_question") %>' runat="server" />
                                        <asp:RadioButton ID="RadioButton21" class="mdl-radio__button" Text="True" runat="server" GroupName="TFChoice" /> 
                                        <asp:RadioButton ID="RadioButton22" class="mdl-radio__button" Text="False" runat="server" GroupName="TFChoice" />
                                    </div>
                                </div>
                            </div>
                        </div><div class="mdl-cell mdl-cell--4-col">
                            <div class="demo-card-wide mdl-card-addClass mdl-shadow--6dp demo-card-square mdl-card">
                                <div class="mdl-card__supporting-text" style="text-align: center">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <asp:Label ID="Label12" class="mdl-textfield__input" Text='<%# Eval("tf_question") %>' runat="server" />
                                        <asp:RadioButton ID="RadioButton23" class="mdl-radio__button" Text="True" runat="server" GroupName="TFChoice" /> 
                                        <asp:RadioButton ID="RadioButton24" class="mdl-radio__button" Text="False" runat="server" GroupName="TFChoice" />
                                    </div>
                                </div>
                            </div>
                        </div>



                        </div>
        </main>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="withoutSidebarPageSpecificJS" runat="server">
</asp:Content>
