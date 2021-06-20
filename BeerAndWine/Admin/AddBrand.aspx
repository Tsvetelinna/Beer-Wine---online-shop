<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="AddBrand.aspx.cs" Inherits="AddBrand" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class ="container ">
            <div class ="form-horizontal ">
                 <br />
                <br />
                <br />
                <h2>Add Brand</h2>
                <hr />
                <div class ="form-group">
                    <asp:Label ID="Label1" CssClass ="col-md-2 control-label " runat="server" Text="BrandName"></asp:Label>
                    <div class ="col-md-3 ">

                        <asp:TextBox ID="txtBrand" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class ="form-group">
                    <div class ="col-md-2 "> </div>
                    <div class ="col-md-6 ">

                        <asp:Button ID="btnAddBrand" CssClass ="btn btn-success " runat="server" Text="Add Brand" OnClick="btnAddBrand_Click"  />
                        
                    </div>
                </div>
                </div>

                 <h1>Brands</h1>
                <hr />
                <div class="panel panel-default">
               <div class="panel-heading"> All Brands</div>
     <asp:repeater ID="rptrBrands" runat="server">

         <HeaderTemplate>
             <table class="table">
                  <thead>
                    <tr>
                        <th>#</th>
                        <th>Brand</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
            <tbody>
         </HeaderTemplate>
         <ItemTemplate>
             <tr>
                    <th> <%# Eval("Id") %> </th>
                    <td><%# Eval("Name") %>   </td>
                    <td>
                       <a href= "EditBrand.aspx?BrandId=<%# Eval("Id") %>">Edit</a>

                    </td>
                    <td>
                        <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandArgument='<%#Eval("Id")%>' OnClick="btnDelete_Click"/>
                    </td>
                </tr>
         </ItemTemplate>

         <FooterTemplate>
             </tbody>

              </table>
         </FooterTemplate>

     </asp:repeater>
            </div>
        </div>

</asp:Content>

