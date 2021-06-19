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

public partial class Payments : System.Web.UI.Page
{
    public static String connectionString = ConfigurationManager.ConnectionStrings["BeerAndWineDB"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["USERNAME"] != null)
        {
            if (!IsPostBack)
            {
                BindPriceData();
            }
        }
        else
        {
            Response.Redirect("~/SignIn.aspx");
        }
    }

    public void BindPriceData()
    {
        if (Request.Cookies["CartId"] != null)
        {
            string CookieData = Request.Cookies["CartId"].Value.Split('=')[1];
            string[] CookieDataArray = CookieData.Split(',');
            if (CookieDataArray.Length > 0)
            {
                DataTable dtBrands = new DataTable();
                Double Total = 0;
                for (int i = 0; i < CookieDataArray.Length; i++)
                {
                    string ProductId = CookieDataArray[i].ToString().Split('-')[0];

                    using (SqlConnection con = new SqlConnection(connectionString))
                    {
                        using (SqlCommand cmd = new SqlCommand("select A.* from Products A  where A.Id=" + ProductId, con))
                        {
                            cmd.CommandType = CommandType.Text;
                            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                            {
                                sda.Fill(dtBrands);
                            }

                        }
                    }
                    Total += Convert.ToDouble(dtBrands.Rows[i]["Price"]);
                }
                divPriceDetails.Visible = true;

                spanTotal.InnerText = "Lv. " + Total.ToString();

                hdTotalPayed.Value = Total.ToString();
            }
            else
            {
                Response.Redirect("~/Users/Products.aspx");
            }
        }
        else
        {
            Response.Redirect("~/Users/Products.aspx");
        }
    }

    protected void btnCashOnDelivery_Click(object sender, EventArgs e)
    {
        if (Session["USERNAME"] != null)
        {

            if (isFormValid())
            {
                string UserId = Session["UserId"].ToString();
                string PaymentType = "CashOnDelivery";
                string PaymentStatus = "NotPaid";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("insert into Orders values('" + UserId + "','"
                        + hdTotalPayed.Value + "','" + PaymentType + "','" + PaymentStatus + "',getdate(),'"
                        + txtName.Text + "','" + txtAddress.Text + "','" + txtMobileNumber.Text + "') select SCOPE_IDENTITY()", con);
                    con.Open();
                    Int64 OrderId = Convert.ToInt64(cmd.ExecuteScalar());

                    lblCod.Text = "Purchase is done";
                    lblCod.ForeColor = System.Drawing.Color.Green;

                    HttpCookie CartProducts = Request.Cookies["CartId"];
                    CartProducts.Values["CartId"] = null;
                    CartProducts.Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies.Add(CartProducts);

                    Response.Write("<script> alert('Purchase is done');  </script>");

                }


            }

        }
        else
        {
            Response.Redirect("~/SignIn.aspx");
        }
    }

    protected void btnPayWithCard_Click(object sender, EventArgs e)
    {
        if (Session["USERNAME"] != null)
        {

            if (isFormValid())
            {
                string UserId = Session["UserId"].ToString();
                string PaymentType = "Card";
                string PaymentStatus = "Paid";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    DateTime datetime = DateTime.ParseExact(txtValidDate.Text, "dd/MM/yyyy", null);

                    if (isValidCard())
                    {
                        if (isValid(datetime))
                        {
                            SqlCommand cmd = new SqlCommand("insert into Orders values('" + UserId + "','"
                            + hdTotalPayed.Value + "','" + PaymentType + "','" + PaymentStatus + "',getdate(),'"
                            + txtName.Text + "','" + txtAddress.Text + "','" + txtMobileNumber.Text + "') select SCOPE_IDENTITY()", con);
                            con.Open();
                            Int64 OrderId = Convert.ToInt64(cmd.ExecuteScalar());

                            SqlCommand cmd2 = new SqlCommand("insert into CardDetails values('" + OrderId + "','"
                                               + txtCardNumber.Text + "','" + datetime + "','" + txtCardCode.Text + "') select SCOPE_IDENTITY()", con);

                            cmd2.ExecuteNonQuery();

                            Response.Write("<script> alert('Purchase is done');  </script>");
                            lblMsg.Text = "Purchase is done";
                            lblMsg.ForeColor = System.Drawing.Color.Green;


                            HttpCookie CartProducts = Request.Cookies["CartId"];
                            CartProducts.Values["CartId"] = null;
                            CartProducts.Expires = DateTime.Now.AddDays(-1);
                            Response.Cookies.Add(CartProducts);
                        }
                        else
                        {
                            Response.Write("<script> alert('Invalid Credit Card');  </script>");
                            lblMsg.Text = "Invalid Credit Card";
                            lblMsg.ForeColor = System.Drawing.Color.Red;

                        }
                    }
                }
            }
        }
        else
        {
            Response.Redirect("~/SignIn.aspx");
        }
    }


    private Boolean isValid(DateTime validTo)
    {
        return (DateTime.Compare(validTo, DateTime.Now) > 0);
    }

    private bool isFormValid()
    {
        if (txtCardNumber.Text == "")
        {
            Response.Write("<script> alert('card number not valid');  </script>");
            txtCardNumber.Focus();

            return false;
        }
        else if (txtValidDate.Text == "")
        {
            Response.Write("<script> alert('Valid to not valid');  </script>");
            txtValidDate.Focus();
            return false;
        }
        else if (txtMobileNumber.Text == "")
        {
            Response.Write("<script> alert('Mobile Phone not valid');  </script>");
            txtMobileNumber.Focus();
            return false;
        }
        
        return true;
    }

    private bool isValidCard()
    {
        if (txtName.Text == "")
        {
            Response.Write("<script> alert('name not valid');  </script>");
            txtName.Focus();

            return false;
        }
        else if (txtAddress.Text == "")
        {
            Response.Write("<script> alert('Address not valid');  </script>");
            txtAddress.Focus();
            return false;
        }
        else if (txtCardCode.Text == "")
        {
            Response.Write("<script> alert('Card code not valid');  </script>");
            txtCardCode.Focus();
            return false;
        }

        return true;
    }
}