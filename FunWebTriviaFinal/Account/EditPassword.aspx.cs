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
    public partial class EditPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if((string)Session["Changing"] == null)
            {
                Response.Redirect("~");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string oldPassword = txtOldPassword.Text;
            string newPassword = txtNewPassword.Text;
            User u = (User)Session["User"];
            if(oldPassword != u.Password)
            {
                lblError.Text = "Incorrect old password, try again!";
                lblError.Visible = true;
            }
            else
            {
                u.Password = newPassword;
                UserDA.UpdateUser(u);
                Session["User"] = u;
                Session["Message"] = "Password Successfully Changed!";
                Response.Redirect("~/Account/UserProfile.aspx");
            }
        }
    }
}