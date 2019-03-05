using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class New_Design_Index : System.Web.UI.MasterPage
{
    SqlConnection cn;
    SqlCommand cmd;
    SqlDataAdapter ad;
    SqlDataReader dr;
    DataSet ds;
    DataTable dt;

 
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void send_Click(object sender, EventArgs e)
    {
        cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True");
        cn.Open();

        string nm = name.Text;
        string em = email.Text;
        string city1 = city.Text;
        string country1 = country.Text;
        string msg = message.Text;

        string q = "insert into Feedback1 values ('" + nm + "','" + em + "','" + city1 + "','" + country1 + "','" + msg + "')";
        cmd = new SqlCommand(q, cn);
        cmd.ExecuteNonQuery();
       
         Response.Write("<script>alert('Record inserted')</script>");

      /*  string str = "<script>";

        str += "if(confirm('Your Data Submitted Successfully'))";
        str += "window.location='Home.aspx'";
        // str += "else";
        // str += "alert('j')";
        //str += "}";
        str += "</script>";*/

        //Above code is client side because of it is javascript code this code converted into server asp.net so
        // making in server side we have to convert this javascript in ASP.net so we must have to write below code 

       /* this.ClientScript.RegisterStartupScript(this.GetType(), "PopupScript", str);*/
        //this.ClientScript.RegisterStartupScript(this.GetType(), "StartupScript", str);

        //in every javascript code  is  in client side so javascript have to converted into server side so above one stmt must write in evry javascript
        cn.Close();

    }
      
    
}
