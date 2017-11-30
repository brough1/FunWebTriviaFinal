using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FunWebTriviaFinal.Classes;
using System.Data.SqlClient;

namespace FunWebTriviaFinal.Models
{
    public class UserDA
    {
        public static User GetUserByLogin(String email)
        {
            if (email == null) return null;
            User u = new User();

            SqlConnection connection = Connection.getConnection();
            if (connection != null)
            {
                connection.Open();
            }

            String query = "SELECT * FROM Users WHERE email = @email";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.AddWithValue("@email", email);

            try
            {
                SqlDataReader read = cmd.ExecuteReader();

                if (read.Read())
                {

                    u.UserID = (int)read["userID"];
                    u.Email = (String)read["email"];
                    u.Password = (String)read["password"];
                    u.Role = (String)read["role"];
                    u.FirstName = (String)read["firstName"];
                    u.LastName = (String)read["lastName"];
                    u.FavoriteTopic = (String)read["favoriteTopic"];
                }
                else return null;

            }
            catch (SqlException ex)
            {
                return null;
            }
            catch (Exception ex)
            {
                return null;
            }
            finally
            {
                connection.Close();
            }
            return u;
        }
        public static void AddUser(User u)
        {
            SqlConnection connection = Connection.getConnection();

            String query = "INSERT INTO Users (email, password, firstName, lastName, favoriteTopic) values (@email, @password, @firstName, @lastName, @favoriteTopic)";

            SqlCommand cmd = new SqlCommand(query, connection);

            cmd.Parameters.AddWithValue("@email", u.Email);
            cmd.Parameters.AddWithValue("@password", u.Password);
            cmd.Parameters.AddWithValue("@firstName", u.FirstName);
            cmd.Parameters.AddWithValue("@lastName", u.LastName);
            cmd.Parameters.AddWithValue("@favoriteTopic", u.FavoriteTopic);

            try
            {
                connection.Open();
                cmd.ExecuteNonQuery();
            }
            catch(SqlException ex)
            {

            }
            catch(Exception ex)
            {

            }
            finally
            {
                connection.Close();
            }
        }
        public static List<User> GetAllUsers()
        {
            List<User> allUsers = new List<User>();

            SqlConnection conn = Connection.getConnection();

            String query = "Select * from Users";
            SqlCommand cmd = new SqlCommand(query, conn);

            try
            {
                conn.Open();
                SqlDataReader read = cmd.ExecuteReader();

                while (read.Read())
                {
                    User u = new User();

                    u.UserID = (int)read["userID"];
                    u.Email = (String)read["email"];
                    u.FirstName = (String)read["firstName"];
                    u.LastName = (String)read["lastName"];
                    u.Password = (String)read["password"];
                    u.Role = (String)read["role"];
                    u.FavoriteTopic = (String)read["favoriteTopic"];

                    allUsers.Add(u);
                }
            }
            catch(SqlException ex)
            {

            }
            catch(Exception ex)
            {

            }
            finally
            {
                conn.Close();
            }
            return allUsers;
        }

        public static void SaveFavorite(User u, Trivia t)
        {
            SqlConnection connection = Connection.getConnection();

            String query = "INSERT INTO Favorites (userID, triviaID) values (@userID, @triviaID)";

            SqlCommand cmd = new SqlCommand(query, connection);

            cmd.Parameters.AddWithValue("@triviaID", t.TriviaID);
            cmd.Parameters.AddWithValue("@userID", u.UserID);

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
        public static bool CheckIfFavorited(User u, Trivia t)
        {
            bool exists = false;
            SqlConnection connection = Connection.getConnection();

            String query = "SELECT COUNT(*) FROM Favorites WHERE userID = @userID AND triviaID = @triviaID";

            SqlCommand cmd = new SqlCommand(query, connection);

            cmd.Parameters.AddWithValue("@userID", u.UserID);
            cmd.Parameters.AddWithValue("@triviaID", t.TriviaID);

            try
            {
                connection.Open();
                int valueExist = (int)cmd.ExecuteScalar();

                if(valueExist > 0)
                {
                    exists = true;
                    return exists;
                }
                else
                {
                    exists = false;
                    return exists;
                }
                              
            }
            catch(SqlException ex)
            {

            }
            catch(Exception ex)
            {

            }
            finally
            {
                connection.Close();
            }
            return exists;
        }
        public static void DeleteFavorite(int userID, int triviaID)
        {
            SqlConnection connection = Connection.getConnection();

            String query = "Delete From Favorites where userID = @userID and triviaID = @triviaID";

            SqlCommand cmd = new SqlCommand(query, connection);

            cmd.Parameters.AddWithValue("@triviaID", triviaID);
            cmd.Parameters.AddWithValue("@userID", userID);

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
        public static void UpdateUser(User u)
        {
            SqlConnection connection = Connection.getConnection();

            String query = "Update Users SET email = @email, password = @password, firstName = @firstName, lastName = @lastName, favoriteTopic = @favoriteTopic WHERE userID = @userID";

            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.AddWithValue("@email", u.Email);
            cmd.Parameters.AddWithValue("@password", u.Password);
            cmd.Parameters.AddWithValue("@firstName", u.FirstName);
            cmd.Parameters.AddWithValue("@lastName", u.LastName);
            cmd.Parameters.AddWithValue("@favoriteTopic", u.FavoriteTopic);
            cmd.Parameters.AddWithValue("@userID", u.UserID);

            try
            {
                connection.Open();
                cmd.ExecuteNonQuery();
            }
            catch(SqlException ex)
            {
               
            }
            catch(Exception ex)
            {

            }
            finally
            {
                connection.Close();
            }
        }

    }
}