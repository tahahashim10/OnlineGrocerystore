using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace OnlineGrocerystore.Models
{
    public class Functions
    {
        private SqlConnection Con;
        private SqlCommand cmd;
        private DataTable dt;
        private SqlDataAdapter sda;
        private string ConnString;

        public Functions() 
        {
            ConnString = "Data Source=TAHAPC\\SQLEXPRESS;Initial Catalog=GroceryAspDb;Integrated Security=True";
            Con =  new SqlConnection(ConnString);
            cmd = new SqlCommand();
            cmd.Connection = Con;
        }

        public DataTable getData(string Query) 
        {
            dt = new DataTable();
            sda = new SqlDataAdapter(Query, ConnString);
            sda.Fill(dt);
            return dt;
        }

        public int SetData(string Query)
        {
            int Cnt = 0;
            if(Con.State == ConnectionState.Closed) 
            { 
                Con.Open();
            }
            cmd.CommandText = Query;
            Cnt = cmd.ExecuteNonQuery();
            Con.Close();
            return Cnt;
        }


    }
}