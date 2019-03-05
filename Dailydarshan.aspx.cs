using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;

public partial class New_Design_Dailydarshan : System.Web.UI.Page
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
        cmd = new SqlCommand("select image from DailyDarshan where date='" + Convert.ToDateTime(date) + "'", con);
        con.Open();
        adp = new SqlDataAdapter(cmd);
        cmd.ExecuteNonQuery();
        ds = new DataSet();
        adp.Fill(ds, "DailyDarshan");
        con.Close();
        int count = ds.Tables["DailyDarshan"].Rows.Count;
        if (count > 0)
        {
            Label1.Visible = false;
        }
        else
        {
            Label1.Text = "No images for this date...";
            Label1.Visible = true;

        }
      //  Label1.Visible = false;
      //  open();
      ////  DateTime d1 = System.DateTime.Parse(System.DateTime.Now.ToShortDateString());
      //  string g = System.DateTime.Now.ToShortDateString();

      //  string qq = "select id,image from DailyDarshan where date='" + System.DateTime.Parse(System.DateTime.Now.ToShortDateString()) + "'";
      //  SqlCommand cmd = new SqlCommand(qq, cn);
      //  dr = cmd.ExecuteReader();

      //  if (dr.Read())
      //  {
      //      ListView1.DataSource = dr;
      //      ListView1.DataBind();
      //  }
      //  else
      //  {
      //      Label1.Visible = true;
      //      Label1.Text = "No Images For Todays Date";
      //  }
      //  //Repeater1.DataSource = dr;
      //  //Repeater1.DataBind();

      //  cn.Close();
        
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
        cmd = new SqlCommand("select image from DailyDarshan where date='" + Convert.ToDateTime(date) + "'", con);
        con.Open();
        adp = new SqlDataAdapter(cmd);
      //  cmd.ExecuteNonQuery();
        ds = new DataSet();
        adp.Fill(ds, "DailyDarshan");
        con.Close();
        int count = ds.Tables["DailyDarshan"].Rows.Count;
        if (count > 0)
        {
            Label1.Visible = false;
        }
        else
        {
            Label1.Text = "No images for this date...";
            Label1.Visible = true;

        }
       
       // open();

       //// Label1.Text = Calendar1.SelectedDate.ToString();

       // string gg = Calendar1.SelectedDate.ToShortDateString();
        
       // string qq = "select image from DailyDarshan where date='"+gg+"'";
       // SqlCommand cmd = new SqlCommand(qq, cn);
       // dr2=cmd.ExecuteReader();
       // if (dr2.Read())
       // {


       //     ListView1.DataSource = dr2;
       //     ListView1.DataBind();
       //     Label1.Visible = false;

       // }
       // else
       // {
       //      ListView1.DataSource = dr2;
       //      ListView1.DataBind();

       //     Label1.Visible = true;
       //     Label1.Text = "No Images For This Date";
       // }
        
        
         
         
       // // Repeater1.DataSource = dr;
      
       // cn.Close();
        
    }
    protected void lnkbtn_Command(object sender, CommandEventArgs e)
    {
        string filepath = e.CommandName;
        Response.AddHeader("Content-Disposition", "attachment;filename=\"" + filepath + "\"");
        Response.TransmitFile(Server.MapPath(filepath));
        Response.End();
    }
  
   
   // protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
   // {
      /*  if (e.CommandName == "Download")
        {
            ImageButton img = (ImageButton)e.Item.FindControl("ImageButton1");
            string q;
            q = img.ImageUrl.ToString();
            Response.AddHeader("Content-Disposition", "attachment;filename=\"" + q + "\"");
            Response.TransmitFile(Server.MapPath(q));
            Response.End();
        }*/
        
        //Response.Redirect("CatDisplay.aspx?postid=" + q);

     //           string q;
      //  q = e.CommandName.ToString();
           

     //   LinkButton lnkbtn = sender as LinkButton;
      //  GridViewRow gvrow = lnkbtn.NamingContainer as GridViewRow;
  /*      string filePath = q;
        Response.AddHeader("Content-Disposition", "attachment;filename=\"" + filePath + "\"");
        Response.TransmitFile(Server.MapPath(filePath));
        Response.End();*/

     /*   string q;
        q = e.CommandName.ToString();
           
        // The file path to download.
        string filepath = q;
        // The file name used to save the file to the client's system..
        string filename = Path.GetFileName(filepath);
        System.IO.Stream stream = null;
        try
        {
            // Open the file into a stream. 
            stream = new FileStream(filepath, System.IO.FileMode.Open, System.IO.FileAccess.Read, System.IO.FileShare.Read);
            // Total bytes to read: 
            long bytesToRead = stream.Length;
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment; filename=" + filename);
            // Read the bytes from the stream in small portions. 
            while (bytesToRead > 0)
            {
                // Make sure the client is still connected. 
                if (Response.IsClientConnected)
                {
                    // Read the data into the buffer and write into the 
                    // output stream. 
                    byte[] buffer = new Byte[10000];
                    int length = stream.Read(buffer, 0, 10000);
                    Response.OutputStream.Write(buffer, 0, length);
                    Response.Flush();
                    // We have already read some bytes.. need to read 
                    // only the remaining. 
                    bytesToRead = bytesToRead - length;
                }
                else
                {
                    // Get out of the loop, if user is not connected anymore.. 
                    bytesToRead = -1;
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
            // An error occurred.. 
        }
        finally
        {
            if (stream != null)
            {
                stream.Close();
            }
        }*/
   // }

    protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}