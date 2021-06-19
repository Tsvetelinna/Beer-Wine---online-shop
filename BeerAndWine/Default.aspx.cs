using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void btnlogout_Click(object sender, EventArgs e)
    {
        Session["Username"] = null;
        Response.Redirect("~/Default.aspx");
    }

    protected void btnBeers_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Beers/Beers.aspx");
    }

    protected void btnWines_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Wines/Wines.aspx");
    }
}