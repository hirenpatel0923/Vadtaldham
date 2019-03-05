using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

public partial class PhotoGallery : System.Web.UI.Page
{
    SqlCommand cmd;
    SqlConnection con;
    SqlDataAdapter adp;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True");
    }
    protected void showphoto_Command(object sender, CommandEventArgs e)
    {
        Session["albumid"] = e.CommandArgument;
        ListView1.Visible = false;
        ListView2.DataBind();
        ListView2.Visible = true;
        LinkButton1.Visible = true;
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        ListView1.Visible = true;
        ListView2.Visible = false;
        LinkButton1.Visible = false;
    }
}