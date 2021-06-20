<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" CodeFile="LightBeers.aspx.cs" Inherits="Beers_LightBeers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <title>Light Beers</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <br />  
     <br />  
     <br />  

    <h1>Light Beers</h1>
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

