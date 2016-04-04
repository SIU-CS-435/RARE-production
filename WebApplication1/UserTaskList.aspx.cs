using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace WebApplication1
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        int integer, value, max;//integer is the integer form of the percent, value is the progress, max is max progress
        float percent;//percentage of max value
        string colorHex, hex;//colorHex is strong for full hex value, hex is string for current color

        string blue = "00";
        //for blue values, aka color schemes:
        //  00 = original
        //  ff = Barbie
        //  80 = Bacon

        private string curUser = "Table";
        private string deleteCommand = "DELETE FROM [dbo].[Table] WHERE";   //Not Yet Implemented

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void taskProgressColor(object sender, GridViewRowEventArgs e)
        {
            if ((Scheme.Text).Equals("Original", StringComparison.OrdinalIgnoreCase))
                blue = "00";
            else if (((Scheme.Text).Equals("Barbie", StringComparison.OrdinalIgnoreCase)))
                blue = "ff";
            else
                blue = "80";

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Int32.TryParse(e.Row.Cells[2].Text, out value);
                Int32.TryParse(e.Row.Cells[3].Text, out max);

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
                else
                {
                    colorHex = "ffff" + blue;
                }

                foreach (TableCell cell in e.Row.Cells)
                {
                    cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#" + colorHex);
                }
                
            }
        }

        //Not Yet Implemented
        protected void submitButton_Click(object sender, EventArgs e)
        {
            int priTemp,
                curTemp,
                endTemp,
                daysTemp;
           
            System.Int32.TryParse(curProg.Text, out curTemp);
            System.Int32.TryParse(endProg.Text, out endTemp);
            System.Int32.TryParse(daysLeft.Text, out daysTemp);//not added to database yet




            if ((priority.Text).Equals("Low", StringComparison.OrdinalIgnoreCase))
                    priTemp = 0;
            else if (((priority.Text).Equals("Normal", StringComparison.OrdinalIgnoreCase)))
                    priTemp = 1;
                else
                    priTemp = 2;
            
            // Retrieves info from textboxes
            string insertCommand = "Insert into [dbo].[" + curUser + "] ([task], [priority], [progress], [end]) Values('" + taskTitle.Text + "', " + priTemp + ", " + curTemp + ", " + endTemp + ");";

            // SELECT DATEDIFF(day, CURDATE() , endTemp ) AS DiffDate

            SqlDataSource1.InsertCommand = insertCommand;

            // Upon successful insertion
            SqlDataSource1.Insert();
            //    Label1.Text += "<br /> Your task has been added! <br />";
        }
    }
}