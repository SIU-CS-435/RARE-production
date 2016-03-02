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
            // Retrieves info from textboxes
            string insertCommand = "Insert into [dbo].[" + curUser + "] ([task], [priority], [progress], [end]) Values('TestTask3', '0', '1', '50');";

            SqlDataSource1.InsertCommand = insertCommand;

            // Upon successful insertion
            if (SqlDataSource1.Insert() == 1)
                Label1.Text += "<br /> Your task has been added! <br />";
        }
    }
}