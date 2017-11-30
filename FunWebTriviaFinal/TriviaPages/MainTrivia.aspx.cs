using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FunWebTriviaFinal.Classes;
using FunWebTriviaFinal.Models;


namespace FunWebTriviaFinal.TriviaPages
{
    public partial class MainTrivia : System.Web.UI.Page
    {
        Hashtable filter;

        protected void Page_Load(object sender, EventArgs e)
        {                        
            filter = ViewState["FilterArgs"] == null ? new Hashtable() : (Hashtable)ViewState["FilterArgs"];
        }

        protected void GridView1_SelectedIndexChanged(object sender, GridViewCommandEventArgs e)
        {

            if (Session["User"] != null)
            {
                
                int index = Convert.ToInt32(e.CommandArgument);

                GridViewRow gvr = GridView1.Rows[index];
                string itemToFavorite = Server.HtmlDecode(gvr.Cells[0].Text);

                User u = (User)Session["User"];
                u = UserDA.GetUserByLogin(u.Email);
                Session["User"] = u;
                Trivia t = TriviaDA.GetTriviaByDescription(itemToFavorite);
                if (UserDA.CheckIfFavorited(u, t))
                {
                    lblError.Text = "You have already favorited that, you can't do it again!";
                    lblError.Visible = true;
                }
                else
                {
                    UserDA.SaveFavorite(u, t);

                    lblError.Text = "Favorite saved!";
                    lblError.Visible = true;
                }
            }
           else
            {
                lblError.Text = "You must be signed in to save favorites, sign-in and try again!";
                lblError.Visible = true;
            }
        }

        protected void ddDay_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList dd = (DropDownList)sender;
            if(dd.SelectedItem.Text != " ")
            {
                if (filter.ContainsKey("Day"))
                {
                    filter["Day"] = "='" + dd.SelectedValue + "'";
                }
                else
                {
                    filter.Add("Day", "='" + dd.SelectedValue + "'");
                }
            }
            else
            {
                filter.Remove("Day");
            }
            ApplyGridFilter();
            GridView1.PageIndex = 0;
        }
        protected void SetValueDay(object sender, EventArgs e)
        {
            DropDownList dd = (DropDownList)sender;
            if (filter != null)
            {
                if (filter.ContainsKey("Day"))
                {
                    foreach(ListItem li in dd.Items)
                    {
                        if(li.Text == filter["Day"].ToString().Substring(2, filter["Day"].ToString().Length - 3))
                        {
                            li.Selected = true;
                            return;
                        }
                    }
                }
            }
        }

        protected void ddMonth_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList dd = (DropDownList)sender;
            if (dd.SelectedItem.Text != " ")
            {
                if (filter.ContainsKey("Month"))
                {
                    filter["Month"] = "='" + dd.SelectedValue + "'";
                }
                else
                {
                    filter.Add("Month", "='" + dd.SelectedValue + "'");
                }
            }
            else
            {
                filter.Remove("Month");
            }
            ApplyGridFilter();
            GridView1.PageIndex = 0;
        }
        protected void SetValueMonth(object sender, EventArgs e)
        {
            DropDownList dd = (DropDownList)sender;
            if (filter != null)
            {
                if (filter.ContainsKey("Month"))
                {
                    foreach (ListItem li in dd.Items)
                    {
                        if (li.Text == filter["Month"].ToString().Substring(2, filter["Month"].ToString().Length - 3))
                        {
                            li.Selected = true;
                            return;
                        }
                    }
                }
            }
        }

        protected void ddYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList dd = (DropDownList)sender;
            if (dd.SelectedItem.Text != " ")
            {
                if (filter.ContainsKey("Year"))
                {
                    filter["Year"] = "='" + dd.SelectedValue + "'";
                }
                else
                {
                    filter.Add("Year", "='" + dd.SelectedValue + "'");
                }
            }
            else
            {
                filter.Remove("Year");
            }
            ApplyGridFilter();
            GridView1.PageIndex = 0;
        }
        protected void SetValueYear(object sender, EventArgs e)
        {
            DropDownList dd = (DropDownList)sender;
            if (filter != null)
            {
                if (filter.ContainsKey("Year"))
                {
                    foreach (ListItem li in dd.Items)
                    {
                        if (li.Text == filter["Year"].ToString().Substring(2, filter["Year"].ToString().Length - 3))
                        {
                            li.Selected = true;
                            return;
                        }
                    }
                }
            }
        }
        protected void ApplyGridFilter()
        {
            string args = " ";
            int i = 0;
            foreach (object key in filter.Keys)
            {
                if(i == 0)
                {
                    args = key.ToString() + filter[key].ToString();
                }
                else
                {
                    args += " and " + key.ToString() + filter[key].ToString();
                }
                i++;
            }
            TriviaData.FilterExpression = args;
            ViewState.Add("FilterArgs", filter);
        }

        protected void GridView1_PageIndexChanged(object sender, EventArgs e)
        {
            ApplyGridFilter();
        }
    }
}