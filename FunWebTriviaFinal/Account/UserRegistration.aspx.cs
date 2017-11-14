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
    public partial class UserRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string password = txtPassword.Text;
            string first = txtFirstName.Text;
            string last = txtLastName.Text;

            User u = new User();

            u.Email = email;
            u.Password = password;
            u.FirstName = first;
            u.LastName = last;

            List<User> users = UserDA.GetAllUsers();

            foreach(User user in users)
            {
                if(user.Email == u.Email)
                {
                    lblError.Text = "That email is taken, try another one or sign in to your account.";
                    lblError.Visible = true;
                    break;
                }
                else
                {
                    Session["user"] = u;
                    UserDA.AddUser(u);
                }
            }
        }
    }
}