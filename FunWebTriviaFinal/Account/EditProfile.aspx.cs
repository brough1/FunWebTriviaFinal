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
    public partial class EditProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["Changing"] == null)
            {
                Response.Redirect("~");
            }
            lblBasicChange.Text = (string)Session["Changing"];
        }

        protected void btnBasicSubmit_Click(object sender, EventArgs e)
        {
            if ((string)Session["Changing"] == "email")
            {
                string changedValue = txtChangedValue.Text;
                List<User> users = UserDA.GetAllUsers();
                bool noDuplicates = false;
                foreach (User user in users)
                {
                    if (user.Email == changedValue)
                    {
                        lblError.Text = "That email is already taken, try another one. If you want to leave it unchanged, click on your profile or go to the home.";
                        lblError.Visible = true;
                        noDuplicates = false;
                        break;
                    }
                    else
                    {
                        noDuplicates = true;
                    }
                }
                if (noDuplicates)
                {
                    User u = (User)Session["User"];
                    u.Email = changedValue;
                    UserDA.UpdateUser(u);
                    Session["Message"] = "Email Updated!";
                    Response.Redirect("~/Account/UserProfile");
                }
            }
            else if ((string)Session["Changing"] == "first name")
            {
                string changedValue = txtChangedValue.Text;
                User u = (User)Session["User"];
                u.FirstName = changedValue;
                UserDA.UpdateUser(u);
                Session["Message"] = "Name Updated!";
                Response.Redirect("~/Account/UserProfile");
            }
            else if ((string)Session["Changing"] == "last name")
            {
                string changedValue = txtChangedValue.Text;
                User u = (User)Session["User"];
                u.LastName = changedValue;
                UserDA.UpdateUser(u);
                Session["Message"] = "Name Updated!";
                Response.Redirect("~/Account/UserProfile");
            }
        }
    }
}