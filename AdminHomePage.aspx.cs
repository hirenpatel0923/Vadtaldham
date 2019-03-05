using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminHomePage : System.Web.UI.Page
{
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
    
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Clear();
        Response.Redirect("AdminLogIn.aspx");
    }
    protected void DailyInsert_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminDailyInsert.aspx");
    }
    protected void DailyDelete_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminDailyDelete.aspx");
    }
    protected void ShayanInsert_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminShayanInsert.aspx");
    }
    protected void ShayanDelete_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminShayanDelete.aspx");
    }
    protected void DeskWallInsert_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminDesktopInsert.aspx");
    }
    protected void Deskwalldelete_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminDesktopDelete.aspx");
    }
    protected void MobileWallInsert_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminMobileInsert.aspx");
    }
    protected void MobileWalldelete_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminMobileDelete.aspx");
    }
    protected void PhotoGallInsert_Click(object sender, EventArgs e)
    {
        Response.Redirect("insertalbum.aspx");
    }
    protected void Feedback_Click(object sender, EventArgs e)
    {
        Response.Redirect("GetFeedback.aspx");
    }
}