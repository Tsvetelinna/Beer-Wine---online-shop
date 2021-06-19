using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class AddSubCategory : System.Web.UI.Page
{
    public static String connectionString = ConfigurationManager.ConnectionStrings["BeerAndWineDB"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindCategory();
            BindSubCatRptr();
        }
    }

    protected void btnAddSubCategory_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Insert into SubCategories(Name, CategoryId) Values('" + txtSubCategory.Text + "','" + ddlCategoryID.SelectedItem.Value + "')", con);
            cmd.ExecuteNonQuery();

            Response.Write("<script> alert('SubCategory Added Successfully ');  </script>");
            txtSubCategory.Text = string.Empty;

            con.Close();
            ddlCategoryID.ClearSelection();
            ddlCategoryID.Items.FindByValue("0").Selected = true;
        }
        BindSubCatRptr();
    }

    private void BindSubCatRptr()
    {
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            using (SqlCommand cmd = new SqlCommand("select A.*,B.Name as CategoryName from SubCategories A inner join Categories B on B.Id = A.CategoryId  ", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    rptrSubCat.DataSource = dt;
                    rptrSubCat.DataBind();
                }
            }
        }
    }

    private void BindCategory()
    {
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from Categories", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                ddlCategoryID.DataSource = dt;
                ddlCategoryID.DataTextField = "Name";
                ddlCategoryID.DataValueField = "Id";
                ddlCategoryID.DataBind();
                ddlCategoryID.Items.Insert(0, new ListItem("-Select-", "0"));
            }
        }
    }
    protected void btnDeleteSubCategory_Click(object sender, EventArgs e)
    {
        Button btn = (Button)(sender);
        string id = btn.CommandArgument;
        if (id.Equals("1") || id.Equals("2") || id.Equals("3") || id.Equals("4") || id.Equals("5") || id.Equals("6"))
        {
            Response.Redirect("AddSubCategory.aspx");
        }
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            using (SqlCommand cmd = new SqlCommand("delete from SubCategories where Id = " + id, con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    rptrSubCat.DataSource = dt;
                    rptrSubCat.DataBind();

                    BindCategory();
                    BindSubCatRptr();
                }
            }

        }
    }
}