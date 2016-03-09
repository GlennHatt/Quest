using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuestWebApp.Pages
{
    public partial class takingTestTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // TODO: Session variable for test ID?
            int test_id = 1;
        }

        protected void btnSubmitTest_Click(object sender, EventArgs e)
        {
            foreach(ListViewItem question in lvTest.Items)
            {
                string ConnectionString = System.Configuration.ConfigurationSettings.AppSettings["ConnectionString"].ToString();
                //SqlConnection takenTest = new SqlCommand("")
            }
        }

    }
}