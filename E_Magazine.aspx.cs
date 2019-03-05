using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class E_Magazine : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void lnkbtn_Command(object sender, CommandEventArgs e)
    {
        string filepath = e.CommandName;
        Response.AddHeader("Content-Disposition", "attachment;filename=\"" + filepath + "\"");
        Response.TransmitFile(Server.MapPath(filepath));
        Response.End();
    }
    protected void imgbtn_Command(object sender, CommandEventArgs e)
    {
        Session["ebookid"] = e.CommandArgument;
        Response.Redirect("Book.aspx");
    }
}