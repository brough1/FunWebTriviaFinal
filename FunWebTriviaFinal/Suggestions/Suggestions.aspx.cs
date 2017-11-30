using FunWebTriviaFinal.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FunWebTriviaFinal.Classes;
namespace FunWebTriviaFinal.Suggestions
{
    public partial class Suggestions : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["User"] != null)
            {
                User u = (User)Session["User"];
                txtEmail.Text = u.Email;
                txtEmail.ReadOnly = true;
                lblEmailMessage.Visible = true;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int month = Convert.ToInt32(cmboMonth.SelectedValue);
            int day = Convert.ToInt32(cmboDay.SelectedValue);
            int year = Convert.ToInt32(txtYear.Text);
            string email = txtEmail.Text;
            string description = txtDescription.Text;

            if(month == 2)
            {
                if(day > 29)
                {
                    FailureText.Text = "You can't have more days than are ever in a month<br>(February must be less than 29)";
                    ErrorMessage.Visible = true;
                }
                else
                {
                    Suggestion s = new Suggestion();
                    s.Description = description;
                    s.Email = email;
                    s.Year = year;
                    s.Day = day;
                    s.Month = month;
                    SuggestionDA.AddSuggestion(s);
                    Response.Redirect("SuggestionThankYou.aspx");
                }
            }
            else if(month == 4 || month == 6 || month == 9 || month == 11)
            {
                if(day > 30)
                {
                    FailureText.Text = "You can't have more days than are ever in a month<br>(April, June, September, and November must be less than 30)";
                    ErrorMessage.Visible = true;
                }
                else
                {
                    Suggestion s = new Suggestion();
                    s.Description = description;
                    s.Email = email;
                    s.Year = year;
                    s.Day = day;
                    s.Month = month;
                    SuggestionDA.AddSuggestion(s);
                    Response.Redirect("SuggestionThankYou.aspx");
                }
            }
            else
            {
                Suggestion s = new Suggestion();
                s.Description = description;
                s.Email = email;
                s.Year = year;
                s.Day = day;
                s.Month = month;
                SuggestionDA.AddSuggestion(s);
                Response.Redirect("SuggestionThankYou.aspx");
            }
        }
    }
}