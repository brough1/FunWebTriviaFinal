using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FunWebTriviaFinal.Models;
using FunWebTriviaFinal.Classes;

namespace FunWebTriviaFinal.Account
{
    public partial class EditFavorite : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string favoriteSubject = ddlFavoriteSubject.SelectedValue;

            User u = (User)Session["User"];
            u.FavoriteTopic = favoriteSubject;
            UserDA.UpdateUser(u);
            Session["User"] = u;
            Session["Message"] = "Favorite Subject Updated!";
            Response.Redirect("~/Account/UserProfile");
        }
    }
}