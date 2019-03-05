using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
public partial class DesktopWallpaper : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cmd;
    SqlDataReader dr;
    protected void Page_Load(object sender, EventArgs e)
    {
     /*   open();
        //  DateTime d1 = System.DateTime.Parse(System.DateTime.Now.ToShortDateString());
       // string g = System.DateTime.Now.ToShortDateString();

        string qq = "select image from DeskWallpaper";
        SqlCommand cmd = new SqlCommand(qq, cn);
        dr = cmd.ExecuteReader();

        if (dr.Read())
        {
            ListView1.DataSource = dr;
            ListView1.DataBind();
            Label1.Visible = false;
      
        }
        else
        {
            Label1.Visible = true;
            Label1.Text = "No Images For Download";
        }
        //Repeater1.DataSource = dr;
        //Repeater1.DataBind();

        cn.Close();*/
       
    }
    public void open()
    {
        cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True");
        cn.Open();
       
    }

    protected void lnkbtn_Command(object sender, CommandEventArgs e)
    {
        string filepath = e.CommandName;
        Response.AddHeader("Content-Disposition", "attachment;filename=\"" + filepath + "\"");
        Response.TransmitFile(Server.MapPath(filepath));
        Response.End();

    }
  
}