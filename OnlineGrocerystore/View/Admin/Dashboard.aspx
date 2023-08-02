<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="OnlineGrocerystore.View.Admin.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Mybody" runat="server">
    <!--<h1>Dashboard</h1>-->
    <div class="container-fluid">
        <div class="row" style="height:80px">
            <div class="col-md-3"></div>
            <div class="col-md-8">
                <div class="row">
                    <div class="col-1"><img src="../../Asset/Images/7442903.png" class="rounded" height="30" width="30"/> </div>
                    <div class="col-8"><h2 class="text-success">Grocery Dashboard</h2></div>
                </div>
                </div>
            <div class="col-md-1"></div>
        </div>
        <div class="row">
            <div class="col-1"></div>
            <div class="col-10">
                <div class="row">
                    <div class="col-md-3 bg-danger rounded">
                        <div class="row">
                            <div class="col-md-2"><img src="../../Asset/Images/download.png" width="50" height="50"/></div>
                        <div class="col-md-10">
                            <h3 class="text-white">Products</h3>
                            <h1 class="text-white" runat="server" id="PNumTb">Num</h1>
                        </div>
                        </div>
                        
                    </div>
                    <div class="col-md-1 bg-light">
                        
                    </div>
                    <div class="col-md-3 bg-warning rounded">
                        <div class="row">
                            <div class="col-md-2"><img src="../../Asset/Images/green_shoppictcart_1484336527-1.png" width="50" height="50"/></div>
                        <div class="col-md-10">
                            <h3 class="text-white">Categories</h3>
                            <h1 class="text-white" runat="server" id="CatNumTb">Num</h1>
                        </div>
                        </div>
                    </div>
                    <div class="col-md-1 bg-light">
                        
                    </div>
                    <div class="col-md-3 bg-primary rounded">
                        <div class="row">
                            <div class="col-md-2"><img src="../../Asset/Images/Dollar_sign_in_circle_cleaned_(PD_version).green.svg.png" height="45" width="45"/></div>
                        <div class="col-md-10">
                            <h3 class="text-white">Finance</h3>
                            <h1 class="text-white h3" runat="server" id="FinanceTb">Num</h1>
                        </div>
                        </div>
                    </div>
                    <div class="col-md-1 bg-light">
                        
                    </div>
                </div>
            </div>
            <div class="col-1"></div>
        </div>
        <div class="row mb-5 mt-5"></div>
        <div class="row">
            <div class="col-1"></div>
            <div class="col-10">
                <div class="row">
                            <div class="col">
                                <div class="mb-2" style="width:250px">
                   
                                    <asp:DropDownList ID="SellerCb" class="form-control" runat="server" OnSelectedIndexChanged="SellerCb_SelectedIndexChanged"></asp:DropDownList>
                </div>
                            </div>
                            <div class="col"></div>
                            <div class="col"></div>
                        </div>
                <div class="row">
                    <div class="col-md-3 bg-info rounded">
                        
                        <div class="row">
                            <div class="col-md-2"><img src="../../Asset/Images/download.png" width="50" height="50"/></div>
                        <div class="col-md-10">
                            
                            <h5 class="text-white">Categories Amount</h5>
                            <h1 class="text-white" id="AmountCatTb" runat="server">Num</h1>
                        </div>
                        </div>
                        
                    </div>
                    <div class="col-md-1 bg-light">
                        
                    </div>
                    <div class="col-md-3 bg-secondary rounded">
                        <div class="row">
                            <div class="col-md-2"><img src="../../Asset/Images/green_shoppictcart_1484336527-1.png" width="50" height="50"/></div>
                        <div class="col-md-10">
                            <h3 class="text-white">Total Sells</h3>
                            <h1 class="text-white" runat="server" id="TotalTb">Num</h1>
                        </div>
                        </div>
                    </div>
                    <div class="col-md-1 bg-light">
                        
                    </div>
                    <div class="col-md-3 bg-danger rounded">
                        <div class="row">
                            <div class="col-md-2"><img src="../../Asset/Images/Dollar_sign_in_circle_cleaned_(PD_version).green.svg.png" height="45" width="45"/></div>
                        <div class="col-md-10">
                            <h3 class="text-white">Sellers</h3>
                            <h1 class="text-white" runat="server" id="SellNumTb">Num</h1>
                        </div>
                        </div>
                    </div>
                    <div class="col-md-1 bg-light">
                        
                    </div>
                </div>
            </div>
            <div class="col-1"></div>
        </div>

        <div class="row">
            <div class="col-4"></div>
            <div class="col-4">
                <img src="../../Asset/Images/Groceries-Transparent-Images-PNG.png" height="400" width="600"/>
            </div>
            <div class="col-4"></div>
        </div>

    </div>

</asp:Content>
