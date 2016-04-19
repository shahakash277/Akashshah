using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using CrystalDecisions.CrystalReports.Engine;



public partial class dill_final : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataAdapter adp;
    DataSet ds;

    void GetConnection()
    {
        String constr = System.Configuration.ConfigurationManager.ConnectionStrings["dbmslink"].ConnectionString;
        con = new SqlConnection();
        con.ConnectionString = constr;
        con.Open();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            GetConnection();
            GetData();
        }
        GetConnection();
        GetData();
        ds.WriteXml(Server.MapPath("~") + "\\App_Code\\invoice.xml");
        ds.WriteXmlSchema(Server.MapPath("~") + "\\App_Code\\invoice.xsd");

        ReportDocument rd = new ReportDocument();
        rd.Load(Server.MapPath("~//bill.rpt"));
        rd.SetDataSource(ds);
        CrystalReportViewer1.ReportSource = rd;
        CrystalReportViewer1.DataBind();
    }
    
    void GetData()
    {
        cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT tbl_user.user_email, tbl_user.fname, tbl_user.lname, tbl_user.address, tbl_user.state, tbl_user.pincode, tbl_user.mobileno, tbl_order.order_date, tbl_order.total_amount, tbl_order_items.qty, tbl_order_items.total_price, tbl_order_items.model_id, tbl_product.pname, tbl_product.pprice, tbl_city.city FROM tbl_user INNER JOIN tbl_order ON tbl_user.user_email = tbl_order.user_email INNER JOIN tbl_order_items ON tbl_order.order_id = tbl_order_items.order_id INNER JOIN tbl_product ON tbl_order_items.model_id = tbl_product.model_id INNER JOIN tbl_city ON tbl_user.city = tbl_city.Id WHERE tbl_order.order_id=" + Session["order_id"].ToString();
        cmd.CommandType = CommandType.Text;
        adp = new SqlDataAdapter(cmd);
        ds = new DataSet("ds_Employee"); //ds_Employee is dataset name
        adp.Fill(ds, "TblEmployee"); //TblEmployee is Table name in database
    }
}