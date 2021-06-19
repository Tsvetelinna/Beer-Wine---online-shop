<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="AddSubCategory.aspx.cs" Inherits="AddSubCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class ="container ">
            <div class ="form-horizontal ">
                <br />
                <br />
                <br />
                <h2>Add SubCategory</h2>
                <hr />

                 <div class ="form-group">
                    <asp:Label ID="Label2" CssClass ="col-md-2 control-label " runat="server" Text="Category"></asp:Label>
                    <div class ="col-md-3 ">
                        <asp:DropDownList ID="ddlCategoryID" CssClass ="form-control" runat="server"></asp:DropDownList>
                    </div>
                </div>

                <div class ="form-group">
                    <asp:Label ID="Label1" CssClass ="col-md-2 control-label " runat="server" Text="SubCategory Name"></asp:Label>
                    <div class ="col-md-3 ">

                        <asp:TextBox ID="txtSubCategory" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>

                <div class ="form-group">
                    <div class ="col-md-2 "> </div>
                    <div class ="col-md-6 ">
                        <asp:Button ID="btnAddSubCategory" CssClass ="btn btn-success " runat="server" Text="Add SubCategory" OnClick="btnAddSubCategory_Click" />
                    </div>
                </div>
                <h1>SubCategories</h1>
        <hr />
 <div class="panel panel-default">
               <div class="panel-heading"> All SubCategories</div>
     <asp:repeater ID="rptrSubCat" runat="server">
         <HeaderTemplate>
             <table class="table">
                  <thead>
                    <tr>
                        <th>#</th>
                        <th>SubCategory</th>
                        <th>Category</th>
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
                 <td><%# Eval("CategoryName") %>   </td>
                  <td>
                       <a href= "EditSubCategory.aspx?SubCategoryId=<%# Eval("Id") %>">Edit</a>

                    </td>
                    <td>
                        <asp:Button ID="btnDeleteSubCategory" runat="server" Text="Delete" CommandArgument='<%# Eval("Id")%>' onClick="btnDeleteSubCategory_Click"/>
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

