<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="OnlineGrocerystore.View.Admin.Categories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Mybody" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-8"><br /><img src="../../Asset/Images/Untitled Project (1).jpg"/><h4 class="text-success">Manage Categories</h4></div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <h2 class="text-success">Category Details</h2>
                
                    <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Category Name</label>
    <input type="text" class="form-control" id="CatNameTb" runat="server">
    
  </div>
                    <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Category Remarks</label>
    <input type="text" class="form-control" id="CatRemarkTb" runat="server">
    
  </div>
                <br /><br /><br />
                <label id="ErrMsg" runat="server" class="text-danger"></label><br />
                <asp:Button Text="  Edit  " class="btn btn-success" runat="server" ID="EditBtn" OnClick="EditBtn_Click" />
                <asp:Button Text="  Save  " class="btn btn-success" runat="server" ID="SaveBtn" OnClick="SaveBtn_Click" />
                <asp:Button Text="Delete" class="btn btn-success" runat="server" ID="DeleteBtn" OnClick="DeleteBtn_Click" />
            </div>
            <div class="col-md-8">
                <asp:GridView runat="server" class="table table-hover" ID="CategoryGV" AutoGenerateSelectButton="True" OnSelectedIndexChanged="CategoryGV_SelectedIndexChanged">

                </asp:GridView>
            </div>

        </div>
    </div>
</asp:Content>
