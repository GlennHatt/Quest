using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data.OracleClient;
using System.Configuration;
using QuestWebApp.App_Code;

namespace QuestWebApp.Pages
{
   public partial class teacherTestCreation : System.Web.UI.Page
   {
      protected void Page_Load(object sender, EventArgs e)
      {

         int defaultStartTime = 8;

         //dueDate.Value = DateTime.Now.AddDays(7).ToString("MM-dd-yy");

      }

      protected void btnAddInfo_Click(object sender, EventArgs e)
      {
         //string dateString = indnap.Value;
         DateTime testDateTime = DateTime.Parse(Page.Request.Form["dueDate"]);
         OracleCommand cmdAddTest = new OracleCommand(@"
BEGIN
  :v_TestID := TESTS.add(
    p_SectionID   => :p_SectionID,
    p_Title       => :p_Title,
    P_DueDate     => :p_DueDate,
    p_TimeLimit   => :p_TimeLimit,
    p_StartTime   => :p_StartTime,
    p_RestoreTest => :p_RestoreTest,
    p_EffectiveDate => :p_EffectiveDate);
END;",
         new OracleConnection(ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString));
         cmdAddTest.Parameters.AddWithValue("p_SectionID", ddlSection.SelectedValue);
         cmdAddTest.Parameters.AddWithValue("p_Title", txtName.Text);
         cmdAddTest.Parameters.AddWithValue("p_DueDate", testDateTime.ToString("dd-MMM-yy"));
         cmdAddTest.Parameters.AddWithValue("p_TimeLimit", ddlTimeLimit.SelectedValue);
         cmdAddTest.Parameters.AddWithValue("p_RestoreTest", ddlSavable.SelectedValue);
         cmdAddTest.Parameters.AddWithValue("p_EffectiveDate", ddlTestEffectiveDate.SelectedValue);
         cmdAddTest.Parameters.AddWithValue("v_TestID", OleDbType.Integer).Direction = System.Data.ParameterDirection.Output;

         cmdAddTest.Connection.Open();
         cmdAddTest.ExecuteNonQuery();

         Session["Test_ID"] = Convert.ToString(cmdAddTest.Parameters["v_TestID"].Value);

         cmdAddTest.Connection.Close();

         Response.Redirect("~/Pages/teacherQuestionCreation.aspx");
      }
   }
}