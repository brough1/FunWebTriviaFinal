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
                string connectionString = @"Data Source =(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\br590523\Documents\FunWebTriviaDB.mdf;Integrated Security=True;Connect Timeout=30" ;
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