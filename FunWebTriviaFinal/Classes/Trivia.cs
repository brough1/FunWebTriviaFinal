using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FunWebTriviaFinal.Classes
{
    public class Trivia
    {
        private string description;
        private int day;
        private int year;
        private int month;

        public Trivia()
        {
                
        }

        public Trivia(string description, int day, int year, int month)
        {
            this.description = description;
            this.day = day;
            this.year = year;
            this.month = month;
        }

        public string Description { get; set; }

        public int Day { get; set; }

        public int Year { get; set; }

        public int Month { get; set; }
    }
}