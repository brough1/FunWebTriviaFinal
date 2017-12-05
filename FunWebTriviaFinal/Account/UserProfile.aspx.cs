using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FunWebTriviaFinal.Classes;
using FunWebTriviaFinal.Models;

namespace FunWebTriviaFinal.Account
{
    public partial class UserProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["Message"] != null)
            {
                lblMessage.Text = (string)Session["Message"];
                lblMessage.Visible = true;
                Session["Message"] = null;
            }
            if (Session["User"] == null)
            {
                Response.Redirect("~");
            }
            else
            {
                User u = (User)Session["User"];
                if (u.Role == "admin")
                {
                    pnlAdminSection.Visible = true;
                }
            }
            User user = (User)Session["User"];
            lblFirstName.Text = user.FirstName;
            lblEmail.Text = user.Email;
            lblLastName.Text = user.LastName;
            lblFavorite.Text = user.FavoriteTopic;
            if(GridView1.Rows.Count == 0)
            {
                lblEmpty.Visible = true;
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string description = GridView1.Rows[e.RowIndex].Cells[0].ToString();
            int triviaID = TriviaDA.GetTriviaIDByDescription(description);
            int userID = (int)Session["UserID"];

            UserDA.DeleteFavorite(userID, triviaID);
            lblMessage.Text = "Favorite Deleted!";
            lblMessage.Visible = true;


        }

        protected void btnEmailChange_Click(object sender, EventArgs e)
        {
            User user = (User)Session["User"];
            Session["Changing"] = "email";
            Response.Redirect("~/Account/EditProfile");
        }

        protected void btnFirstNameChange_Click(object sender, EventArgs e)
        {
            User user = (User)Session["User"];
            Session["Changing"] = "first name";
            Response.Redirect("~/Account/EditProfile");
        }

        protected void btnLastNameChange_Click(object sender, EventArgs e)
        {
            User user = (User)Session["User"];
            Session["Changing"] = "last name";
            Response.Redirect("~/Account/EditProfile");
        }

        protected void btnFavoriteChange_Click(object sender, EventArgs e)
        {
            User user = (User)Session["User"];
            Response.Redirect("~/Account/EditFavorite");
        }

        protected void btnPasswordChange_Click(object sender, EventArgs e)
        {
            User user = (User)Session["User"];
            Response.Redirect("~/Account/EditPassword");
        }


    }
}