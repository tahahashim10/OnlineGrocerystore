using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineGrocerystore.View
{
    public partial class Registrar : System.Web.UI.Page
    {
        bool flag = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            Con = new Models.Functions();
        }
        public static string Name = "";
        int SKey;
        //Add this method
        public override void VerifyRenderingInServerForm(Control control)
        {

        }
        Models.Functions Con;
        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (UserPasswordTb.Value == "" || EmailId.Value == "" || NameTb.Value == "" || PhoneTb.Value == "" || AddressTb.Value == "")
                {
                    ErrMsg.InnerText = "Missing Data";
                }
                else
                {
                    SqlConnection con = new SqlConnection();
                    con.ConnectionString = "Data Source=TAHAPC\\SQLEXPRESS;Initial Catalog=GroceryAspDb;Integrated Security=True";
                    con.Open();

                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "select * from SellerTbl";
                    cmd.Connection = con;

                    SqlDataReader rd = cmd.ExecuteReader();
                    while (rd.Read())
                    {
                        if (rd[2].ToString() == EmailId.Value)
                        {
                            flag = true;
                            break;
                        }
                    }
                    if (flag == true)
                    {
                        ErrMsg.InnerText = "Email already in use";
                    }
                    else
                    {
                        int upCount = 0;
                        for (int i = 0; i < UserPasswordTb.Value.Length; i++)
                        {
                            if (char.IsUpper(UserPasswordTb.Value[i])) upCount++;
                        }

                        int lowCount = 0;
                        for (int i = 0; i < UserPasswordTb.Value.Length; i++)
                        {
                            if (char.IsLower(UserPasswordTb.Value[i])) lowCount++;

                        }

                        int alpnumCount = UserPasswordTb.Value.Count(char.IsLetterOrDigit);

                        if (UserPasswordTb.Value.Length < 6 || upCount == 0 || lowCount == 0 || Math.Abs(UserPasswordTb.Value.Length - alpnumCount) == 0)
                        {
                            ErrMsg.InnerText = "Password must be at least 6 characters, have at least one non alphanumeric character, have at least one lowercase, and have at least one uppercase.";
                        }
                        else
                        {
                            string Name = NameTb.Value;
                            string Email = EmailId.Value;
                            string Password = UserPasswordTb.Value;
                            string Phone = PhoneTb.Value;
                            string Address = AddressTb.Value;

                            string Query = "insert into SellerTbl values('{0}','{1}','{2}','{3}','{4}')";
                            Query = string.Format(Query, Name, Email, Password, Phone, Address);
                            Con.SetData(Query);
                            ErrMsg.InnerText = "Registred!";
                        }
                    }
                    
                }
            }
            catch (Exception Ex)
            {
                ErrMsg.InnerText = Ex.Message;
            }

        }
    }
}