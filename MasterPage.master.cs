using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Page.Header.DataBind();
            try
            {
                //.Text = Session["lblitem"].ToString();
              //  lblprice.Text = Session["lblprice"].ToString();
                lbllogin.Text = Session["lbllogin"].ToString();
                lblitem.Text = Session["lblitem"].ToString();
                lblprice.Text = Session["lblprice"].ToString();
                lblitem1.Text = Session["lblitem"].ToString();
             //   lblshow.Text = Session["lblshow"].ToString();
               // lblhi.Text = Session["lblhi"].ToString();
            }
            catch {
              
            }
        }
        //if (!IsPostBack)
        //{
        //    Page.Header.DataBind();
     
        //    String str = System.Configuration.ConfigurationManager.ConnectionStrings["dbmslink"].ConnectionString;
        //    SqlConnection con = new SqlConnection(str);
        //    con.Open();
        //    DataSet ds = new DataSet();
        //    DataTable dt = new DataTable();
        //    string sql = "Select * from tbl_menu";
        //    SqlDataAdapter da = new SqlDataAdapter(sql, con);
        //    da.Fill(ds);
        //    dt = ds.Tables[0];
        //    DataRow[] drowpar = dt.Select("ParentID=" + 0);
           
        //    foreach (DataRow dr in drowpar)
        //    {

        //        Menubar.Items.Add(new MenuItem(dr["MenuName"].ToString(), dr["MenuID"].ToString(),
        //        "", dr["MenuLocation"].ToString()));
        //    }
        //    int i=1;
        //    foreach (DataRow dr in dt.Select("ParentID >" + 0))
        //    {
        //        MenuItem mnu = new MenuItem(dr["MenuName"].ToString(), dr["MenuID"].ToString(),
        //        "", dr["MenuLocation"].ToString());
        //        Menubar.FindItem(dr["ParentID"].ToString()).ChildItems.Add(mnu);
        //        if (i == 1)
        //        { 
        //            Menubar.FindItem(dr["ParentID"].ToString()).ChildItems.Add(new MenuItem(""));
        //            i++;
        //        }
        //    }
        //    con.Close();
        //}
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("product.aspx?query1=" + TextBox1.Text);
    }
}
