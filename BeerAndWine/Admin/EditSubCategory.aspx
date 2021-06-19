<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="EditSubCategory.aspx.cs" Inherits="Admin_EditSubCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class ="container ">
            <div class ="form-horizontal ">
                <h2>Edit SubCategory</h2>
                <hr />
                <div class ="form-group">
                    <asp:Label ID="Label1" CssClass ="col-md-2 control-label " runat="server" Text="SubCategory Name"></asp:Label>
                    <div class ="col-md-3 ">
                        <asp:TextBox ID="txtSubCategory" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class ="form-group">
                    <div class ="col-md-2 "> </div>
                    <div class ="col-md-6 ">
                        <asp:Button ID="btnUpdateSubCategory" CssClass ="btn btn-success " runat="server" Text="Update SubCategory"  onClick="btnUpdateSubCategory_Click"/>
                    </div>
                </div>
                </div>

            </div>
</asp:Content>

