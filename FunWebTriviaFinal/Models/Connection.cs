using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace FunWebTriviaFinal.Models
{
    public static class Connection
    {
        public static SqlConnection getConnection()
        {
            try
            {
                string connectionString = @"Data Source = (LocalDb)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\aspnet-FunWebTriviaFinal-20171030112704.mdf;Initial Catalog=aspnet-FunWebTriviaFinal-20171030112704;Integrated Security=True";
                SqlConnection connection = new SqlConnection(connectionString);
                return connection;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}