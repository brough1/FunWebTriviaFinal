using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FunWebTriviaFinal.Models
{
    public class Suggestion
    {
        //declare variables
        private string description;
        private string email;
        private int day;
        private int month;
        private int year;

        public Suggestion()
        {

        }

        public Suggestion(string description, string email, int day, int month, int year)
        {
            this.description = description;
            this.email = email;
            this.day = day;
            this.month = month;
            this.year = year;
        }

        public string Description { get; set; }

        public string Email { get; set; }

        public int Day { get; set; }

        public int Month { get; set; }

        public int Year { get; set; }

    }
}