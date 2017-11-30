using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FunWebTriviaFinal.Classes
{
    public class Trivia
    {
        private int triviaID;
        private string description;
        private string day;
        private string year;
        private string month;

        public Trivia()
        {
                
        }

        public Trivia(int triviaID, string description, string day, string year, string month)
        {
            this.triviaID = triviaID;
            this.description = description;
            this.day = day;
            this.year = year;
            this.month = month;
        }

        public int TriviaID { get; set; }

        public string Description { get; set; }

        public string Day { get; set; }

        public string Year { get; set; }

        public string Month { get; set; }
    }
}