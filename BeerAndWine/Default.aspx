<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Beer & Wine</title>


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
                        <a class ="navbar-brand" href ="Default.aspx" ><span ><img src="icons/beer-wine.jpg" height ="35" /></span>Beer & Wine </a>
                      </div>
                     <div class ="navbar-collapse collapse">
                    <ul class ="nav navbar-nav navbar-right">
                        <li class ="active"><a href ="Default.aspx">Home</a> </li>
                        <li class ="drodown">
                            <a href ="#" class ="dropdown-toggle" data-toggle="dropdown">Products<b class ="caret"></b></a>
                            <ul class ="dropdown-menu ">
                                <li> <a href="Beers/Beers.aspx">Beers</a></li>
                                <li> <a href="Wines/Wines.aspx">Wines</a></li>
                            </ul>

                        </li>
                        <li id ="btnSignUp" runat="server"><a href ="SignUp.aspx">Sign Up</a> </li>
                        <li id ="btnSignIn" runat="server"><a href ="SignIn.aspx">Sign In</a> </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>               
        <div class="container">
            <img src="icons/beer-wine-hose-banner.png"  style="width:100%; "/>
        </div>
        <hr />
        <div class ="container center">
            <div class ="row ">
                <div class ="col-lg-4">
                    <img class ="img-circle" src="Images/beers.jpg" alt="thumb" width ="200" height ="140" />
                    <h2>Beers</h2>
                    <p> We offer a wide variety of beers - light, dark and kraft beers.</p>
                    <asp:Button ID="btnBeers" runat="server" Text="View More" onClick="btnBeers_Click"/>

                </div>
                 <div class ="col-lg-4">
                    <img class ="img-circle" src="Images/wines.png" alt="thumb" width ="100" height ="140" />
                    <h2>Wines</h2>
                    <p> We offer the best wines for every taste - white, red and rosé wines</p>
                     <asp:Button ID="btnWines" runat="server" Text="View More" onClick="btnWines_Click"/>
                </div>
            </div>
        </div>
        <hr />
        <footer>
            <div class ="footer-pos ">
                <p>&copy;2020 &middot; <a href ="Default.aspx">Home</a>&middot;<a href ="#">Products</a> </p>
            </div>

        </footer>
    </form>
</body>
</html>