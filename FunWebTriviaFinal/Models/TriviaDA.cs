using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using FunWebTriviaFinal.Classes;

namespace FunWebTriviaFinal.Models
{
    public class TriviaDA
    {
        public static void AddTrivia(Trivia t)
        {
            SqlConnection connection = Connection.getConnection();

            String query = "INSERT INTO Trivia (description, year, month, day) VALUES (@description, @year, @month, @day);";

            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.AddWithValue("@description", t.Description);
            cmd.Parameters.AddWithValue("@year", t.Year);
            cmd.Parameters.AddWithValue("@month", t.Month);
            cmd.Parameters.AddWithValue("@day", t.Day);


            try
            {
                connection.Open();
                cmd.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {

            }
            catch (Exception ex)
            {

            }
            finally
            {
                connection.Close();
            }
        }
        public static void AddApprovedSuggestion(int suggestionID, int triviaID)
        {
            SqlConnection connection = Connection.getConnection();

            String query = "INSERT INTO ApprovedSuggestions VALUES (@suggestionID, @triviaID);";

            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.AddWithValue("@suggestionID", suggestionID);
            cmd.Parameters.AddWithValue("@triviaID", triviaID);           


            try
            {
                connection.Open();
                cmd.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {

            }
            catch (Exception ex)
            {

            }
            finally
            {
                connection.Close();
            }
        }
        public static Trivia GetTriviaByDescription(string d)
        {
            SqlConnection connection = Connection.getConnection();

            String query = "Select * from Trivia where Description = @description;";

            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.AddWithValue("@description", d);


            try
            {
                connection.Open();
                SqlDataReader read = cmd.ExecuteReader();

                if (read.Read())
                {
                    Trivia t = new Trivia();

                    t.TriviaID = (int)read["triviaID"];
                    t.Description = (String)read["description"];
                    t.Day = (int)read["day"];
                    t.Month = (int)read["month"];
                    t.Year = (int)read["year"];

                    return t;
                }
            }
            catch (SqlException ex)
            {

            }
            catch (Exception ex)
            {

            }
            finally
            {
                connection.Close();
            }
            return null;
        }
        public static int GetTriviaIDByDescription(string description)
        {
            SqlConnection connection = Connection.getConnection();

            String query = "Select triviaID from Trivia where Description = @description;";

            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.AddWithValue("@description", description);


            try
            {
                connection.Open();
                SqlDataReader read = cmd.ExecuteReader();

                if (read.Read())
                {
                    int t = (int)read["triviaID"];

                    return t;
                }
            }
            catch (SqlException ex)
            {

            }
            catch (Exception ex)
            {

            }
            finally
            {
                connection.Close();
            }
            return 0;
        }

        public static Trivia GetTriviaByDayAndMonth(int day, int month)
        {
            SqlConnection connection = Connection.getConnection();

            String query = "Select * from Trivia where day = @day AND month = @month;";

            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.AddWithValue("@day", day);
            cmd.Parameters.AddWithValue("@month", month);


            try
            {
                connection.Open();
                SqlDataReader read = cmd.ExecuteReader();

                if (read.Read())
                {
                    Trivia t = new Trivia();
                    t.Day = day;
                    t.Month = month;
                    t.Description = (string)read["description"];
                    t.Year = (int)read["year"];
                    t.TriviaID = (int)read["triviaID"];
                    return t;
                }
            }
            catch (SqlException ex)
            {

            }
            catch (Exception ex)
            {

            }
            finally
            {
                connection.Close();
            }
            return null;
        }
    }
}