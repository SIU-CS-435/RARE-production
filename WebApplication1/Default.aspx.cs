using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs args)
        {
            if (Page.IsValid)
            {
                lblResult.Text = "You Got It!";
                lblResult.ForeColor = System.Drawing.Color.Green;
            }
            else {
                lblResult.Text = "Incorrect";
                lblResult.ForeColor = System.Drawing.Color.Blue;
            }
        }

    }
}