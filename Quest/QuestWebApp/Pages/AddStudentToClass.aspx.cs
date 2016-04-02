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

        }

        protected void ddlClassSelect_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlClassSelect.SelectedIndex == 0)
                ddlStudentsSelect.Enabled = false;
            else
                ddlStudentsSelect.Enabled = true;
        }

        protected void btnStudenttoClass_Click(object sender, EventArgs e)
        {

        }
    }
}