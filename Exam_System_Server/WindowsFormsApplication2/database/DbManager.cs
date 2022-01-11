using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WindowsFormsApplication2.Models;

namespace WindowsFormsApplication2.database
{
    class DbManager
    {
        public SqlConnection connection;
        public SqlCommand command;

        public DbManager()
        {
            connection = new SqlConnection();
            connection.ConnectionString = @"Data Source=DESKTOP-9GE7TCV;Initial Catalog=examdb;Integrated Security=True";
            command = new SqlCommand();
            command.Connection = connection;
            command.CommandType = CommandType.Text;
        } 

    }
}
