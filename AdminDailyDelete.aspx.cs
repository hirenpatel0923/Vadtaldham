using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;

public partial class AdminDailyDelete : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cmd;
    SqlDataReader dr;
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
            DateTime date1 = DateTime.Parse(System.DateTime.Parse(TextBox1.Text).ToShortDateString());
            open();
        
                string gg="select image from DailyDarshan where date='"+date1+"'";
                cmd = new SqlCommand(gg, cn);
                da = new SqlDataAdapter(cmd);
               // dr = cmd.ExecuteReader();
                
                ds = new DataSet();
                da.Fill(ds);
                dt = ds.Tables[0];
                   
              //  if (dr.Read())
               // {

                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        // n=null;
                        for (int j = 0; j < dt.Columns.Count; j++)
                        {
                            string n;
                            n = ds.Tables[0].Rows[i][j].ToString();

                            string path1 = Server.MapPath(n);
                            FileInfo file = new FileInfo(path1);
                            if (file.Exists)
                            {
                                file.Delete();
                            }


                        }
                    }


                    string del1 = "delete from DailyDarshan where date='" + date1 + "'";
                    cmd = new SqlCommand(del1, cn);
                    cmd.ExecuteNonQuery();

                    Response.Write("<script>alert('Image Deleted Succefully')</script>");
                    cn.Close();
               // }
               // else
                //{
                 //   Response.Write("<script>alert('There are no Images for this date')</script>");

//                }
    }

    public void open()
    {
        cn = new SqlConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDictionary|db.mdb");
        cn.Open();

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