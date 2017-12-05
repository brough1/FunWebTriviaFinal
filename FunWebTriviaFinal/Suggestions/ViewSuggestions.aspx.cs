using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FunWebTriviaFinal.Classes;

namespace FunWebTriviaFinal.Suggestions
{
    public partial class ViewSuggestions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(GridView1.Rows.Count == 0)
            {
                lblError.Visible = true;
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (GridView1.Rows.Count == 0 || GridView1.SelectedRow == null)
            {
                lblError.Text = "You have to select a value before clicking this button";
                lblError.Visible = true;
            }
            else
            {
                GridViewRow selectedRow = GridView1.SelectedRow;

                Trivia t = new Trivia();

                t.Description = selectedRow.Cells[2].Text;
                t.Day = Convert.ToInt32(selectedRow.Cells[3].Text);
                t.Month = Convert.ToInt32(selectedRow.Cells[4].Text);
                t.Year = Convert.ToInt32(selectedRow.Cells[5].Text);

                Session["SuggestionID"] = selectedRow.Cells[0].Text;
                Session["SuggestionForTrivia"] = t;
                Response.Redirect("~/TriviaPages/AddTrivia.aspx");
            }
        }
    }
}