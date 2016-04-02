using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OracleClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuestWebApp.Pages
{
    public partial class AddStudentToClass : System.Web.UI.Page
    {
        OracleConnection connectionString = new OracleConnection(ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString); // Connection String.

        protected void Page_Load(object sender, EventArgs e)
        {
            cardAlreadyEnrolled.Visible = false;
        }

        protected void ddlClassSelect_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (ddlClassSelect.SelectedIndex == 0)
            {
                ddlStudentsSelect.Enabled = false;
                cardAlreadyEnrolled.Visible = false;
            }
            else
            {
                ddlStudentsSelect.Enabled = true;
                cardAlreadyEnrolled.Visible = true;
            }
        }

        protected void btnStudenttoClass_Click(object sender, EventArgs e)
        {
            OracleCommand cmdAddEnrollee = new OracleCommand(@"
DECLARE
    v_dummy pls_integer;
BEGIN
   v_dummy := enrollments.add(
    p_StudentID => :p_StudentID,
    p_SectionID => :p_SectionID);
END;",
             new OracleConnection(ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString));
            cmdAddEnrollee.Parameters.AddWithValue("p_StudentID", ddlStudentsSelect.SelectedValue);
            cmdAddEnrollee.Parameters.AddWithValue("p_SectionID", ddlClassSelect.SelectedValue);

            cmdAddEnrollee.Connection.Open();
            cmdAddEnrollee.ExecuteNonQuery();

            cmdAddEnrollee.Connection.Close();
            gvCurrentStudents.DataBind();
        }
    }
}