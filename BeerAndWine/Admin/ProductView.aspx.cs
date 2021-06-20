using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ProductView : System.Web.UI.Page
{
    public static String connectionString = ConfigurationManager.ConnectionStrings["BeerAndWineDB"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["Id"] != null)
        {
            if (!IsPostBack)
            {
                BindProductImage();
                BindProductDetails();
            }
        }
        else
        {
            Response.Redirect("~/Admin/Products.aspx");
        }
    }

    private void BindProductDetails()
    {
        Int64 ProductId = Convert.ToInt64(Request.QueryString["Id"]);
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            using (SqlCommand cmd = new SqlCommand("select * from Products where Id ='" + ProductId + "'", con))
            {
                cmd.CommandType = CommandType.Text;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    rptrProductDetails.DataSource = dt;
                    rptrProductDetails.DataBind();
                }
            }
        }
    }

    private void BindProductImage()
    {
        Int64 ProductId = Convert.ToInt64(Request.QueryString["Id"]);
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            using (SqlCommand cmd = new SqlCommand("select * from ProductImages where ProductId='" + ProductId + "'", con))
            {
                cmd.CommandType = CommandType.Text;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    rptrImage.DataSource = dt;
                    rptrImage.DataBind();
                }
            }
        }
    }


    protected void btnDelete_Click(object sender, EventArgs e)
    {
        Int64 ProductId = Convert.ToInt64(Request.QueryString["Id"]);
        using (SqlConnection con = new SqlConnection(connectionString))
        {

            using (SqlCommand cmd = new SqlCommand("delete from ProductImages where ProductId = " + ProductId, con))
            {
                cmd.CommandType = CommandType.Text;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    rptrImage.DataSource = dt;
                    rptrImage.DataBind();
                }
            }
            using (SqlCommand cmd = new SqlCommand("delete from Products where Id = " + ProductId, con))
            {
                cmd.CommandType = CommandType.Text;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    rptrImage.DataSource = dt;
                    rptrImage.DataBind();
                }
            }
        }
        Response.Redirect("~/Admin/Products.aspx");
    }
}