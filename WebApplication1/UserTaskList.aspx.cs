using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.ComponentModel;
using System.Data;
using System.Windows;



namespace WebApplication1
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        int integer, value, max;//integer is the integer form of the percent, value is the progress, max is max progress
        float percent;//percentage of max value
        string colorHex, hex; //colorHex is strong for full hex value, hex is string for current color
        string blue = "00";
        //for blue values, aka color schemes:
        //  00 = original
        //  ff = Barbie
        //  80 = Bacon
        
        // Get currently logged in user
        public string userid = HttpContext.Current.User.Identity.Name;
        public string rowTask, rowProgress, rowEnd, rowDeadline;
        public int rowPriority;

        private void SQLInsert(string rowTask, int rowPriority, string rowProgress, string rowEnd, string rowDeadline)
        {
            SqlDataSource1.InsertCommand = "Insert into [dbo].[Table] ([task], [priority], [progress], [end], [deadline], [userID]) Values('" + rowTask + "', " + rowPriority + ", " + rowProgress + ", " + rowEnd + ", '" + rowDeadline + "', '" + userid + "');";
            SqlDataSource1.Insert();
        }
        
        protected void repeatButton_Click(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "repeatCommand") {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[index];
                Label rowPriorityLabel = (Label)row.FindControl("Label1");

                // Empty Deadline Bug (Not Resolved)
                //row.Cells[3].Text.Replace("&nbsp;", "");
                if (row.Cells[3].Text.Length == 0 || row.Cells[3].Text.Equals("&nbsp;") || row.Cells[3].Text.Equals("") || row.Cells[3].Text.Equals(string.Empty))
                {
                    row.Cells[3].Text = string.Empty;
                }

                SQLInsert(row.Cells[0].Text, resolvePriorityRepeat(rowPriorityLabel), row.Cells[2].Text, row.Cells[3].Text, row.Cells[4].Text);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSource1.UpdateParameters["userID"].DefaultValue = userid;
            SqlDataSource1.SelectParameters["userID"].DefaultValue = userid;
           
            // GridView insert command currently unused 
            SqlDataSource1.InsertParameters["userID"].DefaultValue = userid;
            
            // If not logged in, redirect to Login Page
            if (userid.Equals(""))
                Response.Redirect("/Account/Login.aspx", true);

        }

        private void taskProgressColor(String rowProgress, String rowEnd)
        {
            Int32.TryParse(rowProgress, out value);
            Int32.TryParse(rowEnd, out max);

            percent = (value + 0f) / (max + 0f);

            integer = (int)(510 * percent);

            if (percent < .50f)
            {
                hex = (integer).ToString("x2");
                colorHex = "ff" + hex + blue;
            }
            else if (percent > .50f)
            {
                hex = (510 - integer).ToString("x2");
                colorHex = hex + "ff" + blue;
            }
            else if(percent == .50f)
            {
                colorHex = "ffff" + blue;
            }
            else
            {
                colorHex = "99D9EA";
            }
        }

        
        protected void getRowValues(object sender, GridViewRowEventArgs e)
        {
            if ((Scheme.Text).Equals("Original", StringComparison.OrdinalIgnoreCase))
                blue = "00";
            else if (((Scheme.Text).Equals("Barbie", StringComparison.OrdinalIgnoreCase)))
                blue = "ff";
            else
                blue = "80";

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label rowPriorityLabel = (Label)e.Row.FindControl("Label1");
                int temp = 1;
                Int32.TryParse(rowPriorityLabel.Text, out temp);
                rowPriorityLabel.Text = viewPriority(temp);

                rowProgress = e.Row.Cells[2].Text;
                rowEnd = e.Row.Cells[3].Text;

                taskProgressColor(rowProgress, rowEnd);

                foreach (TableCell cell in e.Row.Cells)
                {
                    cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#" + colorHex);
                }
                
            }
        }

        private int resolvePriority()
        {
            if ((priority.Text).Equals("Low", StringComparison.OrdinalIgnoreCase))
                return 0;
            else if (((priority.Text).Equals("Normal", StringComparison.OrdinalIgnoreCase)))
                return 1;
            else
                return 2;
        }

        private int resolvePriorityRepeat(Label label)
        {
            if ((label.Text).Equals("Low", StringComparison.OrdinalIgnoreCase))
                return 0;
            else if (((label.Text).Equals("Normal", StringComparison.OrdinalIgnoreCase)))
                return 1;
            else
                return 2;
        }


        private void progressbar(String daysLeft)
        {
            DateTime start = DateTime.Now;
            int percent, daysTemp;
            Int32.TryParse(daysLeft, out daysTemp);
            DateTime end = start.AddDays(daysTemp);
            foreach (var day in start.EachDay(end))
            { 
                    percent = (100 / daysTemp);
                    if (percent <= 40)
                    {
                        e.progress.PB1.ForeColor = Color.Green;
                    }
                    else if (percent >= 50 && percent <= 80)
                    {
                        progress.PB1.ForeColor = Color.Red;
                    }
                    else
                    {
                        progress.PB1.Color = "";
                    }
                    Label2.Text = daysTemp + "days remaining";
                    progress.PB1.Value = percent;
                }
            
        }
        
           
          
         

      
        protected string viewPriority(int i)
        {
            switch (i)
            {
                case 0:
                    return "Low";
                case 1:
                    return "Normal";
                case 2:
                    return "High";
                default:
                    return "Normal";
            }
        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            SQLInsert(taskTitle.Text, resolvePriority(), curProg.Text, endProg.Text, daysLeft.Text);
        }
    }

    internal class progress
    {

    }
}