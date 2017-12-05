using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FunWebTriviaFinal.Classes;
using FunWebTriviaFinal.Models;

namespace FunWebTriviaFinal
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime now = DateTime.Now;
            string day = now.Day.ToString();
            string month = now.Month.ToString();

            Trivia todaysFact = TriviaDA.GetTriviaByDayAndMonth(day, month);

            if(todaysFact == null)
            {
                lblTrivia.Text = "There are no facts for today yet, go to the <a href='suggestions/suggestions.aspx'>suggestions page</a> and recommend one for us!";
            }
            else
            {
                lblTrivia.Text = todaysFact.Description;
                lblYear.Text = "Year: " + todaysFact.Year;
                lblYear.Visible = true;
            }
        }
    }
}