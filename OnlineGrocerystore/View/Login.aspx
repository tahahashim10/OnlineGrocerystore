<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OnlineGrocerystore.View.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link rel="stylesheet" href="../Asset/Lib/Bootstrap/css/bootstrap.min.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<body>
    
    <div class="container-fluid">
        <div class="row" style="height:90px"></div>
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-4 shadow-lg">
                <img src="../Asset/Images/Grocery-bag-with-items-spilling-out-vert-2.png" class="img-fluid"/>
            </div>
            <form class="col-md-4 shadow-lg" runat="server">
                <h1 class="text-success">Sign In</h1>

                
                    <div class="mb-3">
    <label for="EmailId" class="form-label">Email address</label>
    <input type="email" class="form-control" id="EmailId" runat="server" required="required"/>
    
  </div>
  <div class="mb-3">
    <label for="UserPasswordTb" class="form-label">Password</label>
    <input type="password" class="form-control" id="UserPasswordTb" runat="server" required="required"/>
  </div>
  <div class="mb-3 form-group">
    <input type="radio" class="form-check-input" id="SellerRadio" name="Role" runat="server"/>
    <label class="form-check-label" for="exampleCheck1">Seller</label>
      <input type="radio" class="form-check-input" id="AdminRadio" checked="true" name="Role" runat="server"/>
    <label class="form-check-label" for="AdminRadio">Admin</label>
  </div>
                <div class="mb-3 d-grid">
                    <label id="InfoMsg" runat="server" class="text-danger"></label>
                    <asp:Button text="  Login  " class="btn btn-success btn-block" runat="server" ID="SaveBtn" OnClick="SaveBtn_Click"/>
                    
  </div> 
  <div>
      <p>New to this app?</p><a class="nav-link" href="Registrar.aspx">Join now</a>
  </div>

            </form>
        </div>

    </div>
</body>
</html>
