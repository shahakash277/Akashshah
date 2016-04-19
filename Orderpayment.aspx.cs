using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Orderpayment : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            try
            {
                if (Session["xyz"].ToString() == "1")
                {

                }
            }
            catch
            {
                lblcardname.Visible = false;
                lblcardno.Visible = false;
                lblcvv.Visible = false;
                lblexpiry.Visible = false;
                txtcardname.Visible = false;
                txtcardno.Visible = false;
                txtcvv.Visible = false;
                txtmm.Visible = false;
                txtyy.Visible = false;

                Session["xyz"] = "1";
            }
        }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection( System.Configuration.ConfigurationManager.ConnectionStrings["dbmslink"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        con.Open();
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;
        DateTime dt=DateTime.Now;
        SqlDataReader dr;
        if (ddlpaymenttype.SelectedItem.ToString() == "Case On Delivery")
        {
            cmd.CommandText = "insert into tbl_order (user_email,order_date,order_time,total_amount,order_type) values('" + Session["username"].ToString() + "','" + dt.ToString("M/d/yyyy") + "','" + dt.ToString("hh:mm:ss") + "'," + Session["total"].ToString() + ",'"+ddlpaymenttype.SelectedItem.ToString()+"')";
        }
        else
        {
            cmd.CommandText = "insert into tbl_order (user_email,order_date,order_time,total_amount,order_type,card_no,name_card,expiry,cvv) values('" + Session["username"].ToString() + "','" + dt.ToString("M/d/yyyy") + "','" + dt.ToString("hh:mm:ss") + "'," + Session["total"].ToString() + ",'" + ddlpaymenttype.SelectedItem.ToString() + "',"+txtcardno.Text.ToString()+",'"+txtcardname.Text.ToString()+"','01/"+txtmm.ToString()+"/"+txtyy.ToString()+"',"+txtcvv.Text.ToString()+")";
    
        }
        int z=cmd.ExecuteNonQuery();
        if (z == 1)
        {
            con.Close();
            con.Open();
            cmd.CommandText = "select order_id from tbl_order where user_email='" + Session["username"].ToString() + "' and order_date='" + dt.ToString("M/d/yyyy") + "' and order_time='" + dt.ToString("hh:mm:ss") + "'";
            dr=cmd.ExecuteReader();
            dr.Read();
            Session["order_id"] = dr[0].ToString();
            con.Close();
            con.Open();
            cmd.CommandText = "select * from tbl_cart where user_email='"+Session["username"].ToString()+"'";
       
            dr = cmd.ExecuteReader();
            DataTable dat=new DataTable();
            dat.Load(dr);
            int rows = dat.Rows.Count;
            String[] model_id = new String[rows];
            String[] qty = new String[rows];
            String[] price = new String[rows];
            int i = 0;
            foreach (DataRow dar in dat.Rows)
            {
                model_id[i] = dar[1].ToString();
                qty[i] = dar[2].ToString();
                price[i] = dar[3].ToString();
                i++;
            }
            con.Close();
            con.Open();
            for (i = 0; i < rows; i++)
            {
                cmd.CommandText = "insert into tbl_order_items values('" + Session["order_id"].ToString() + "','" + model_id[i] + "'," + qty[i] + "," + price[i] + ")";
                int x=cmd.ExecuteNonQuery();
            }
            con.Close();
            con.Open();
            cmd.CommandText = "insert into tbl_shipping (user_email,fname,lname,address,state,city,pincode,mobileno,order_id) values ('" + Session["username"].ToString() + "','" + Session["firstname"].ToString() + "','" + Session["lastname"].ToString() + "','" + Session["address"].ToString() + "','" + Session["state"].ToString() + "','" + Session["city"].ToString() + "'," + Session["zip"].ToString() + "," + Session["mobile"].ToString() + "," + Session["order_id"].ToString() + ")";
           // cmd.CommandText = "select order_id tbl_order where user_email='" + Session["user_email"].ToString() + "' and order_date='" + dt.ToString("M/d/yyyy") + "' and order_time='" + dt.ToString("hh:mm:ss") + "'";
            int xz= cmd.ExecuteNonQuery();
            Response.Redirect("order_display.aspx");
        }
     
               
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlpaymenttype.SelectedItem.ToString() == "Case On Delivery")
        {
            lblcardname.Visible = false;
            lblcardno.Visible = false;
            lblcvv.Visible = false;
            lblexpiry.Visible = false;
            txtcardname.Visible = false;
            txtcardno.Visible = false;
            txtcvv.Visible = false;
            txtmm.Visible = false;
            txtyy.Visible = false;
        }
        else 
        {
            lblcardname.Visible = true;
            lblcardno.Visible = true;
            lblcvv.Visible = true;
            lblexpiry.Visible = true;
            txtcardname.Visible = true;
            txtcardno.Visible = true;
            txtcvv.Visible = true;
            txtmm.Visible = true;
            txtyy.Visible = true;
        }
    }
}