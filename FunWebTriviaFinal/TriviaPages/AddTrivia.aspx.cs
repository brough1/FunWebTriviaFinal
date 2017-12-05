using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FunWebTriviaFinal.Classes;
using FunWebTriviaFinal.Models;

namespace FunWebTriviaFinal.TriviaPages
{
    public partial class AddTrivia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["SuggestionForTrivia"] != null)
            {
                Trivia t = (Trivia)Session["SuggestionForTrivia"];
                cmboDay.SelectedValue = t.Day.ToString();
                cmboMonth.SelectedValue = t.Month.ToString();
                txtDescription.Text = HttpUtility.HtmlDecode(t.Description);
                txtYear.Text = t.Year.ToString();
                Session["SuggestionForTrivia"] = null;
                Session["UserSubmitted"] = true;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int month = Convert.ToInt32(cmboMonth.SelectedValue);
            int day = Convert.ToInt32(cmboDay.SelectedValue);
            int year = Convert.ToInt32(txtYear.Text);
            string description = txtDescription.Text;

            if (month == 2)
            {
                if (day > 29)
                {
                    FailureText.Text = "You can't have more days than are ever in a month<br>(February must be less than 29)";
                    ErrorMessage.Visible = true;
                }
                else
                {
                    Trivia t = new Trivia();
                    t.Description = description;
                    t.Year = year;
                    t.Day = day;
                    t.Month = month;
                    TriviaDA.AddTrivia(t);
                    if ((bool)Session["UserSubmitted"])
                    {
                        int suggestionID = (int)Session["SuggestionID"];
                        TriviaDA.AddApprovedSuggestion(suggestionID, t.TriviaID);
                    }
                    FailureText.Text = "Trivia Added!";
                    ErrorMessage.Visible = true;
                    txtDescription.Text = "";
                    txtYear.Text = "";
                    cmboDay.SelectedIndex = 0;
                    cmboMonth.SelectedIndex = 0;
                }
            }
            else if (month == 4 || month == 6 || month == 9 || month == 11)
            {
                if (day > 30)
                {
                    FailureText.Text = "You can't have more days than are ever in a month<br>(April, June, September, and November must be less than 30)";
                    ErrorMessage.Visible = true;
                }
                else
                {
                    
                    Trivia t = new Trivia();
                    t.Description = description;
                    t.Year = year;
                    t.Day = day;
                    t.Month = month;
                    TriviaDA.AddTrivia(t);
                    t.TriviaID = TriviaDA.GetTriviaIDByDescription(description);
                    if ((bool)Session["UserSubmitted"])
                    {
                        int suggestionID = Convert.ToInt32(Session["SuggestionID"]);
                        TriviaDA.AddApprovedSuggestion(suggestionID, t.TriviaID);
                    }

                    FailureText.Text = "Trivia Added!";
                    ErrorMessage.Visible = true;
                    txtDescription.Text = "";
                    txtYear.Text = "";
                    cmboDay.SelectedIndex = 0;
                    cmboMonth.SelectedIndex = 0;
                }
            }
            else
            {
                Trivia t = new Trivia();
                t.Description = description;
                t.Year = year;
                t.Day = day;
                t.Month = month;
                TriviaDA.AddTrivia(t);
                if ((bool)Session["UserSubmitted"])
                {
                    int suggestionID = (int)Session["SuggestionID"];
                    TriviaDA.AddApprovedSuggestion(suggestionID, t.TriviaID);
                }
                FailureText.Text = "Trivia Added!";
                ErrorMessage.Visible = true;
                txtDescription.Text = "";
                txtYear.Text = "";
                cmboDay.SelectedIndex = 0;
                cmboMonth.SelectedIndex = 0;
            }
        }
    }
}