using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Admin_EditBrand : System.Web.UI.Page
{
    public static String connectionString = ConfigurationManager.ConnectionStrings["BeerAndWineDB"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void btnUpdateBrand_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            Int64 BrandId = Convert.ToInt64(Request.QueryString["BrandId"]);

            con.Open();
            SqlCommand cmd = new SqlCommand("Update Brands Set Name = '" + txtBrand.Text + "' Where Id = " + BrandId, con);
            cmd.ExecuteNonQuery();

            Response.Write("<script> alert('Brand Updated Successfully ');  </script>");
            txtBrand.Text = string.Empty;

            con.Close();
            txtBrand.Focus();

            Response.Redirect("~/Admin/AddBrand.aspx");
        }
    }
}