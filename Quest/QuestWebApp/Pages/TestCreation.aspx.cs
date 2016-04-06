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

    public partial class testCreation : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            //try
            //{
            //    if (Session["userClassification"] == null)
            //        throw new NullReferenceException();
            //    if ((char)Session["userClassification"] != 'T' && (char)Session["userClassification"] != 'A')
            //    {
            //        utilities util = new utilities();
            //        util.checkAuthentication(1, (char)Session["userClassification"], (char)Session["neededClassification"]);
            //    }
            //}
            //catch (NullReferenceException)
            //{
            //    Response.Redirect("login.aspx");
            //}

            int defaultStartTime = 8;

            indnap.Value = DateTime.Today.Month.ToString() + "-" + DateTime.Today.Day.ToString() + "-" + DateTime.Today.Year.ToString();

            for (int index = defaultStartTime; index <= 11; index++)
            {
                ddlTime.Items.Add(new ListItem(index + ":" + "00" + " AM"));
            }

            ddlTime.Items.Add(new ListItem(12 + ":" + "00" + " PM"));

            for(int index = 1; index <= 11; index++)
            {
                ddlTime.Items.Add(new ListItem(index + ":" + "00" + " PM"));
            }
            ddlTime.Items.Add(new ListItem(12 + ":" + "00" + " AM"));

        }

        protected void btnAddInfo_Click(object sender, EventArgs e)
        {
            string dateString = indnap.Value;
            DateTime testDateTime = DateTime.Parse(dateString);
            OracleCommand cmdAddTest = new OracleCommand(@"
BEGIN
  :v_TestID := TESTS.add(
    p_SectionID => :p_SectionID,
    p_Title     => :p_Title,
    P_DueDate   => :p_DueDate,
    p_TimeLimit => :p_TimeLimit,
    p_StartTime => :p_StartTime);
END;",
            new OracleConnection(ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString));
            cmdAddTest.Parameters.AddWithValue("p_SectionID", ddlSection.SelectedValue);
            cmdAddTest.Parameters.AddWithValue("p_Title",     txtName.Text);
            cmdAddTest.Parameters.AddWithValue("p_DueDate",   testDateTime.ToString("dd-MMM-yy"));
            cmdAddTest.Parameters.AddWithValue("p_TimeLimit", ddlTimeLimit.SelectedValue);
            cmdAddTest.Parameters.AddWithValue("p_StartTime", ddlTime.SelectedValue);
            cmdAddTest.Parameters.AddWithValue("v_TestID",    OleDbType.Integer).Direction = System.Data.ParameterDirection.Output;

            cmdAddTest.Connection.Open();
            cmdAddTest.ExecuteNonQuery();

            Session["Test_ID"] = Convert.ToString(cmdAddTest.Parameters["v_TestID"].Value);

            cmdAddTest.Connection.Close();

            Response.Redirect("questionCreation.aspx");
        }
    }
}