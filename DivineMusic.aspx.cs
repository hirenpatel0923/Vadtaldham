using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DivineMusic : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void showphoto_Command(object sender, CommandEventArgs e)
    {
        Session["albumid"] = e.CommandArgument;
        ListView1.Visible = false;
        GridView1.DataBind();
        GridView1.Visible = true;
        LinkButton1.Visible = true;
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        ListView1.Visible = true;
        GridView1.Visible = false;
        LinkButton1.Visible = false;
    }
    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        LinkButton lnkbtn = sender as LinkButton;
        GridViewRow gvrow = lnkbtn.NamingContainer as GridViewRow;
        string filePath = "DMP/" + gvrow.Cells[0].Text.ToString();
        Response.AddHeader("Content-Disposition", "attachment;filename=\"" + filePath + "\"");
        Response.TransmitFile(Server.MapPath(filePath));
        Response.End();
    }
}