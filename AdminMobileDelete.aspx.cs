using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;

public partial class AdminMobileDelete : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds;
    //DataTable dt;
    //SqlDataReader dr;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("AdminLogIn.aspx");
            }
            else
            {
                Response.ClearHeaders();
                Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");

                Response.AddHeader("Pragma", "no-cache");
            }
        }
    }
    protected void lnkbtn_Command(object sender, CommandEventArgs e)
    {

        double filepath = double.Parse(e.CommandName.ToString());

        cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True");
        cn.Open();
        string g = "select * from MobileWallpaper where id='" + filepath + "'";
        cmd = new SqlCommand(g, cn);
        // dr = cmd.ExecuteReader();
        da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds);
        string path = ds.Tables[0].Rows[0][1].ToString();

        //string path = dr["image"].ToString();
        //  Response.Write(path);

        string path1 = Server.MapPath(path);
        FileInfo file = new FileInfo(path1);
        if (file.Exists)
        {
            file.Delete();
        }

        string gg = "delete from MobileWallpaper where id='" + filepath + "'";
        cmd = new SqlCommand(gg, cn);
        cmd.ExecuteNonQuery();

        cn.Close();
        Response.Write("<script>alert('Image Deleted Successfully')</script>");
        ListView1.DataBind();
      
     /*   double filepath = double.Parse(e.CommandName.ToString());


        cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True");
        cn.Open();
        string g = "delete from MobileWallpaper where id='" + filepath + "'";
        cmd = new SqlCommand(g, cn);
        cmd.ExecuteNonQuery();

        Response.Write("<script>alert('Image Deleted Successfully')</script>");
        cn.Close();
        Response.Redirect("AdminMobileDelete.aspx");
       */ 



        //  Response.AddHeader("Content-Disposition", "attachment;filename=\"" + filepath + "\"");
        // Response.TransmitFile(Server.MapPath(filepath));
        // Response.End();
    }

    protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Clear();
        Response.Redirect("AdminLogIn.aspx");

    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminHomePage.aspx");
    }
}