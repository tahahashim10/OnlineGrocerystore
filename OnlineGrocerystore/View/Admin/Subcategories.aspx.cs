using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineGrocerystore.View.Admin
{
    public partial class Subcategories : System.Web.UI.Page
    {
        Models.Functions Con;
        protected void Page_Load(object sender, EventArgs e)
        {
            Con = new Models.Functions();
            if (!Page.IsPostBack)
            {
                GetCategories();
                ShowSubcategories();
            }
        }
        private void GetCategories()
        {
            string Query = "Select * from CategoryTbl";
            SubcatOrgCatTb.DataTextField = Con.getData(Query).Columns["CatName"].ToString();
            SubcatOrgCatTb.DataValueField = Con.getData(Query).Columns["CatId"].ToString();
            SubcatOrgCatTb.DataSource = Con.getData(Query);
            SubcatOrgCatTb.DataBind();
        }
        //Add this method
        public override void VerifyRenderingInServerForm(Control control)
        {

        }
        private void ShowSubcategories()
        {
            string Query = "select * from SubcategoryTbl";
            SubcategoryGV.DataSource = Con.getData(Query);
            SubcategoryGV.DataBind();
        }
        int Key = 0;
        protected void SubcategoryGV_SelectedIndexChanged(object sender, EventArgs e)
        {
            SubcatNameTb.Value = SubcategoryGV.SelectedRow.Cells[2].Text;
            SubcatOrgCatTb.SelectedValue = SubcategoryGV.SelectedRow.Cells[3].Text;
            SubcatRemarkTb.Value = SubcategoryGV.SelectedRow.Cells[4].Text;
            if (SubcatNameTb.Value == "")
            {
                Key = 0;
            }
            else
            {
                Key = Convert.ToInt32(SubcategoryGV.SelectedRow.Cells[1].Text);
            }
        }

        protected void EditBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (SubcatNameTb.Value == "" || SubcatOrgCatTb.DataTextField == "" || SubcatRemarkTb.Value == "")
                {
                    ErrMsg.InnerText = "Missing Data";
                }
                else
                {
                    string CName = SubcatNameTb.Value;
                    string CCat = SubcatOrgCatTb.SelectedValue;
                    string CRem = SubcatRemarkTb.Value;

                    string Query = "update SubcategoryTbl set SubcatName = '{0}',SubcatOrgCat='{1}',SubcatDescription='{2}' where SubcatId = {3}";
                    Query = string.Format(Query, CName, CCat, CRem, SubcategoryGV.SelectedRow.Cells[1].Text);
                    Con.SetData(Query);
                    ShowSubcategories();
                    ErrMsg.InnerText = "Subcategory Updated!";
                }
            }
            catch (Exception Ex)
            {
                ErrMsg.InnerText = Ex.Message;
            }
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (SubcatNameTb.Value == "" || SubcatOrgCatTb.DataTextField == "" || SubcatRemarkTb.Value == "")
                {
                    ErrMsg.InnerText = "Missing Data";
                }
                else
                {
                    string CName = SubcatNameTb.Value;
                    string CCat = SubcatOrgCatTb.SelectedValue;
                    string CRem = SubcatRemarkTb.Value;

                    string Query = "insert into SubcategoryTbl values('{0}','{1}','{2}')";
                    Query = string.Format(Query, CName, CCat, CRem);
                    Con.SetData(Query);
                    ShowSubcategories();
                    ErrMsg.InnerText = "Subcategory Added!";
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
                if (SubcatNameTb.Value == "")
                {
                    ErrMsg.InnerText = "Missing Data";
                }
                else
                {
                    string Query = "delete from SubcategoryTbl where SubcatId = {0}";
                    Query = string.Format(Query, SubcategoryGV.SelectedRow.Cells[1].Text);
                    Con.SetData(Query);
                    ShowSubcategories();
                    ErrMsg.InnerText = "Subcategory Deleted!";
                }
            }
            catch (Exception Ex)
            {
                if (Ex.Message.Contains("The DELETE statement conflicted with the REFERENCE constraint \"FK7\""))
                {
                    ErrMsg.InnerText = "Delete all products connected to this subcategory first!";
                }
                else
                {
                    ErrMsg.InnerText = Ex.Message;
                }
            }
        }
    }
}