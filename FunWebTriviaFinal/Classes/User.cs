using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FunWebTriviaFinal.Classes
{
    public class User
    {
        private int userID;
        private string email;
        private string password;
        private string role;
        private string firstName;
        private string lastName;
        private string favoriteTopic;

        public User()
        {

        }

        public User(int userID, string email, string password, string role, string firstName, string lastName, string favoriteTopic)
        {
            this.userID = userID;
            this.email = email;
            this.password = password;
            this.role = role;
            this.firstName = firstName;
            this.lastName = lastName;
            this.favoriteTopic = favoriteTopic;
        }

        public int UserID { get; set; }


        public string Email { get; set; }

        public string Password { get; set; }

        public string Role { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string FavoriteTopic { get; set; }
    }
}