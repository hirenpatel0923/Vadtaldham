using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Data.Sql;
using System.IO;
using System.Text;
using System.Web.Security;

public partial class Admin : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cmd;
    SqlDataAdapter da;
    SqlDataAdapter adp;
    DataSet ds;
    string totalimg;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True");
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
   
    
    protected void BtnDDinsert_Click(object sender, EventArgs e)
    {
        PanelDDinsert.Visible = true;
        PanelDDdelete.Visible = false;
    }
    protected void BtnDDdelete_Click(object sender, EventArgs e)
    {
        PanelDDdelete.Visible = true;
        PanelDDinsert.Visible = false;
    }
    protected void Btnupload_Command(object sender, CommandEventArgs e)
    {
        if (e.CommandArgument == "DDinsert")
        {
            HttpFileCollection hfc = Request.Files;
            for (int i = 0; i < hfc.Count; i++)
            {
                HttpPostedFile hpf = hfc[i];
                if (hpf.ContentLength > 0)
                {
                    string filepath1 = "DailyImages/" + hpf.FileName;
                    hpf.SaveAs(Server.MapPath("DailyImages") + "\\" + Path.GetFileName(hpf.FileName));
                    cmd = new SqlCommand("insert into DailyDarshan values('" + filepath1 + "','" + Calendar1.SelectedDate + "')", cn);
                    cn.Open();
                    cmd.ExecuteNonQuery();
                    cn.Close();
                }
            }
        }
        else if (e.CommandArgument == "SDinsert")
        {
            HttpFileCollection hfc = Request.Files;
            for (int i = 0; i < hfc.Count; i++)
            {
                HttpPostedFile hpf = hfc[i];
                if (hpf.ContentLength > 0)
                {
                    string filepath1 = "ShayanImages/" + hpf.FileName;
                    hpf.SaveAs(Server.MapPath("ShayanImages") + "\\" + Path.GetFileName(hpf.FileName));
                    cmd = new SqlCommand("insert into ShayanDarshan values('" + filepath1 + "','" + Calendar2.SelectedDate + "')", cn);
                    cn.Open();
                    cmd.ExecuteNonQuery();
                    cn.Close();
                }
            }
        }
        else if (e.CommandArgument == "DWinsert")
        {
            HttpFileCollection hfc = Request.Files;
            for (int i = 0; i < hfc.Count; i++)
            {
                HttpPostedFile hpf = hfc[i];
                if (hpf.ContentLength > 0)
                {
                    string filepath1 = "DeskWallpaper/" + hpf.FileName;
                    hpf.SaveAs(Server.MapPath("DeskWallpaper") + "\\" + Path.GetFileName(hpf.FileName));
                    cmd = new SqlCommand("insert into DeskWallpaper values('" + filepath1 + "','" + Calendar3.SelectedDate + "')", cn);
                    cn.Open();
                    cmd.ExecuteNonQuery();
                    cn.Close();
                }
            }
        }
        else if (e.CommandArgument == "MWinsert")
        {
            HttpFileCollection hfc = Request.Files;
            for (int i = 0; i < hfc.Count; i++)
            {
                HttpPostedFile hpf = hfc[i];
                if (hpf.ContentLength > 0)
                {
                    string filepath1 = "MobileWallpaper/" + hpf.FileName;
                    hpf.SaveAs(Server.MapPath("MobileWallpaper") + "\\" + Path.GetFileName(hpf.FileName));
                    cmd = new SqlCommand("insert into MobileWallpaper values('" + filepath1 + "','" + Calendar4.SelectedDate + "')", cn);
                    cn.Open();
                    cmd.ExecuteNonQuery();
                    cn.Close();
                }
            }
        }
        else if(e.CommandArgument=="PGinsert")
        {
            if (FileUpload5.HasFile)
            {
                HttpFileCollection hfc = Request.Files;

                string filepath = "Gallary/" + FileUpload5.PostedFile.FileName;
                int count = hfc.Count - 1;
                cmd = new SqlCommand("insert into Album1 values ('" + TextBox1.Text + "','" + filepath + "','" + TextBox2.Text + "','" + Calendar7.SelectedDate + "','" + count + "')", cn);
                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();

                cmd = new SqlCommand("select id from Album1 where a_name = '" + TextBox1.Text + "'", cn);
                cn.Open();
                adp = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                adp.Fill(ds, "Album1");
                cn.Close();

                string albid = ds.Tables["Album1"].Rows[0][0].ToString();

                for (int i = 0; i < hfc.Count; i++)
                {
                    HttpPostedFile hpf = hfc[i];
                    if (hpf.ContentLength > 0)
                    {
                        string filepath1 = "Gallary/" + hpf.FileName;
                        hpf.SaveAs(Server.MapPath("Gallary") + "\\" + Path.GetFileName(hpf.FileName));
                        cmd = new SqlCommand("insert into Alb_Photo1 values ('" + Convert.ToInt16(albid) + "','" + filepath1 + "','" + Calendar7.SelectedDate + "')", cn);
                        cn.Open();
                        cmd.ExecuteNonQuery();
                        cn.Close();

                    }
                }

            }
        }
        else if(e.CommandArgument=="EMGinsert")
        {
            string filename = "E_Magazine/" + Path.GetFileName(FileUpload9.PostedFile.FileName);
            FileUpload9.SaveAs(Server.MapPath(filename));
            string filename1 = "E_Magazine/" + Path.GetFileName(FileUpload10.PostedFile.FileName);
            FileUpload10.SaveAs(Server.MapPath(filename1));
            cmd = new SqlCommand("insert into E_Magazine values('" + TextBox5.Text + "','" + TextBox6.Text + "','" + filename + "','" + filename1 + "')", cn);
            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();
                
        }
        else if(e.CommandArgument=="EBKinsert")
        {
            string filename = "E_Book/" + Path.GetFileName(FileUpload11.PostedFile.FileName);
            FileUpload11.SaveAs(Server.MapPath(filename));
            string filename1 = "E_Book/" + Path.GetFileName(FileUpload12.PostedFile.FileName);
            FileUpload12.SaveAs(Server.MapPath(filename1));
            cmd = new SqlCommand("insert into E_Book values('" + TextBox7.Text + "','" + TextBox8.Text + "','" + TextBox9.Text + "','" + TextBox10.Text + "','" + DropDownList1.SelectedItem.ToString() + "','" + filename + "','" + filename1 + "')", cn);
            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();
        }
        else if (e.CommandArgument == "DMPinsert")
        {
            string delimg = null; 

            if (FileUpload7.HasFile)
            {
                HttpFileCollection hfc = Request.Files;
                string img = null;
                string imgname = file(img);

                string filepath = "DMP/" + imgname;
                delimg = filepath;
                cmd = new SqlCommand("insert into DivineAlbum values ('" + TextBox3.Text + "','" + filepath + "','" + TextBox4.Text + "','" + Calendar8.SelectedDate + "','" + hfc.Count + "')", cn);
                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();
            }
            
            if (FileUpload8.HasFile)
            {
                //HttpFileCollection hfc = Request.Files;

                //string img = null;
                //string imgname = file(img);

                //string filepath = "DMP/" + imgname;
                //cmd = new SqlCommand("insert into DivineAlbum values ('" + TextBox3.Text + "','" + filepath + "','" + TextBox4.Text + "','" + Calendar8.SelectedDate + "','" + hfc.Count + "')", cn);
                //cn.Open();
                //cmd.ExecuteNonQuery();
                //cn.Close();
            
            
                HttpFileCollection hfc1 = Request.Files;

                cmd = new SqlCommand("select id from DivineAlbum where a_name = '" + TextBox3.Text + "'", cn);
                cn.Open();
                adp = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                adp.Fill(ds, "DivineAlbum");
                cn.Close();
                string albid = ds.Tables["DivineAlbum"].Rows[0][0].ToString();

                for (int i = 0; i < hfc1.Count; i++)
                {
                    HttpPostedFile hpf = hfc1[i];
                    if (hpf.ContentLength > 0)
                    {
                        string filepath1 = "DMP/" + hpf.FileName;
                        hpf.SaveAs(Server.MapPath("DMP") + "\\" + Path.GetFileName(hpf.FileName));
                        cmd = new SqlCommand("insert into DivineMusic values ('" + Convert.ToInt16(albid) + "','"+ hpf.FileName +"','" + filepath1 + "')", cn);
                        cn.Open();
                        cmd.ExecuteNonQuery();
                        cn.Close();

                    }
                }

                int ts = hfc1.Count - 2;

                cmd = new SqlCommand("update DivineAlbum set total_song='" + ts + "' where id='" + Convert.ToInt64(albid) + "'", cn);
                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();
            }
            cmd = new SqlCommand("delete from DivineMusic where m_path='" + delimg + "'", cn);
            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();

        }
        else if (e.CommandArgument == "MRinsert")
        {
            HttpFileCollection hfc = Request.Files;
            for (int i = 0; i < hfc.Count; i++)
            {
                HttpPostedFile hpf = hfc[i];
                if (hpf.ContentLength > 0)
                {
                    string filepath1 = "MobileRingtone/" + hpf.FileName;
                    hpf.SaveAs(Server.MapPath("MobileRingtone") + "\\" + Path.GetFileName(hpf.FileName));
                    cmd = new SqlCommand("insert into MobileRingtone values('" + hpf.FileName + "','" + filepath1 + "')", cn);
                    cn.Open();
                    cmd.ExecuteNonQuery();
                    cn.Close();
                }
            }
        }
        else
        { 
            
        }
    }

    public string file(string f)
    {
        f = FileUpload7.PostedFile.FileName;
        return f;
    }

    protected void BtnDDupload_Click(object sender, EventArgs e)
    {
        
    }
    protected void BtnDWinsert_Click(object sender, EventArgs e)
    {
        PanelDWinsert.Visible = true;
        PanelDWdelete.Visible = false;
    }
    protected void BtnDWdelete_Click(object sender, EventArgs e)
    {
        PanelDWinsert.Visible = false;
        PanelDWdelete.Visible = true;
        ListView3.DataBind();
    }
    protected void BtnSDinsert_Click(object sender, EventArgs e)
    {
        PanelSDinsert.Visible = true;
        PanelSDdelete.Visible = false;
    }
    protected void BtnSDdelete_Click(object sender, EventArgs e)
    {
        PanelSDinsert.Visible = false;
        PanelSDdelete.Visible = true;
    }
    protected void BtnMWinsert_Click(object sender, EventArgs e)
    {
        PanelMWinsert.Visible = true;
        PanelMWdelete.Visible = false;
    }
    protected void BtnMWdelete_Click(object sender, EventArgs e)
    {
        PanelMWinsert.Visible = false;
        PanelMWdelete.Visible = true;
        ListView4.DataBind();
    }
    protected void Calendar5_SelectionChanged(object sender, EventArgs e)
    {
        Session["seldate1"] = Calendar5.SelectedDate.ToShortDateString();
        string date = Session["seldate1"].ToString();
        cmd = new SqlCommand("select image from DailyDarshan where date='" + Convert.ToDateTime(date) + "'", cn);
        cn.Open();
        adp = new SqlDataAdapter(cmd);
        cmd.ExecuteNonQuery();
        ds = new DataSet();
        adp.Fill(ds, "DailyDarshan");
        cn.Close();
        int count = ds.Tables["DailyDarshan"].Rows.Count;
        if (count > 0)
        {
            Label1.Visible = false;
            DDdelete.Visible = true;
        }
        else
        {
            Label1.Text = "No images for this date";
            Label1.Visible = true;
            DDdelete.Visible = false;
        }
    }

    //public static List<DataKey> GetSelectedDataKeys(this ListView control, string checkBoxId)
    //{
    //    return control.Items.Where(x => IsChecked(x, checkBoxId))
    //       .Select(x => control.DataKeys[x.DisplayIndex])
    //       .ToList();
    //}
    //private static bool IsChecked(ListViewDataItem item, string checkBoxId)
    //{
    //    var control = item.FindControl(checkBoxId) as CheckBox;
    //    if (control == null)
    //    {
    //        return false;
    //    }
    //    return control.Checked;
    //}
   

    protected void Btndelete_Command(object sender, CommandEventArgs e)
    {
        if (e.CommandArgument == "DDdelete")
        {
            StringBuilder strSql = new StringBuilder(string.Empty);
            for (int i = 0; i < ListView1.Items.Count; i++)
            {
                CheckBox chk = ListView1.Items[i].FindControl("CheckBox1") as CheckBox;
                ImageButton img = ListView1.Items[i].FindControl("ImageButton1") as ImageButton;
                if (chk != null)
                {
                    if (chk.Checked)
                    {
                        string id = img.CommandArgument.ToString() ;
                        string imgurl = img.ImageUrl;
                        string path1 = Server.MapPath(imgurl);
                        FileInfo file = new FileInfo(path1);
                        if (file.Exists)
                        {
                            file.Delete();
                        }

                        string query = "delete from DailyDarshan where id='" + Convert.ToInt64(id) + "'";
                        strSql.Append(query);
                    }
                }
            }
            cn.Open();
            SqlCommand cmd = new SqlCommand(strSql.ToString(), cn);
            cmd.ExecuteNonQuery();
            cn.Close();
            ListView1.DataBind();
        
        }
        else if(e.CommandArgument == "SDdelete")
        {
            StringBuilder strSql = new StringBuilder(string.Empty);
            for (int i = 0; i < ListView2.Items.Count; i++)
            {
                CheckBox chk = ListView2.Items[i].FindControl("CheckBox2") as CheckBox;
                ImageButton img = ListView2.Items[i].FindControl("ImageButton2") as ImageButton;
                if (chk != null)
                {
                    if (chk.Checked)
                    {
                        string imgurl = img.ImageUrl;
                        string id = img.CommandArgument;
                        string path1 = Server.MapPath(imgurl);
                        FileInfo file = new FileInfo(path1);
                        if (file.Exists)
                        {
                            file.Delete();
                        }

                        string query = "delete from ShayanDarshan where id='" + Convert.ToInt64(id) + "'";
                        strSql.Append(query);
                    }
                }
            }
            cn.Open();
            SqlCommand cmd = new SqlCommand(strSql.ToString(), cn);
            cmd.ExecuteNonQuery();
            cn.Close();
            ListView2.DataBind();
        }
        else
        {
        
        }
            
        }


    protected void lnkbtn_Command(object sender, CommandEventArgs e)
    {

        double filepath = double.Parse(e.CommandName.ToString());

        cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True");
        cn.Open();
        string g = "select * from DeskWallpaper where id='" + filepath + "'";
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


        string gg = "delete from DeskWallpaper where id='" + filepath + "'";
        cmd = new SqlCommand(gg, cn);
        cmd.ExecuteNonQuery();

        cn.Close();
        Response.Write("<script>alert('Image Deleted Successfully')</script>");
        ListView3.DataBind();
       
    }

    protected void lnkbtn1_Command(object sender, CommandEventArgs e)
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
        ListView4.DataBind();

       
    }

    protected void Calendar6_SelectionChanged(object sender, EventArgs e)
    {
        Session["seldate1"] = Calendar6.SelectedDate.ToShortDateString();
        string date = Session["seldate1"].ToString();
        cmd = new SqlCommand("select image from ShayanDarshan where date='" + Convert.ToDateTime(date) + "'", cn);
        cn.Open();
        adp = new SqlDataAdapter(cmd);
        cmd.ExecuteNonQuery();
        ds = new DataSet();
        adp.Fill(ds, "ShayanDarshan");
        cn.Close();
        int count = ds.Tables["ShayanDarshan"].Rows.Count;
        if (count > 0)
        {
            Label2.Visible = false;
            SDdelete.Visible = true;
        }
        else
        {
            Label2.Text = "No images for this date";
            Label2.Visible = true;
            SDdelete.Visible = false;
        }
    }
    protected void Lnksignout_Click(object sender, EventArgs e)
    {
        
        Session.Abandon();
        Session.Clear();
        Session["username"] = null;
        FormsAuthentication.SignOut();
        Response.Redirect("AdminLogIn.aspx");
    }

    protected void BtnPGinsert_Click(object sender, EventArgs e)
    {
        PanelPGinsert.Visible = true;
        PanelPGdelete.Visible = false;
    }
    protected void BtnPGdelete_Click(object sender, EventArgs e)
    {
        PanelPGinsert.Visible = false;
        PanelPGdelete.Visible = true;
    }
    protected void Btnalbdelete_Click(object sender, EventArgs e)
    {
        SubPanelalbdelete.Visible = true;
        SubPanelphotodelete.Visible = false;
        Alblist.DataBind();
    }
    protected void Btnphotodelete_Click(object sender, EventArgs e)
    {
        SubPanelalbdelete.Visible = false;
        SubPanelphotodelete.Visible = true;
        Listofalbums.DataBind();
    }
    protected void Btndeletealb_Click(object sender, EventArgs e)
    {
        StringBuilder strSql = new StringBuilder(string.Empty);
        StringBuilder strsql1 = new StringBuilder(string.Empty);
        for (int i = 0; i < Alblist.Items.Count; i++)
        {
            CheckBox chk = Alblist.Items[i].FindControl("CheckBox3") as CheckBox;
            ImageButton img = Alblist.Items[i].FindControl("ImageButton5") as ImageButton;
            if (chk != null)
            {
                if (chk.Checked)
                {
                    string imgurl = img.ImageUrl;
                    string id = img.CommandArgument;

                    SqlCommand cmdsel = new SqlCommand("select * from Alb_Photo1 where alb_id='" + Convert.ToInt16(id) + "'", cn);
                    cn.Open();
                    SqlDataAdapter adp1 = new SqlDataAdapter(cmdsel);
                    cmdsel.ExecuteNonQuery();
                    DataSet ds1 = new DataSet();
                    adp1.Fill(ds1, "Alb_Photo1");
                    int row = ds1.Tables["Alb_Photo1"].Rows.Count;

                        for (int j = 0; j < row; j++)
                        {
                            string imagepath = Server.MapPath(ds1.Tables["Alb_Photo1"].Rows[j][2].ToString());
                            FileInfo filepath = new FileInfo(imagepath);
                            if (filepath.Exists)
                            {
                                filepath.Delete();
                            }
                            string query1 = "delete from Alb_Photo1 where alb_id='" + Convert.ToInt64(id) + "'";
                            strsql1.Append(query1);
                        }

                    SqlCommand cmd2 = new SqlCommand(strsql1.ToString(), cn);
                    cmd2.ExecuteNonQuery();
                    cn.Close();

                    string path1 = Server.MapPath(imgurl);
                    FileInfo file = new FileInfo(path1);
                    if (file.Exists)
                    {
                        file.Delete();
                    }
                    string query = "delete from Album1 where id='" + Convert.ToInt64(id) + "'";
                    strSql.Append(query);
                }
            }
        }
        cn.Open();
        SqlCommand cmd = new SqlCommand(strSql.ToString(), cn);
        cmd.ExecuteNonQuery();
        cn.Close();
        Alblist.DataBind();
    }

    protected void showphoto_Command(object sender, CommandEventArgs e)
    {
        Session["albumid"] = e.CommandArgument;
        Listofalbums.Visible = false;
        ListView5.DataBind();
        ListView5.Visible = true;
        LinkButton3.Visible = true;
        deletebutton.Visible = true;
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Listofalbums.DataBind();
        Listofalbums.Visible = true;
        ListView5.Visible = false;
        deletebutton.Visible = false;
        LinkButton3.Visible = false;
    }
    protected void deletebutton_Click(object sender, EventArgs e)
    {
        int abc = 0;
        string albid = null;
        string listitem = null;
        StringBuilder strSql = new StringBuilder(string.Empty);
        for (int i = 0; i < ListView5.Items.Count; i++)
        {
            CheckBox chk = ListView5.Items[i].FindControl("CheckBox7") as CheckBox;
            ImageButton img = ListView5.Items[i].FindControl("ImageButton7") as ImageButton;
            if (chk != null)
            {
                if (chk.Checked)
                {
                    string imgurl = img.ImageUrl;
                    string id = img.CommandArgument;
                    string path1 = Server.MapPath(imgurl);
                    FileInfo file = new FileInfo(path1);
                    if (file.Exists)
                    {
                        file.Delete();
                    }

                    string query = "delete from Alb_Photo1 where id='" + Convert.ToInt64(id) + "'";
                    strSql.Append(query);
                    abc++;
                }
                else
                {
                    listitem = img.ImageUrl;
                }
            }

            albid = img.CommandName.ToString();    
        }
        int total = ListView5.Items.Count;
        int subimg = total - abc;

        if (total == abc)
        {
            SqlCommand cmd2 = new SqlCommand("delete from Album1 where id='" + Convert.ToInt64(albid) + "'", cn);
            cn.Open();
            cmd2.ExecuteNonQuery();
            cn.Close();
        }
        else
        {
            SqlCommand cmd1 = new SqlCommand("update Album1 set total_images='" + subimg + "',a_image='"+ listitem +"' where id='" + Convert.ToInt64(albid) + "'", cn);
            cn.Open();
            cmd1.ExecuteNonQuery();
            cn.Close();
        }
        cn.Open();
        SqlCommand cmd = new SqlCommand(strSql.ToString(), cn);
        cmd.ExecuteNonQuery();
        cn.Close();
        ListView5.DataBind();
    }

    protected void BtnMRinsert_Click(object sender, EventArgs e)
    {
        PanelMRinsert.Visible = true;
        PanelMRdelete.Visible = false;
    }
    protected void BtnMRdelete_Click(object sender, EventArgs e)
    {
        PanelMRinsert.Visible = false;
        PanelMRdelete.Visible = true;
        GridView1.DataBind();
    }
   
                
          

    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        FileStream stream = null;

        LinkButton lnkbtn = sender as LinkButton;
        GridViewRow gvrow = lnkbtn.NamingContainer as GridViewRow;
        
        string filePath = "MobileRingtone/" + gvrow.Cells[0].Text.ToString();
        string path1 = Server.MapPath(filePath);
        FileInfo file = new FileInfo(path1);
        if (stream != null)
        {
            stream = file.Open(FileMode.Open, FileAccess.Read, FileShare.None);
            stream.Close();
        }
        if (file.Exists)
        {
                file.Delete();
        }
        SqlCommand cmd = new SqlCommand("delete from MobileRingtone where id='"+ lnkbtn.CommandArgument +"'", cn);
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();

        GridView1.DataBind();
    }
    protected void BtnDMPupload_Click(object sender, EventArgs e)
    {

    }
    protected void BtnDMPinsert_Click(object sender, EventArgs e)
    {
        PanelDMPinsert.Visible = true;
        PanelDMPdelete.Visible = false;
    }
    protected void BtnDMPdelete_Click(object sender, EventArgs e)
    {
        PanelDMPinsert.Visible = false;
        PanelDMPdelete.Visible = true;
    }
    protected void SubbtnDMPdelete1_Click(object sender, EventArgs e)
    {
        SubPanelDMPdelete1.Visible = true;
        SubPanelDMPdelete2.Visible = false;
    }
    protected void SubbtnDMPdelete2_Click(object sender, EventArgs e)
    {
        SubPanelDMPdelete1.Visible = false;
        SubPanelDMPdelete2.Visible = true;
    }
    protected void BtndeleteDMPalb_Click(object sender, EventArgs e)
    {
        StringBuilder strSql = new StringBuilder(string.Empty);
        StringBuilder strsql1 = new StringBuilder(string.Empty);
        for (int i = 0; i < ListView6.Items.Count; i++)
        {
            CheckBox chk = ListView6.Items[i].FindControl("CheckBox3") as CheckBox;
            ImageButton img = ListView6.Items[i].FindControl("ImageButton5") as ImageButton;
            if (chk != null)
            {
                if (chk.Checked)
                {
                    string imgurl = img.ImageUrl;
                    string id = img.CommandArgument;

                    SqlCommand cmdsel = new SqlCommand("select * from DivineMusic where alb_id='" + Convert.ToInt16(id) + "'", cn);
                    cn.Open();
                    SqlDataAdapter adp1 = new SqlDataAdapter(cmdsel);
                    cmdsel.ExecuteNonQuery();
                    DataSet ds1 = new DataSet();
                    adp1.Fill(ds1, "DivineMusic");
                    int row = ds1.Tables["DivineMusic"].Rows.Count;

                    for (int j = 0; j < row; j++)
                    {
                        string musicpath = Server.MapPath(ds1.Tables["DivineMusic"].Rows[j][3].ToString());
                        FileInfo filepath = new FileInfo(musicpath);
                        if (filepath.Exists)
                        {
                            filepath.Delete();
                        }
                        string query1 = "delete from DivineMusic where alb_id='" + id + "'";
                        strsql1.Append(query1);
                    }

                    SqlCommand cmd2 = new SqlCommand(strsql1.ToString(), cn);
                    cmd2.ExecuteNonQuery();
                    cn.Close();

                    string path1 = Server.MapPath(imgurl);
                    FileInfo file = new FileInfo(path1);
                    if (file.Exists)
                    {
                        file.Delete();
                    }
                    string query = "delete from DivineAlbum where id='" + Convert.ToInt64(id) + "'";
                    strSql.Append(query);
                }
            }
        }
        cn.Open();
        SqlCommand cmd = new SqlCommand(strSql.ToString(), cn);
        cmd.ExecuteNonQuery();
        cn.Close();
        ListView6.DataBind();
    }
    protected void BtnMRupload_Click(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        Panel2.Visible = false;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = true;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        string filepath = "video/" + Path.GetFileName(FileUpload13.PostedFile.FileName);
        FileUpload13.SaveAs(Server.MapPath(filepath));
        cmd = new SqlCommand("insert into video values('" + TextBox11.Text + "','" + Calendar9.SelectedDate + "','"+ filepath +"','" + TextBox12.Text + "')", cn);
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
    }
}