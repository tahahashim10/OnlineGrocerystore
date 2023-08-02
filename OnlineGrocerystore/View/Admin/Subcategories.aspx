<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Subcategories.aspx.cs" Inherits="OnlineGrocerystore.View.Admin.Subcategories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Mybody" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-8">
                <br />
                <img src="../../Asset/Images/Untitled Project (1).jpg" /><h4 class="text-success">Manage Subcategories</h4>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <h2 class="text-success">Subcategory Details</h2>

                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Subcategory Name</label>
                    <input type="text" class="form-control" id="SubcatNameTb" runat="server">
                </div>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Subcategory Original Category</label>
                    <!--<input type="text" class="form-control" id="CategoryCb" runat="server">-->
                    <asp:DropDownList ID="SubcatOrgCatTb" class="form-control" runat="server"></asp:DropDownList>
                </div>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Subcategory Remarks</label>
                    <input type="text" class="form-control" id="SubcatRemarkTb" runat="server">
                </div>

                <br /><br /><br />
                <label id="ErrMsg" runat="server" class="text-danger"></label><br />
                <asp:Button Text="  Edit  " class="btn btn-success" runat="server" ID="EditBtn" OnClick="EditBtn_Click" />
                <asp:Button Text="  Save  " class="btn btn-success" runat="server" ID="SaveBtn" OnClick="SaveBtn_Click" />
                <asp:Button Text="Delete" class="btn btn-success" runat="server" ID="DeleteBtn" OnClick="DeleteBtn_Click" />
            </div>
            <div class="col-md-8">
                <asp:GridView runat="server" class="table table-hover" ID="SubcategoryGV" AutoGenerateSelectButton="True" OnSelectedIndexChanged="SubcategoryGV_SelectedIndexChanged">
                </asp:GridView>
            </div>

        </div>
    </div>
</asp:Content>
