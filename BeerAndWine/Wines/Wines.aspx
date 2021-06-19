<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Wines.aspx.cs" Inherits="Wines" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Wines</title>
     <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
   <meta http-equiv="X-UA-Compatible" content="IE-edge" />   
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <div class="navbar navbar-default navbar-fixed-top" role="navigation">
                <div class ="container ">
                   
                    <div class ="navbar-header">
                        <button type="button" class ="navbar-toggle " data-toggle="collapse" data-target=".navbar-collapse">
                            <span class ="sr-only">Toggle navigation</span>
                            <span class ="icon-bar"></span>
                            <span class ="icon-bar"></span>
                            <span class ="icon-bar"></span>
                        </button>
                        <a class ="navbar-brand" href="../Default.aspx" ><span ><img src="../icons/beer-wine.jpg" height ="35" /></span>Beer & Wine </a>
                      </div>
                     <div class ="navbar-collapse collapse">
                    <ul class ="nav navbar-nav navbar-right">
                        <li><a href="../Default.aspx">Home</a> </li>
                        <li class ="drodown">
                            <a href ="#" class ="dropdown-toggle" data-toggle="dropdown">Products<b class ="caret"></b></a>
                            <ul class ="dropdown-menu ">
                                <li> <a href="../Beers/Beers.aspx">Beers</a></li>
                                <li> <a href="Wines.aspx">Wines</a></li>
                            </ul>
                        </li>
                        <li id ="btnSignUp" runat="server"><a href="../SignUp.aspx">Sign Up</a> </li>
                        <li id ="btnSignIn" runat="server"><a href="../SignUp.aspx">Sign In</a> </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>               
       <br />
        <br />
        <hr />
        <div class="row" style="padding-top:50px">
    <asp:repeater ID="rptrProducts" runat="server">
        <ItemTemplate> 
        	<div class="col-sm-3 col-md-3">
            <a href="ProductView.aspx?Id=<%# Eval("Id") %>" style="text-decoration:none;">
          	<div class="thumbnail" style="height:500px; width:400px">              
              	<img style="max-height:400px; max-width:300px" src="../Images/ProductImages/<%# Eval("Id") %>/<%# Eval("ImageName") %><%# Eval("Extension") %>" alt="<%# Eval("ImageName") %>"/>
              	<div class="caption"> 
                   <div class="probrand">
                      <h4><%# Eval ("BrandName") %>  </h4>
                   </div>
                   <div class="proName"> <%# Eval ("Name") %> </div>
                   <div class="proPrice"> <span class="proOgPrice" > <%# Eval ("Price") %> </span></div> 
               </div>    
          </div>
        </div>
        </ItemTemplate>
    </asp:repeater>
</div>
        <footer>
            <div class ="footer-pos ">
                <p>&copy;2020 &middot; <a href="../Default.aspx">Home</a>&middot;<a href ="#">Products</a> </p>
            </div>

        </footer>
    </form>
</body>
</html>

