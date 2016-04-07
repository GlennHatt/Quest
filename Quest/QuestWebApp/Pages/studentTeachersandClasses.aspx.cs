using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OracleClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QuestWebApp.App_Code;

namespace QuestWebApp.Pages
{
    public partial class studentTeachersandClasses : System.Web.UI.Page
    {
        OracleConnection connectionString = new OracleConnection(ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString); // Connection String.
        
        bool showMessage;
        string studentEmailEnabled = "false",
                   studentEmailAddress = null,
                   studentEmailPassword = null,
                   studentEmailUsername = null,
                   studentName = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            

            mailButton.Visible = false;
            var teachersEmailEnabled = new MultiDimList<int, string>();
            

            if (Session["showMessage"] != null)
                showMessage = (bool)Session["showMessage"];
            else
                showMessage = false;

            if (showMessage == true)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(),
                "toastr_message",
                "toastr.success('Message has been sent', 'Success!')", true);
                Session["showMessage"] = false;
            }

            OracleCommand cmdEmailActive = new OracleCommand(@"
SELECT receive_email, email, email_password, username, f_name, l_name
  FROM end_user
 WHERE user_id = :p_UserID", connectionString);
            cmdEmailActive.Parameters.AddWithValue("p_UserID", "17"/*Session["p_StudentID"]*/);

            cmdEmailActive.Connection.Open();
            OracleDataReader reader = cmdEmailActive.ExecuteReader();
            try
            {
                while (reader.Read())
                {
                    studentEmailEnabled = reader.GetValue(0).ToString();
                    studentEmailAddress = reader.GetValue(1).ToString();
                    studentEmailPassword = reader.GetValue(2).ToString();
                    studentEmailUsername = reader.GetValue(3).ToString();
                    studentName = reader.GetValue(4).ToString() + " " + reader.GetValue(5).ToString();
                }
            }
            finally
            {
                reader.Close();
            }
            cmdEmailActive.Connection.Close();


            cmdEmailActive = new OracleCommand(@"
SELECT class_id, title, receive_email, eu.f_name || ' ' || eu.l_name AS teacher_name, teacher_id
  FROM enrollment e
       JOIN section  s  USING (section_id)
       JOIN class    c  USING (class_id)
       JOIN end_user eu ON    (teacher_id = user_id)
 WHERE student_id = :p_StudentID", connectionString);
            cmdEmailActive.Parameters.AddWithValue("p_StudentID", "17"/*Session["p_StudentID"]*/);

            cmdEmailActive.Connection.Open();
            reader = cmdEmailActive.ExecuteReader();
            try
            {
                while (reader.Read())
                {
                    teachersEmailEnabled.Add(Convert.ToInt32(reader.GetValue(4)), reader.GetValue(2).ToString());
                }
            }
            finally
            {
                reader.Close();
            }
            cmdEmailActive.Connection.Close();
            
            if (Convert.ToBoolean(studentEmailEnabled) == true)
            {
                mailButton.Visible = true;
            }

        }

        protected void btnSendMessage_Click(object sender, EventArgs e)
        {
            sendEmail();
            showMessage = true;
            Session["showMessage"] = true;
            Response.Redirect(Request.RawUrl); // to ensure message always shows up
        }

        protected void sendEmail()
        {
            SmtpClient smtpClient = new SmtpClient("students.pcci.edu", 25);

            smtpClient.Credentials = new System.Net.NetworkCredential("studentnet\\" + studentEmailUsername , studentEmailPassword);
            smtpClient.UseDefaultCredentials = true;
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpClient.EnableSsl = true;
            
            MailMessage mail = new MailMessage();

            //Setting From , To and CC
            mail.From = new MailAddress(studentEmailAddress, studentName);
            mail.To.Add(new MailAddress("ryan8440@gmail.com"));
            mail.Subject = txtbxMessageSubject.Text;
            mail.Body = txtbxMessageBody.Value;


            // Accepts all certificates
            ServicePointManager.ServerCertificateValidationCallback =
            delegate (object s, X509Certificate certificate,
             X509Chain chain, SslPolicyErrors sslPolicyErrors)
            { return true; };


            smtpClient.Send(mail);
        }

        public class MultiDimList<TID, Enabled> : Dictionary<TID, List<Enabled>>
        {
            public void Add(TID key, Enabled addObject)
            {
                if (!ContainsKey(key)) Add(key, new List<Enabled>());
                if (!base[key].Contains(addObject)) base[key].Add(addObject);
            }
        }
    }
}