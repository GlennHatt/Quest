using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuestWebApp.Pages
{
    public partial class studentTeachersandClasses : System.Web.UI.Page
    {
/*SELECT class_id, title, receive_email, eu.f_name || ' ' || eu.l_name AS teacher_name
    FROM enrollment e
         JOIN section  s  USING (section_id)
         JOIN class    c  USING (class_id)
         JOIN end_user eu ON    (teacher_id = user_id)
   WHERE student_id = :p_StudentID*/

        bool showMessage;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["showMessage"] != null)
                showMessage = (bool)Session["showMessage"];
            else
                showMessage = false;



            // showMessage = Convert.ToBoolean(ViewState["showMessage"]);
            if (showMessage == true)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(),
                "toastr_message",
                "toastr.success('Message has been sent', 'Success!')", true);
                Session["showMessage"] = false;
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

            smtpClient.Credentials = new System.Net.NetworkCredential("studentnet\\121585", "password");
            smtpClient.UseDefaultCredentials = true;
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpClient.EnableSsl = true;
            
            MailMessage mail = new MailMessage();

            //Setting From , To and CC
            mail.From = new MailAddress("rcarro6542@students.pcci.edu", "Ryan Carroll");
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
    }
}