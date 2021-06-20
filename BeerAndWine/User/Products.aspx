<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <title>All Products</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
                <br />
           <br />
           <br />
           <h2>Products</h2>
           <hr />
    <div class="row" style="padding-top:50px">
    <asp:repeater ID="rptrProducts" runat="server">
        <ItemTemplate> 
        	<div class="col-sm-3 col-md-3">
            <a href="ProductView.aspx?Id=<%# Eval("Id") %>" style="text-decoration:none;">
          	<div class="thumbnail thumbnail_product">
                  <img class="product_img" src="../Images/ProductImages/<%# Eval("Id") %>/<%# Eval("ImageName") %><%# Eval("Extension") %>" alt="<%# Eval("ImageName") %>"/>
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

</asp:Content>

