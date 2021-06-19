using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindCartNumber();
        if (Session["Username"] != null)
        {
            btnUserLogout.Visible = true;
            btnUserLogin.Visible = false;
        }
        else
        {
            btnUserLogout.Visible = false;
            btnUserLogin.Visible = true;
            Response.Redirect("~/Default.aspx");
        }
    }



    protected void btnUserLogout_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx");
        Session["Username"] = null;

    }

    protected void btnUserLogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/SignIn.aspx");
    }

    public void BindCartNumber()
    {
        if (Request.Cookies["CartId"] != null)
        {
            string CookiePID = Request.Cookies["CartId"].Value.Split('=')[1];
            string[] ProductArray = CookiePID.Split(',');
            int ProductCount = ProductArray.Length;
            pCount.InnerText = ProductCount.ToString();
        }
        else
        {
            pCount.InnerText = 0.ToString();
        }
    }

    protected void btnsearch_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BeerAndWineDB"].ConnectionString))
        {
            if (txtSearch.Text == " ")
            {
                rptrProducts.DataSource = null;

            }
            using (SqlCommand cmd = new SqlCommand("select A.*, B.*, B.Name as ImageName, C.Name as BrandName from Products A " +
                "inner join Brands C on C.Id = A.BrandId left join ProductImages B on B.ProductId = A.Id  " +
                "inner join Categories D on D.Id = A.CategoryId  Where A.Name like '%' + '" + txtSearch.Text + "' + '%' Order By A.Name Asc", con))
            {
                cmd.CommandType = CommandType.Text;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    rptrProducts.DataSource = dt;
                    rptrProducts.DataBind();
                }
            }
        }
    }
}
