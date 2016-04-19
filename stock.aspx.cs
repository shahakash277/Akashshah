using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using System.Data;
using System.Data.SqlClient;


public partial class stock : System.Web.UI.Page
{
    String constr = System.Configuration.ConfigurationManager.ConnectionStrings["dbmslink"].ConnectionString;
    SqlConnection con = new SqlConnection();

    SqlCommand cmd;
    SqlDataAdapter adp;
    DataSet ds;
    void GetConnection()
    {
        con.Open();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        con.ConnectionString = constr;
        if (Page.IsPostBack == false)
        {
            GetConnection();
            GetData();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        GetConnection();
        GetData();
        ds.WriteXml(Server.MapPath("~") + "\\App_Code\\stock.xml");
        ds.WriteXmlSchema(Server.MapPath("~") + "\\App_Code\\stock.xsd");

        ReportDocument rd = new ReportDocument();
        rd.Load(Server.MapPath("~//CryStock.rpt"));
        rd.SetDataSource(ds);
        CrystalReportViewer1.ReportSource = rd;
        CrystalReportViewer1.DataBind();
 
    }
    void GetData()
    {
        cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "Select * from tbl_product where qty=0";
        cmd.CommandType = CommandType.Text;
        adp = new SqlDataAdapter(cmd);
        ds = new DataSet("ds_Stock"); //ds_Employee is dataset name
        adp.Fill(ds, "TblStock"); //TblEmployee is Table name in database


    }
}