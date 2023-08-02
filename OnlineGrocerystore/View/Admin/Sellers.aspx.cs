using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineGrocerystore.View.Admin
{
    public partial class Sellers : System.Web.UI.Page
    {
        bool flag = false;
        Models.Functions Con;
        protected void Page_Load(object sender, EventArgs e)
        {
            Con = new Models.Functions();
            ShowSellers();
        }
        //Add this method
        public override void VerifyRenderingInServerForm(Control control)
        {
            
        }
        private void ShowSellers()
        {
            string Query = "select * from SellerTbl";
            SellerGV.DataSource = Con.getData(Query);
            SellerGV.DataBind();
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if(sellerPassTb.Value == "" || SEmailTb.Value == "" || SNameTb.Value == "" || PhoneTb.Value == "" || SellAddressTb.Value == "") 
                {
                    ErrMsg.InnerText = "Missing Data";
                }else
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
                        if (rd[2].ToString() == SEmailTb.Value)
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
                        for (int i = 0; i < sellerPassTb.Value.Length; i++)
                        {
                            if (char.IsUpper(sellerPassTb.Value[i])) upCount++;
                        }

                        int lowCount = 0;
                        for (int i = 0; i < sellerPassTb.Value.Length; i++)
                        {
                            if (char.IsLower(sellerPassTb.Value[i])) lowCount++;
                            
                        }

                        int alpnumCount = sellerPassTb.Value.Count(char.IsLetterOrDigit);

                        if (sellerPassTb.Value.Length < 6 || upCount == 0 || lowCount == 0 || Math.Abs(sellerPassTb.Value.Length - alpnumCount) == 0)
                        {
                            ErrMsg.InnerText = "Password must be at least 6 characters, have at least one non alphanumeric character, have at least one lowercase, and have at least one uppercase.";
                        }
                        else
                        {
                            string SName = SNameTb.Value;
                            string SEmail = SEmailTb.Value;
                            string Password = sellerPassTb.Value;
                            string Phone = PhoneTb.Value;
                            string Address = SellAddressTb.Value;

                            string Query = "insert into SellerTbl values('{0}','{1}','{2}','{3}','{4}')";
                            Query = string.Format(Query, SName, SEmail, Password, Phone, Address);
                            Con.SetData(Query);
                            ShowSellers();
                            ErrMsg.InnerText = "Seller Added!";
                        }
                        
                    }
                    
                }
            }
            catch (Exception Ex)
            {
                ErrMsg.InnerText = Ex.Message;
            }
        }
        int Key = 0;
        
        protected void SellerGV_SelectedIndexChanged1(object sender, EventArgs e)
        {
            SNameTb.Value = SellerGV.SelectedRow.Cells[2].Text;
            SEmailTb.Value = SellerGV.SelectedRow.Cells[3].Text;
            sellerPassTb.Value = SellerGV.SelectedRow.Cells[4].Text;
            PhoneTb.Value = SellerGV.SelectedRow.Cells[5].Text;
            SellAddressTb.Value = SellerGV.SelectedRow.Cells[6].Text;
            if (SNameTb.Value == "")
            {
                Key = 0;
            }
            else
            {
                Key = Convert.ToInt32(SellerGV.SelectedRow.Cells[1].Text);
            }
        }

        protected void EditBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (sellerPassTb.Value == "" || SEmailTb.Value == "" || SNameTb.Value == "" || PhoneTb.Value == "" || SellAddressTb.Value == "")
                {
                    ErrMsg.InnerText = "Missing Data";
                }
                else
                {
                    int upCount = 0;
                    for (int i = 0; i < sellerPassTb.Value.Length; i++)
                    {
                        if (char.IsUpper(sellerPassTb.Value[i])) upCount++;
                    }

                    int lowCount = 0;
                    for (int i = 0; i < sellerPassTb.Value.Length; i++)
                    {
                        if (char.IsLower(sellerPassTb.Value[i])) lowCount++;

                    }

                    int alpnumCount = sellerPassTb.Value.Count(char.IsLetterOrDigit);

                    if (sellerPassTb.Value.Length < 6 || upCount == 0 || lowCount == 0 || Math.Abs(sellerPassTb.Value.Length - alpnumCount) == 0)
                    {
                        ErrMsg.InnerText = "Password must be at least 6 characters, have at least one non alphanumeric character, have at least one lowercase, and have at least one uppercase.";
                    }
                    else
                    {
                        string SName = SNameTb.Value;
                        string SEmail = SEmailTb.Value;
                        string Password = sellerPassTb.Value;
                        string Phone = PhoneTb.Value;
                        string Address = SellAddressTb.Value;

                        string Query = "update SellerTbl set SellName = '{0}',SellEmail='{1}',SellPassword='{2}',SellPhone = '{3}',SellAddress = '{4}' where SellId = {5}";
                        Query = string.Format(Query, SName, SEmail, Password, Phone, Address, SellerGV.SelectedRow.Cells[1].Text);
                        Con.SetData(Query);
                        ShowSellers();
                        ErrMsg.InnerText = "Seller Updated!";
                    }
                }
            }
            catch (Exception Ex)
            {
                ErrMsg.InnerText = Ex.Message;
            }
        }

        protected void DeleteBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (sellerPassTb.Value == "")
                {
                    ErrMsg.InnerText = "Missing Data";
                }
                else
                {
                    string SName = SNameTb.Value;

                    string Query = "delete from SellerTbl where SellId = {0}";
                    Query = string.Format(Query, SellerGV.SelectedRow.Cells[1].Text);
                    Con.SetData(Query);
                    ShowSellers();
                    ErrMsg.InnerText = "Seller Deleted!";
                }
            }
            catch (Exception Ex)
            {
                ErrMsg.InnerText = Ex.Message;
            }
        }
    }
}