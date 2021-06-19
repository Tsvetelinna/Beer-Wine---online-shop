<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="EditBrand.aspx.cs" Inherits="Admin_EditBrand" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class ="container ">
            <div class ="form-horizontal ">
                <h2>Edit Brand</h2>
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
                        <asp:Button ID="btnUpdateBrand" CssClass ="btn btn-success " runat="server" Text="Update Brand"  onClick="btnUpdateBrand_Click"/>
                    </div>
                </div>
                </div>

            </div>
</asp:Content>

