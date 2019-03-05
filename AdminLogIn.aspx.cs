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


public partial class AdminLogin : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cmd;
    SqlDataAdapter da;
    SqlDataAdapter adp;
    DataTable dt;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True");
       
    }
    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        bool Authenticated = false;
        Authenticated = UserAuthenticate(Login1.UserName, Login1.Password);
        e.Authenticated = Authenticated;
        if (Authenticated == true)
        {
            Response.Redirect("Admin.aspx");
        }
    }
    private bool UserAuthenticate(string UserName, string Password)
    {
        bool boolReturnValue = false;




        string chkUser = "Select * FROM [admin] where uname='" + UserName + "' AND pass='" + Password + "'";
        cmd = new SqlCommand(chkUser, cn);
        cn.Open();
        da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds);
        cn.Close();
        dt = ds.Tables[0];

        //Here Below Code Session is Created so user cant back to its previous page after logout         
        if (dt.Rows.Count > 0)
        {
            boolReturnValue = true;
            Session["username"] = dt.Rows[0]["uname"].ToString();
            //   Session["un"] = dt.Rows[0]["uname"].ToString();
            // Session["ps"] = dt.Rows[0]["password"].ToString();
        }
        return boolReturnValue;


    }
}