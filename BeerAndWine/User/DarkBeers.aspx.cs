using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Beers_LightBeers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindProductRepeater();
        }
    }

    private void BindProductRepeater()
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BeerAndWineDB"].ConnectionString))
        {
            using (SqlCommand cmd = new SqlCommand("select A.*, B.*, B.Name as ImageName, C.Name as BrandName from Products A " +
                "inner join Brands C on C.Id = A.BrandId left join ProductImages B on B.ProductId = A.Id  " +
                "inner join SubCategories D on D.Id = A.SubCategoryId where D.Name = 'Dark Beers' Order By A.Name", con))
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