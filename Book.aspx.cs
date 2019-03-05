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

        bookdiv.Attributes.Add("data-configid", Session["ebookid"].ToString());
    }
    //8920282/4363189
    //8920282/4363022
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("E_Magazine.aspx");
    }
}