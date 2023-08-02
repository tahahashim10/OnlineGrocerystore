<%@ Page Title="" Language="C#" MasterPageFile="~/View/Seller/SellerMaster.Master" AutoEventWireup="true" CodeBehind="Billing.aspx.cs" Inherits="OnlineGrocerystore.View.Seller.Billing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        function PrintPane1() {
            var PGrid = document.getElementById('<%=BillGV.ClientID %>');
            PGrid.border = 0;
            var Pwin = window.open('', 'PrintGrid', 'left=100,top=100,width=1024,height=768,tollbar=0,scrollbars=1,status=0,resizable=1');
            Pwin.document.write(PGrid.outerHTML);
            Pwin.document.close();
            Pwin.focus();
            Pwin.print();
            Pwin.close();

        }

    </script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Mybody" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">
                <div class="col">
                    <br />
                <img src="../../Asset/Images/Dollar_sign_in_circle_cleaned_(PD_version).green.svg.png" width="100" height="100"/><br /><br />        
                <label id="ErrMsg" runat="server" class="text-danger"></label><br />
                    <asp:Button Text="Add To Bill" class="btn btn-warning" runat="server" ID="AddToBillBtn" OnClick="AddToBillBtn_Click" />
                    <asp:Button Text="Reset" class="btn btn-success" runat="server" ID="ResetBtn" OnClick="ResetBtn_Click" />
                    </div>
                <div class="row">
                    <div class="col">
                 <div class="mb-3">
                 <label for="exampleInputEmail1" class="form-label">Product Name</label>
                 <input type="text" class="form-control" id="PNameTb" runat="server" required="required">
                 </div>
                 <div class="mb-3">
                 <label for="exampleInputEmail1" class="form-label">Product Price</label>
                 <input type="text" class="form-control" id="PrPriceTb" runat="server" required="required">
                 </div>
                 <div class="mb-3">
                 <label for="exampleInputEmail1" class="form-label">Product Qty</label>
                 <input type="text" class="form-control" id="PrQtyTb" runat="server" required="required">
                 </div>   
                    </div>
                    
                </div>

                <div class="row">
                    <div class="col">
                        <asp:GridView runat="server" class="table table-hover" ID="ProductGV" AutoGenerateSelectButton="True" OnSelectedIndexChanged="ProductGV_SelectedIndexChanged">
                        </asp:GridView>
                    </div>

                </div>

            </div>

            <div class="col-md-7">
                <div class="row">
                    <div class="col-3"></div>
                    <div class="col"><h1 class="text-warning pl-2">Client Billing</h1></div>
                </div>
                <div class="row">
                    <asp:GridView ID="BillGV" runat="server" class="table">

                    </asp:GridView>
                </div>
                <div class="row">
                    <div class="col"></div>
                    <div class="col"><h3 id="GrdTotTb" class="text-danger" runat="server"></h3></div>
                    <div class="col d-grid"> <asp:Button Text="Print Bill" class="btn btn-warning btn-block text-white" ID="PrintBtn" OnClientClick="PrintPane1()" runat="server" OnClick="PrintBtn_Click" /></div>
                </div>
            </div>
        </div >
    </div>
</asp:Content>
