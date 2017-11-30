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
    public partial class UserLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string login = txtEmail.Text;
            string password = txtPassword.Text;

            User u = UserDA.GetUserByLogin(login);
            if (u != null)
            {
                if (u.Password != password)
                {
                    lblError.Text = "Incorrect Email/Password, try again!";
                    lblError.Visible = true;
                }
                else
                {
                    Session["userID"] = u.UserID;
                    Session["User"] = u;
                    Response.Redirect("~");
                }
            }
            else
            {
                lblError.Text = "Incorrect Email/Password, try again!";
                lblError.Visible = true;
            }
        }
    }
}