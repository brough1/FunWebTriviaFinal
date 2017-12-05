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

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            GridViewRow selectedRow = GridView1.SelectedRow;

            Trivia t = new Trivia();

            t.Description = selectedRow.Cells[2].Text;
            t.Day = selectedRow.Cells[3].Text;            
            t.Month = selectedRow.Cells[4].Text;
            t.Year = selectedRow.Cells[5].Text;

            Session["SuggestionForTrivia"] = t;
            Response.Redirect("~/TriviaPages/AddTrivia.aspx");
        }
    }
}