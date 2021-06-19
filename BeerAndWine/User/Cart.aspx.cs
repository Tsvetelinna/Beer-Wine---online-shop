using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;
using System.Threading;

public partial class Cart : System.Web.UI.Page
{
    public static String connectionString = ConfigurationManager.ConnectionStrings["BeerAndWineDB"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindProductCart();
        }
    }

    private void BindProductCart()
    {
        if (Request.Cookies["CartId"] != null)
        {
            string CookieData = Request.Cookies["CartId"].Value.Split('=')[1];
            string[] CookieDataArray = CookieData.Split(',');


            if (CookieDataArray.Length > 0)
            {
                h4Noitems.InnerText = "MY CART (" + CookieDataArray.Length + " Items)";
                DataTable dt = new DataTable();
                Double Total = 0;
                for (int i = 0; i < CookieDataArray.Length; i++)
                {
                    string ProductId = CookieDataArray[i].ToString().Split('-')[0];


                    using (SqlConnection con = new SqlConnection(connectionString))
                    {
                        using (SqlCommand cmd = new SqlCommand("select A.*,B.* from Products A join ProductImages B on B.ProductId=A.Id  where A.Id=" + ProductId, con))
                        {
                            cmd.CommandType = CommandType.Text;
                            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                            {
                                sda.Fill(dt);
                            }
                        }
                    }
                    Total += Convert.ToDouble(dt.Rows[i]["Price"]);
                }

                rptrCartProducts.DataSource = dt;
                rptrCartProducts.DataBind();
                divpricedetails.Visible = true;
                spanTotal.InnerText = "Lv. " + Total.ToString();
            }
            else
            {
                h4Noitems.InnerText = "Your Shopping Cart is Empty";
                divpricedetails.Visible = false;
            }
        }
        else
        {

            h4Noitems.InnerText = "Your Shopping Cart is Empty";
            divpricedetails.Visible = false;
        }
    }

    protected void btnRemoveItem_Click(object sender, EventArgs e)
    {
        string CookiePID = Request.Cookies["CartId"].Value.Split('=')[1];

        Button btn = (Button)(sender);

        string PIDSIZE = btn.CommandArgument;

        List<String> CookiePIDList = CookiePID.Split(',').Select(i => i.Trim()).Where(i => i != string.Empty).ToList();
        CookiePIDList.Remove(PIDSIZE);
        string CookiePIDUpdated = String.Join(",", CookiePIDList.ToArray());
        if (CookiePIDUpdated == "")
        {
            HttpCookie CartProducts = Request.Cookies["CartId"];
            CartProducts.Values["CartId"] = null;
            CartProducts.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(CartProducts);
        }
        else
        {
            HttpCookie CartProducts = Request.Cookies["CartId"];
            CartProducts.Values["CartId"] = CookiePIDUpdated;
            CartProducts.Expires = DateTime.Now.AddDays(30);
            Response.Cookies.Add(CartProducts);
        }
        Response.Redirect("Cart.aspx");
    }

    protected void btnBuyNow_Click(object sender, EventArgs e)
    {
        if (Session["USERNAME"] != null)
        {
            Response.Redirect("~/User/Payments.aspx");
        }
        else
        {
            Response.Redirect("~/SignIn.aspx?url=cart");
        }
    }
}