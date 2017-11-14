using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FunWebTriviaFinal.Models;
using System.Data.SqlClient;

namespace FunWebTriviaFinal.Models
{
    public class SuggestionDA
    {
        public static List<Suggestion> GetAllSuggestions()
        {
            List<Suggestion> allSuggestions = new List<Suggestion>();

            SqlConnection connection = Connection.getConnection();

            String query = "SELECT * FROM Suggestions";
            SqlCommand cmd = new SqlCommand(query, connection);

            try
            {
                connection.Open();
                SqlDataReader read = cmd.ExecuteReader();

                while (read.Read())
                {
                    Suggestion s = new Suggestion();

                    s.Description = (String)read["description"];
                    s.Year = (int)read["year"];
                    s.Month = (int)read["month"];
                    s.Day = (int)read["day"];
                    s.Email = (String)read["email"];

                    allSuggestions.Add(s);
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
            return allSuggestions;
        }
        public static void AddSuggestion(Suggestion s)
        {
            SqlConnection connection = Connection.getConnection();

            String query = "INSERT INTO Suggestions (description, year, month, day, email) VALUES (@description, @year, @month, @day, @email);";

            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.AddWithValue("@description", s.Description);
            cmd.Parameters.AddWithValue("@year", s.Year);
            cmd.Parameters.AddWithValue("@month", s.Month);
            cmd.Parameters.AddWithValue("@day", s.Day);
            cmd.Parameters.AddWithValue("@email", s.Email);


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
    }
}