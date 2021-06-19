using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


public partial class SignIn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void txtSignin_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BeerAndWineDB"].ConnectionString))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from Users where Username=@username and Password=@pwd", con);
            cmd.Parameters.AddWithValue("@username", txtUsername.Text);

            cmd.Parameters.AddWithValue("@pwd", txtPassword.Text);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                Session["Username"] = txtUsername.Text;
                Session["UserId"] = dt.Rows[0]["Id"].ToString();

                string Role;
                Role = dt.Rows[0][5].ToString().Trim();
                if (Role == "User")
                {
                    Session["Username"] = txtUsername.Text;
                    if (Request.QueryString["url"] != null && Request.QueryString["url"] == "cart")
                    {
                        Response.Redirect("~/User/Cart.aspx");
                    } 
                    else
                    {
                        Response.Redirect("~/User/UserHome.aspx");
                    }
                }
                if (Role == "Admin")
                {
                    Response.Redirect("~/Admin/AdminHome.aspx");
                }
            }
            else
            {
                lblError.Text = "Invalid Username or password";
            }

            //Response.Write("<script> alert('Login Successfully done');  </script>");
            clr();
            con.Close();
            //lblMsg.Text = "Registration Successfully done";
            //lblMsg.ForeColor = System.Drawing.Color.Green;

        }
    }

    private void clr()
    {
        txtPassword.Text = string.Empty;
        txtUsername.Text = string.Empty;
        txtUsername.Focus();

    }
}