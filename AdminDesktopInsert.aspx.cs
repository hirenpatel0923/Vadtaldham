using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class AdminDesktopInsert : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds;
    DataTable dt;

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
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            string fn, path;
            fn = FileUpload1.FileName;
            path = "DeskWallpaper/" + fn;
            Session["p"] = path;
            FileUpload1.SaveAs(MapPath("" + path));
            Image1.ImageUrl = path;
            Response.Write("save file");
        }
        else
        {
            Response.Write("please select any image");
        }


    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True");
        cn.Open();

        DateTime date1 = DateTime.Parse(System.DateTime.Parse(TextBox1.Text).ToShortDateString());

        // string date2 = System.DateTime.Parse(TextBox1.Text).ToShortDateString();
        // bool flag = false;
        //bool flag2 = false;
        //Array[] nn = new Array();


        //for image
        string n22 = Session["p"].ToString();

        //coding for image is same or not
        /*  string ddim="select date,image from dailydarshan";
          cmd = new SqlCommand(ddim, cn);
          da = new SqlDataAdapter(cmd);
          ds = new DataSet();
          da.Fill(ds);
          dt = ds.Tables[0];
        


          for (int i = 0; i < dt.Columns.Count; i++)
          {
              if (date2 == System.DateTime.Parse(dt.Columns[i][0].ToString())) 
              { 
                  flag = true;
              }
          }
          for (int i = 0; i < dt.Rows.Count; i++)
          {
              if (n22 == dt.Rows[i][1].ToString())
              {
                  flag2 = true;
              }
          }

          */

        double auto;
        try
        {

            string auto11 = "select max(id) from DeskWallpaper";
            cmd = new SqlCommand(auto11, cn);
            auto = Convert.ToInt64(cmd.ExecuteScalar());



            auto = auto + 1;

        }
        catch
        {
            auto = 1;

        }

        string qq;
        qq = "insert into DeskWallpaper values('" + auto + "','" + n22 + "','" + date1 + "')";
        cmd = new SqlCommand(qq, cn);
        cmd.ExecuteNonQuery();

        Response.Write("<script>alert('Image Upload Successfully')</script>");
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Clear();
        Response.Redirect("AdminLogIn.aspx");
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminHomePage.aspx");
    }
}