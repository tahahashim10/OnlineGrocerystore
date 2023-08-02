<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Sellers.aspx.cs" Inherits="OnlineGrocerystore.View.Admin.Sellers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Mybody" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-8"><br /><img src="../../Asset/Images/Untitled Project (1).jpg"/><h4 class="text-success">Manage Sellers</h4></div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <h2 class="text-success">Seller Details</h2>
                
                    <div class="mb-3">
    <label for="SNameTb" class="form-label">Seller Name</label>
    <input type="text" class="form-control" id="SNameTb" runat="server">
    
  </div>
                    <div class="mb-3">
    <label for="SEmailTb" class="form-label">Seller Email</label>
    <input type="email" class="form-control" id="SEmailTb" runat="server">
    
  </div>
                    <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Seller Password</label>
    <input type="text" class="form-control" id="sellerPassTb" runat="server">
    
  </div>
                <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Seller Phone</label>
    <input type="text" class="form-control" id="PhoneTb" runat="server">
    
  </div>
                <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Seller Address</label>
    <input type="text" class="form-control" id="SellAddressTb" runat="server">
  </div>
                <label id="ErrMsg" runat="server" class="text-danger"></label><br />
                <asp:Button Text="  Edit  " class="btn btn-success" runat="server" ID="EditBtn" OnClick="EditBtn_Click" />
                <asp:Button Text="  Save  " class="btn btn-success" runat="server" ID="SaveBtn" OnClick="SaveBtn_Click" />
                <asp:Button Text="Delete" class="btn btn-warning" runat="server" ID="DeleteBtn" OnClick="DeleteBtn_Click" />
            </div>
            <div class="col-md-8">
                <asp:GridView runat="server" class="table table-hover" ID="SellerGV" AutoGenerateSelectButton="True" OnSelectedIndexChanged="SellerGV_SelectedIndexChanged1">

                </asp:GridView>
            </div>

        </div>
    </div>
</asp:Content>
