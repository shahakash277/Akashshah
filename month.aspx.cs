using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using CrystalDecisions.CrystalReports.Engine;

public partial class month : System.Web.UI.Page
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
    protected void Button1_Click(object sender, EventArgs e)
    {
       
        GetData();
        ds.WriteXml(Server.MapPath("~") + "\\App_Code\\month.xml");
        ds.WriteXmlSchema(Server.MapPath("~") + "\\App_Code\\month.xsd");

        ReportDocument rd = new ReportDocument();
        rd.Load(Server.MapPath("~//Admin//crymonth.rpt"));
        rd.SetDataSource(ds);
        CrystalReportViewer1.ReportSource = rd;
        CrystalReportViewer1.DataBind();

    }
    void GetData()
    {
        cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT tbl_product.pname, tbl_product.pprice, tbl_order_items.model_id, tbl_order_items.qty, tbl_order_items.total_price FROM tbl_order INNER JOIN tbl_order_items ON tbl_order.order_id = tbl_order_items.order_id INNER JOIN tbl_product ON tbl_order_items.model_id = tbl_product.model_id where MONTH(tbl_order.order_date) =" + DropDownList1.SelectedValue;
        cmd.CommandType = CommandType.Text;
        adp = new SqlDataAdapter(cmd);
        ds = new DataSet("ds_month"); //ds_Employee is dataset name
        adp.Fill(ds, "Tblmonth"); //TblEmployee is Table name in database


    }
}