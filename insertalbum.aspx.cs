using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.IO;

public partial class insertalbum : System.Web.UI.Page
{
    SqlCommand cmd;
    SqlConnection con;
    SqlDataAdapter adp;
    DataSet ds;
    DataSet ds2;
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            HttpFileCollection hfc = Request.Files;

            string filepath = "Gallary/" + FileUpload1.PostedFile.FileName;
            cmd = new SqlCommand("insert into Album1 values ('" + txtalbname.Text + "','" + filepath + "','" + txtdesc.Text + "','" + Calendar1.SelectedDate + "','"+ hfc.Count +"')", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            cmd = new SqlCommand("select id from Album1 where a_name = '" + txtalbname.Text + "'",con);
            con.Open();
            adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adp.Fill(ds, "Album1");
            con.Close();

            string albid = ds.Tables["Album1"].Rows[0][0].ToString();

            for (int i = 0; i < hfc.Count; i++)
            {
                HttpPostedFile hpf = hfc[i];
                if (hpf.ContentLength > 0)
                {
                    string filepath1 = "Gallary/" + hpf.FileName;
                    hpf.SaveAs(Server.MapPath("Gallary") + "\\" + Path.GetFileName(hpf.FileName));
                    cmd = new SqlCommand("insert into Alb_Photo1 values ('" + Convert.ToInt16(albid) + "','" + filepath1 + "','" + Calendar1.SelectedDate + "')", con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
             
                }
             }
           
        }
    }
    protected void txtalbname_TextChanged(object sender, EventArgs e)
    {

    }
}