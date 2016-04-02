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
        private string curUser = "Table";
        private string deleteCommand = "DELETE FROM [dbo].[Table] WHERE";   //Not Yet Implemented

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void taskProgressColor(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                
                /*
                int priority = 0;

                if (Int32.TryParse(e.Row.Cells[1].Text, out priority))
                    priority = int.Parse(e.Row.Cells[1].Text);

                foreach (TableCell cell in e.Row.Cells)
                {
                    if (priority == 0)
                        e.Row.Cells[1].Text = "Low";
                    else if (priority == 1)
                        e.Row.Cells[1].Text = "Normal";
                    else if (priority == 2)
                        e.Row.Cells[1].Text = "High";
                }
                */

                int quantity = 0;
                if (Int32.TryParse(e.Row.Cells[2].Text, out quantity))
                    quantity = int.Parse(e.Row.Cells[2].Text);
                
                //int quantity = int.Parse(e.Row.Cells[2].Text);

                foreach (TableCell cell in e.Row.Cells)
                {
                    if (quantity == 1)
                    {
                        cell.BackColor = System.Drawing.Color.Red;
                    }
                    if (quantity == 2)
                    {
                        cell.BackColor = System.Drawing.Color.Blue;
                    }
                    if (quantity == 3)
                    {
                        cell.BackColor = System.Drawing.Color.Green;
                    }
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
              //  priority.BackColor = System.Drawing.Color.FromArgb(0xFF, 0xe8, 0xe8);
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