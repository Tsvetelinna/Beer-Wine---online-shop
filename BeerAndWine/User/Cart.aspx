<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <br />

<div class="row" style="padding-top: 20px;">
 
       <div class="col-md-9">
  
          <h5 class="proNameViewCart" runat="server" id="h4Noitems"></h5>

 
           <asp:Repeater ID="rptrCartProducts" runat="server">
  
              <ItemTemplate>
                    <div class="media my-3" style="border: 1px solid #eaeaec;">
                        <div class=" media-left align-self-center mr-3">
                            <a href="ProductView.aspx?Id=<%#Eval("Id") %>" target="_blank">
                                <img width="100px" class="media-object" src="../Images/ProductImages/<%#Eval("Id") %>/<%#Eval("Name") %><%#Eval("Extension") %>" alt="<%#Eval("Name") %>" onerror="this.src='images/noimage.jpg'">
                            </a>
                        </div>
                        <div class="media-body">
                            <h5 class="media-heading proNameViewCart"><%#Eval("Name") %></h5>
                            <span class="proPriceView">Lv. <%#Eval("Price","{0:0.00}") %></span>
                            <p>
                                <asp:Button CommandArgument='<%#Eval("Id")%>' ID="btnRemoveItem" CssClass="RemoveButton1" runat="server" Text="REMOVE" onClick="btnRemoveItem_Click"/>
                            </p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div class="col-md-3 pt-5" runat="server" id="divpricedetails">
            <div>
                                <h5 class="proNameViewCart">PRICE DETAILS</h5>

                <div class="proPriceView">
                    <label>Total</label>
                    <span class="float-right" id="spanTotal" runat="server"></span>
                </div>
                <div>
                    

<asp:Button ID="btnBuyNow"  CssClass="buyNowbtn" runat="server" Text="BUY NOW" onClick ="btnBuyNow_Click"/>
     
           </div>
 
           </div>
 
       </div>
   
 </div>

</asp:Content>

