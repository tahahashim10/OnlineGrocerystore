<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registrar.aspx.cs" Inherits="OnlineGrocerystore.View.Registrar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registrar</title>
    <link rel="stylesheet" href="../Asset/Lib/Bootstrap/css/bootstrap.min.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
    <div class="container-fluid">
        <div class="row" style="height:90px"></div>
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-4 shadow-lg">
                <img src="../Asset/Images/online-grocery-store.png" class="img-fluid"/>
            </div>
            <form class="col-md-4 shadow-lg" runat="server">
                <h1 class="text-success">Registrar</h1>

                <div class="mb-3">
    <label for="NameTb" class="form-label">Name</label>
    <input type="text" class="form-control" id="NameTb" runat="server" required="required"/>
  </div>
                    <div class="mb-3">
    <label for="EmailId" class="form-label">Email address</label>
    <input type="email" class="form-control" id="EmailId" runat="server" required="required"/>
    
  </div>
  <div class="mb-3">
    <label for="UserPasswordTb" class="form-label">Password</label>
    <input type="password" class="form-control" id="UserPasswordTb" runat="server" required="required"/>
  </div>
   <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Phone</label>
    <input type="text" class="form-control" id="PhoneTb" runat="server">
    
  </div>
                <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Address</label>
    <input type="text" class="form-control" id="AddressTb" runat="server">
  </div>

  <div class="mb-3 form-group">
    <input type="radio" class="form-check-input" id="SellerRadio" name="Role" runat="server"/>
    <label class="form-check-label" for="exampleCheck1">Seller</label>
  </div>
                <label id="ErrMsg" runat="server" class="text-danger"></label><br />
                <div class="mb-3 d-grid">
                    <label id="InfoMsg" runat="server" class="text-danger"></label>
                    <asp:Button text="  Registrar  " class="btn btn-success btn-block" runat="server" ID="SaveBtn" OnClick="SaveBtn_Click"/>
                    
  </div> 
<div>
      <p>Already a user?</p><nobr><a class="nav-link" href="Login.aspx">Login</a>
  </div>

            </form>
        </div>

    </div>
</body>
</html>
