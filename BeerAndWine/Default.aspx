<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      <h2>Beers & Wines</h2>
                <hr />
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
               
</asp:Content>

