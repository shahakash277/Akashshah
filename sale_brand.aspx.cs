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
    SqlConnection con;
    SqlCommand cmd;
    SqlDataAdapter adp;
    DataSet ds;

    void GetConnection()
    {
        con = new SqlConnection();
        con.ConnectionString = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Dell\Desktop\New folder\palakoptics\App_Data\palakoptics.mdf;Integrated Security=True";
        con.Open();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            GetConnection();
            GetData();
        }
    }

    void GetData()
    {
        cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT tbl_order_items.model_id, tbl_brand.brand_name FROM tbl_product INNER JOIN tbl_brand ON tbl_product.brand_id = tbl_brand.brand_id AND tb/l_product.brand_id = tbl_brand.brand_id INNER JOIN tbl_order INNER JOIN tbl_order_items ON tbl_order.order_id = tbl_order_items.order_id ON tbl_product.model_id = tbl_order_items.model_id";
        cmd.CommandType = CommandType.Text;
        adp = new SqlDataAdapter(cmd);
        ds = new DataSet("ds_brand_rpt"); //ds_Employee is dataset name
        adp.Fill(ds); //TblEmployee is Table name in database


    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        GetConnection();
        GetData();
        ds.WriteXml(Server.MapPath("~") + "\\App_Code\\tbl_brand_rpt.xml");
        ds.WriteXmlSchema(Server.MapPath("~") + "\\App_Code\\tbl_brand_rpt.xsd");

        //ReportDocument rd = new ReportDocument();
        //rd.Load(Server.MapPath("~//crymonth.rpt"));
        //rd.SetDataSource(ds);
        //CrystalReportViewer1.ReportSource = rd;
        //CrystalReportViewer1.DataBind();
    }
}