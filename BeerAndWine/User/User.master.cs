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
        Response.Redirect("~/User/Products.aspx?search="+ txtSearch.Text);
    }
}
