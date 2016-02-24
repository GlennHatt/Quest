using System;
using System.Collections.Generic;
using System.Web;

namespace QuestWebApp.App_Code
{
    public class utilities
    {
        public void checkAuthentication(int? id, char actualClassification, char neededClassification)
        {
            if (id == null)
                Console.WriteLine("Redirect to login page");
                // Redirect to login page
            else
            {
                if (actualClassification != neededClassification)
                {
                    switch (actualClassification)
                    {
                        case 'A':
                            // If it is student reditrect to admin, otherwise do nothing
                            // Access to both admin and teacher dashboard
                            break;
                        case 'T':
                            // Access to only teacher dashboard
                            break;
                        case 'S':
                            // Access to only student dashboard
                            break;
                        default:
                            // Redirect to Login page
                            break;
                    }
                }
            }
        }
    }
}