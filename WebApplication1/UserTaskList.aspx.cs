using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        private string curUser = "d498c91f-2784-4943-b30c-a0db86dfe897";
        private string deleteCommand = "DELETE FROM [dbo].[  curUser  ] WHERE";   //Not Yet Implemented

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Not Yet Implemented
        protected void submitButton_Click(object sender, EventArgs e)
        {
            int priTemp,
                curTemp,
                endTemp;
            //System.Int32.TryParse(priority.Text, out priTemp); 
            System.Int32.TryParse(curProg.Text, out curTemp);
            System.Int32.TryParse(endProg.Text, out endTemp);

            if ((priority.Text).Equals("Low", StringComparison.OrdinalIgnoreCase))
                priTemp = 0;
            else if (((priority.Text).Equals("Normal", StringComparison.OrdinalIgnoreCase)))
                priTemp = 1;
            else
                priTemp = 2;

            // Retrieves info from textboxes
            string insertCommand = "Insert into [dbo].[" + curUser + "] ([task], [priority], [progress], [end]) Values('" + taskTitle.Text + "', " + priTemp + ", " + curTemp + ", " + endTemp + ");";

            SqlDataSource1.InsertCommand = insertCommand;

            // Upon successful insertion
            SqlDataSource1.Insert();
            //    Label1.Text += "<br /> Your task has been added! <br />";
        }
    }
}