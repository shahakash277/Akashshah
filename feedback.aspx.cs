using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class feedback : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        SqlConnection con;
        SqlCommand cmd = new SqlCommand();
        String str = System.Configuration.ConfigurationManager.ConnectionStrings["dbmslink"].ConnectionString;

        con = new SqlConnection(str);
        con.Open();
        cmd.Connection = con;
        cmd.CommandText = "insert into tbl_feedback values('"+txtemail.Text+"','"+txtsubject.Text+"','"+txtcontent.Text+"')";
        cmd.CommandType = CommandType.Text;

        int x = cmd.ExecuteNonQuery();

        if (x == 1)
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "key", "alert('Thank You For Your Feedback We Will Do Our Best To Imporve.....')", true);
            
        }
        Response.Redirect("home.aspx");
    }
}