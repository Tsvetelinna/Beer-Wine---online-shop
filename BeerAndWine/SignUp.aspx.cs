using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class SignUp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void txtsignup_Click(object sender, EventArgs e)
    {
        if (isformvalid())
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BeerAndWineDB"].ConnectionString))
            {
                con.Open();
                SqlCommand cmdCheck = new SqlCommand("SELECT COUNT(*) FROM Users WHERE (Username = @user)", con);
                cmdCheck.Parameters.AddWithValue("@user", txtUname.Text);
                int UserExist = (int) cmdCheck.ExecuteScalar();

                if (UserExist > 0)
                {
                    Response.Write("<script> alert('Already exist user with this username');  </script>");
                    txtPass.Focus();
                }
                else
                {
                    SqlCommand cmd = new SqlCommand("Insert into Users(Username,Password,Email,Name,Role) Values('" + txtUname.Text + "','" + txtPass.Text + "','" + txtEmail.Text + "','" + txtName.Text + "','User')", con);
                    cmd.ExecuteNonQuery();

                    Response.Write("<script> alert('Registration Successfully done');  </script>");
                    clr();
                    con.Close();
                    lblMsg.Text = "Registration Successfully done";
                    lblMsg.ForeColor = System.Drawing.Color.Green;
                    Response.Redirect("~/SignIn.aspx");
                }
            }
        }
        else
        {
            Response.Write("<script> alert('Registration failed');  </script>");
            lblMsg.Text = "All fields are requered";
            lblMsg.ForeColor = System.Drawing.Color.Red;
        }

    }

    private bool isformvalid()
    {
        if (txtUname.Text == "")
        {
            Response.Write("<script> alert('username not valid');  </script>");
            txtUname.Focus();

            return false;
        }
        else if (txtPass.Text == "")
        {
            Response.Write("<script> alert('Password not valid');  </script>");
            txtPass.Focus();
            return false;
        }
        else if (txtPass.Text != txtCPass.Text)
        {
            Response.Write("<script> alert('confirm Password not valid');  </script>");
            txtCPass.Focus();
            return false;
        }
        else if (txtEmail.Text == "")
        {
            Response.Write("<script> alert('Email not valid');  </script>");
            txtEmail.Focus();
            return false;
        }
        else if (txtName.Text == "")
        {
            Response.Write("<script> alert('Name not valid');  </script>");
            txtName.Focus();
            return false;
        }

        return true;
    }

    private void clr()
    {
        txtName.Text = string.Empty;
        txtPass.Text = string.Empty;
        txtUname.Text = string.Empty;
        txtEmail.Text = string.Empty;
        txtCPass.Text = string.Empty;
    }
}