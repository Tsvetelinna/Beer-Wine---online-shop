<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ProductView.aspx.cs" Inherits="ProductView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <br />
    <br />

    <div style="padding-top:50px" >
        <div class="content" style="display:flex">
            <asp:repeater ID="rptrImage" runat="server">
          <ItemTemplate>
            <div style="max-width:480px" class="thumbnail">
               <img src="../Images/ProductImages/<%# Eval("ProductId") %>/<%# Eval("Name") %><%# Eval("Extension") %>" alt="<%# Eval("Name") %>"/>
                        </div>
            </ItemTemplate>
            </asp:repeater>
              <div class="text" style="margin-left:100px ">
            <asp:Repeater ID="rptrProductDetails" runat="server"  >
                <ItemTemplate>
            <div class="divDet1">
                 <h1 class="proNameView"><%# Eval("Name") %> </h1>
                <br />
                <br />
                <div class="divDet1" >
                <h4>   <%#Eval("Description") %></h4>
                </div>
                <br />
                <h4 class="proOgPriceView">Lv. <%#Eval("Price","{0:0.00}") %></h4></div>
            <div class="divDet1" >
                <asp:button ID="btnDelete" CssClass="mainButton" runat="server" text="DELETE" OnClick="btnDelete_Click"/>
            </div>
            
            </ItemTemplate>
        </asp:Repeater>
                  </div>

        </div>
    </div>
</asp:Content>

