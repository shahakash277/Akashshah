using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using CrystalDecisions.CrystalReports.Engine;

public partial class city : System.Web.UI.Page
{
   
    String constr = System.Configuration.ConfigurationManager.ConnectionStrings["dbmslink"].ConnectionString;
    SqlConnection con = new SqlConnection();

    SqlCommand cmd;
    SqlDataAdapter adp;
    DataSet ds;

    protected void Page_Load(object sender, EventArgs e)
    {
        con.ConnectionString = constr;
        if (Page.IsPostBack == false)
        {   
            GetData();
        }
    }

    void GetData()
    {
        cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT tbl_user.fname, tbl_user.lname, tbl_user.mobileno, tbl_user.user_email, tbl_city.city FROM tbl_user INNER JOIN tbl_order ON tbl_user.user_email = tbl_order.user_email INNER JOIN tbl_shipping ON tbl_user.user_email = tbl_shipping.user_email INNER JOIN tbl_city ON tbl_user.city = tbl_city.Id";
        cmd.CommandType = CommandType.Text;
        adp = new SqlDataAdapter(cmd);
        ds = new DataSet("ds_city_rpt"); //ds_Employee is dataset name
        adp.Fill(ds); //TblEmployee is Table name in database


    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        
        GetData();
        ds.WriteXml(Server.MapPath("~") + "\\App_Code\\tbl_city_rpt.xml");
        ds.WriteXmlSchema(Server.MapPath("~") + "\\App_Code\\tbl_city_rpt.xsd");

        ReportDocument rd = new ReportDocument();
        rd.Load(Server.MapPath("~//cryCity.rpt"));
        rd.SetDataSource(ds);
        CrystalReportViewer1.ReportSource = rd;
        CrystalReportViewer1.DataBind();
    }
}