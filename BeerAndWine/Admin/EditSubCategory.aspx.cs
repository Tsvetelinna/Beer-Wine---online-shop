using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Admin_EditSubCategory : System.Web.UI.Page
{
    public static String connectionString = ConfigurationManager.ConnectionStrings["BeerAndWineDB"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnUpdateSubCategory_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            Int64 SubCategoryId = Convert.ToInt64(Request.QueryString["SubCategoryId"]);

            if (SubCategoryId == 1 || SubCategoryId == 2 || SubCategoryId == 3 || SubCategoryId == 4 || SubCategoryId == 5 || SubCategoryId == 6)
            {
                Response.Redirect("~/Admin/AddSubCategory.aspx");
            } 
            else
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Update SubCategories Set Name = '" + txtSubCategory.Text + "' Where Id = " + SubCategoryId, con);
                cmd.ExecuteNonQuery();

                Response.Write("<script> alert('Brand Updated Successfully ');  </script>");
                txtSubCategory.Text = string.Empty;

                con.Close();
                txtSubCategory.Focus();

                Response.Redirect("~/Admin/AddSubCategory.aspx");
            }
        }
    }
}