<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="SignIn.aspx.cs" Inherits="SignIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
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
</asp:Content>

