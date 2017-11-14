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
    }
}