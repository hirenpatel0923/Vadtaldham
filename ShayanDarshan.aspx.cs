using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;

public partial class ShayanDarshan : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;
    SqlDataReader dr2;
    SqlDataAdapter adp;
    DataSet ds;

    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True");
        Session["seldate"] = Calendar1.TodaysDate.Date;
        string date = Session["seldate"].ToString();
        cmd = new SqlCommand("select image from ShayanDarshan where date='" + Convert.ToDateTime(date) + "'", con);
        con.Open();
        adp = new SqlDataAdapter(cmd);
        cmd.ExecuteNonQuery();
        ds = new DataSet();
        adp.Fill(ds, "ShayanDarshan");
        con.Close();
        int count = ds.Tables["ShayanDarshan"].Rows.Count;
        if (count > 0)
        {
            Label1.Visible = false;
        }
        else
        {
            Label1.Text = "No images for this date...";
            Label1.Visible = true;

        }
       // Label1.Visible = false;
       // open();
       // //  DateTime d1 = System.DateTime.Parse(System.DateTime.Now.ToShortDateString());
       // string g = System.DateTime.Now.ToShortDateString();

       // string qq = "select id,image from ShayanDarshan where date='" + System.DateTime.Parse(System.DateTime.Now.ToShortDateString()) + "'";
       //// string qq = "select id,image from ShayanDarshan where date='" + System.DateTime.Now() + "'";
       // cmd = new SqlCommand(qq, cn);
       // dr = cmd.ExecuteReader();

       //if (dr.Read())
       //{
       //     ListView1.DataSource = dr;
       //     ListView1.DataBind();
       //}
       //else
       //{
       //     Label1.Visible = true;
       //     Label1.Text = "No Images For Todays Date";
       // }
       // //Repeater1.DataSource = dr;
       // //Repeater1.DataBind();

       // cn.Close();
       
    }
    //public void open()
    //{
    //    cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True");
    //    cn.Open();
       
    //}
   

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        Session["seldate"] = Calendar1.SelectedDate.ToShortDateString();
        string date = Session["seldate"].ToString();
        cmd = new SqlCommand("select image from ShayanDarshan where date='" + Convert.ToDateTime(date) + "'", con);
        con.Open();
        adp = new SqlDataAdapter(cmd);
      //  cmd.ExecuteNonQuery();
        ds = new DataSet();
        adp.Fill(ds, "ShayanDarshan");
        con.Close();
        int count = ds.Tables["ShayanDarshan"].Rows.Count;
        if (count > 0)
        {
            Label1.Visible = false;
        }
        else
        {
            Label1.Text = "No images for this date...";
            Label1.Visible = true;

        }
       
        //open();

        //// Label1.Text = Calendar1.SelectedDate.ToString();

        //string gg = Calendar1.SelectedDate.ToShortDateString();

        //string qq = "select image from ShayanDarshan where date='" + gg + "'";
        //SqlCommand cmd = new SqlCommand(qq, cn);
        //dr2 = cmd.ExecuteReader();
        //if (dr2.Read())
        //{


        //    ListView1.DataSource = dr2;
        //    ListView1.DataBind();
        //    Label1.Visible = false;

        //}
        //else
        //{
        //    ListView1.DataSource = dr2;
        //    ListView1.DataBind();

        //    Label1.Visible = true;
        //    Label1.Text = "No Images For This Date";
        //}




        //// Repeater1.DataSource = dr;

        //cn.Close();
    }
    protected void lnkbtn_Command(object sender, CommandEventArgs e)
    {
        string filepath = e.CommandName;
        Response.AddHeader("Content-Disposition", "attachment;filename=\"" + filepath + "\"");
        Response.TransmitFile(Server.MapPath(filepath));
        Response.End();
    }

    protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}