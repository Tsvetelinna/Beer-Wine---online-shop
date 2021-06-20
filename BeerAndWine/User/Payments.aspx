<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" CodeFile="Payments.aspx.cs" Inherits="Payments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
          <title>Payment</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HiddenField ID="hdTotalPayed" runat="server" />
            <br />
           <br />
           <br />
           <h2>Payment</h2>
           <hr />

    <div class="row" style="padding-top: 20px;">
       
        <div class="col-md-9">
             <div class="form-horizontal">
                <h3>Delivery Address</h3>
                <hr />
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server"  CssClass="control-label" Text="Name"></asp:Label>
                    <asp:TextBox ID="txtName" style="width: 250px" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" CssClass="control-label" Text="Address"></asp:Label>
                    <asp:TextBox ID="txtAddress" TextMode="MultiLine" style="width: 250px" CssClass="form-control" runat="server"></asp:TextBox>
                </div> 
                <div class="form-group">
                    <asp:Label ID="Label4" runat="server" CssClass="control-label" Text="Mobile Number"></asp:Label>
                    <asp:TextBox ID="txtMobileNumber" style="width: 250px" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
        </div>

        <div class="col-md-3" runat="server" id="divPriceDetails">
             <div style="border-bottom: 1px solid #eaeaec;">
                <h5 class="proNameViewCart">PRICE DETAILS</h5>
                             <div class="proPriceView">
                    <label>Total</label>
                    <span class="float-right" id="spanTotal" runat="server"></span>
                </div>
            </div>
        </div>

        <div class="col-md-12">
  <h3>Choose Payment Mode</h3>
            <hr />
            <ul class="nav nav-tabs">
                <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#cards">Credit/Debit Cards</a></li>
                <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#cod">Cash on Delivery</a></li>
            </ul>
             <div class="tab-content">
                <div id="cards" class="tab-pane fade">
                    <div class="form-group">
                        <asp:Label ID="CardNumber" runat="server" CssClass="control-label" Text="Card Number"></asp:Label>
                        <asp:TextBox ID="txtCardNumber" style="width: 250px" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="ValidDate" runat="server" CssClass="control-label" Text="Valid To (dd/MM/yyyy)"></asp:Label>
                        <asp:TextBox ID="txtValidDate" style="width: 250px" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="CardCode" runat="server" CssClass="control-label" Text="Card Code"></asp:Label>
                        <asp:TextBox ID="txtCardCode" style="/*width: 250px*/" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                     <asp:Button ID="btnPayWithCard" runat="server" Text="Pay with Card" onClick="btnPayWithCard_Click"/>
                     &nbsp;<asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                </div>
                <div id="cod" class="tab-pane fade">
                      <asp:Button ID="btnCashOnDelivery" runat="server" Text="Pay on Delivery" onClick="btnCashOnDelivery_Click"/>
                        &nbsp;<asp:Label ID="lblCod" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

