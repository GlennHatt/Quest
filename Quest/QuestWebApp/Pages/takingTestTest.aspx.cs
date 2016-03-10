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
        //string ConnectionString = System.Configuration.ConfigurationSettings.AppSettings["ConnectionString"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            // TODO: Session variable for test ID needed here
            int test_id = 1;
        }

        protected void btnSubmitTest_Click(object sender, EventArgs e)
        {
            foreach(ListViewItem question in lvTest.Items)
            {
                
               /* txtTestAnswer.Text += "/" + ((Label)question.FindControl("Label1")).Text + ", ";
                if (((RadioButton)question.FindControl("rdbTrue")).Checked == true)
                    txtTestAnswer.Text += "T";
                else
                    txtTestAnswer.Text += "F"; */     
            }
        }

    }
}