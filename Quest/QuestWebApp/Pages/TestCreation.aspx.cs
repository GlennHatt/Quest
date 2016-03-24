﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data.OracleClient;
using System.Configuration;

namespace QuestWebApp.Pages
{

    public partial class testCreation : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            int defaultStartTime = 8;

            indnap.Value = DateTime.Today.Month.ToString() + "-" + DateTime.Today.Day.ToString() + "-" + DateTime.Today.Year.ToString();

            for (int index = defaultStartTime; index <= 11; index++)
            {
                ddltime.Items.Add(new ListItem(index + ":" + "00" + " AM"));
            }

            ddltime.Items.Add(new ListItem(12 + ":" + "00" + " PM"));

            for(int index = 1; index <= 11; index++)
            {
                ddltime.Items.Add(new ListItem(index + ":" + "00" + " PM"));
            }
            ddltime.Items.Add(new ListItem(12 + ":" + "00" + " AM"));

        }

        protected void btnAddInfo_Click(object sender, EventArgs e)
        {
            string dateString = indnap.Value + " " + ddltime.SelectedValue;
            DateTime testDateTime = DateTime.Parse(dateString);
            
            OracleCommand cmdAddTest = new OracleCommand(@"
BEGIN
  :v_TestID := TESTS.add(
    p_SectionID      => :p_SectionID,
    p_Title          => :p_Title,
    P_DueDate        => :p_DueDate,
    p_TimeLimit      => :p_TimeLimit);
END;",
            new OracleConnection(ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString));
            cmdAddTest.Parameters.AddWithValue("p_SectionID", ddlSection.SelectedValue);
            cmdAddTest.Parameters.AddWithValue("p_Title",     txtName.Text);
            //cmdAddTest.Parameters.AddWithValue("p_DueDate",   cldrTestDay.SelectedDate);
            cmdAddTest.Parameters.AddWithValue("p_TimeLimit", ddlTimeLimit.SelectedValue);
            cmdAddTest.Parameters.AddWithValue("v_TestID",    OleDbType.Integer).Direction = System.Data.ParameterDirection.Output;

            cmdAddTest.Connection.Open();
            cmdAddTest.ExecuteNonQuery();

            Session["Test_ID"] = Convert.ToString(cmdAddTest.Parameters["v_TestID"].Value);

            cmdAddTest.Connection.Close();

            Response.Redirect("questionCreation.aspx");
        }
    }
}