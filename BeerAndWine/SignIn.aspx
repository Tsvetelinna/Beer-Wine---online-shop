 <%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignIn.aspx.cs" Inherits="SignIn" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign In</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   <meta http-equiv="X-UA-Compatible" content="IE-edge">   
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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
                        <li><a href ="Default.aspx">Home</a> </li>
                        <li class ="drodown">
                            <a href ="#" class ="dropdown-toggle" data-toggle="dropdown">Products<b class ="caret"></b></a>
                            <ul class ="dropdown-menu ">
                                <li> <a href="Beers/Beers.aspx">Beers</a></li>
                                <li> <a href="Wines/Wines.aspx">Wines</a></li>
                            </ul>

                        </li>
                        <li ><a href ="SignUp.aspx">Sign Up</a> </li>
                        <li class ="active"><a href ="SignIn.aspx">Sign In</a> </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
         
        <br />
        <br />
        <br />

        <!----singin form start--->

     
        <div class ="container ">
            <div class ="form-horizontal ">
                <h2>Login Form</h2>
                <hr />
            <label class="col-xs-11">UserName:</label>
            <div class="col-xs-11">
            <asp:TextBox ID="txtUsername" runat="server" Class="form-control" placeholder="Enter Your UserName"></asp:TextBox>
            </div>


            <label class="col-xs-11">Password:</label>
            <div class="col-xs-11">
            <asp:TextBox ID="txtPassword" runat="server" Class="form-control" placeholder="Enter Your password"></asp:TextBox>
            </div>

            <label class="col-xs-11"></label>
             <div class="col-xs-11">
                 <asp:Button ID="txtSignin" CssClass="btn btn-success" runat="server" Text="Login"  CausesValidation="false" OnClick="txtSignin_Click" />
                             <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/SignUp.aspx">Sign Up</asp:HyperLink>
                 &nbsp;<asp:Label ID="lblError" runat="server" Text=""></asp:Label>
            </div>

        </div>

        </div>
        <!----singin form End--->

          <!---Footer COntents Start here---->
        <hr />
         <footer>
            <div class ="footer-pos ">
                <p>&copy;2020 &middot; <a href ="Default.aspx">Home</a>&middot;<a href ="#">Products</a> </p>
            </div>

        </footer>

         <!---Footer COntents End---->

    </form>
</body>
</html>
