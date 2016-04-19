using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class shipping : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection con;
        SqlCommand cmd = new SqlCommand();
        String str = System.Configuration.ConfigurationManager.ConnectionStrings["dbmslink"].ConnectionString;
        SqlDataReader dr;
        con = new SqlConnection(str);
        con.Open();
        cmd.Connection = con;
        cmd.CommandText = "select * from tbl_city ";
        cmd.CommandType = CommandType.Text;
        dr = cmd.ExecuteReader();
        dr.Read();

        DataTable Dt = new DataTable();
        Dt.Load(dr);
        DropDownList1.DataTextField = Dt.Columns[1].ToString();
        DropDownList1.DataValueField = Dt.Columns[0].ToString();
        con.Close();



        con.Open();
        cmd.Connection = con;
        cmd.CommandText = "select * from tbl_user,tbl_city where tbl_user.city=tbl_city.id and user_email='"+Session["username"].ToString()+"'";
        cmd.CommandType = CommandType.Text;
        dr = cmd.ExecuteReader();
        dr.Read();

        txtfname.Text = dr[2].ToString();
        txtlname.Text = dr[3].ToString();
        txtadd.Text = dr[5].ToString();
       // txtcity.Text = dr[7].ToString();
        txtstate.Text = dr[6].ToString();
        txtzip.Text = dr[8].ToString();
        txtmobile.Text = dr[9].ToString();
       // con.Close();



       

        DropDownList1.SelectedIndex = DropDownList1.Items.IndexOf(DropDownList1.Items.FindByText(dr[13].ToString()));
       // DropDownList1.SelectedItem.Text = dr[13].ToString();
        //DropDownList1.SelectedItem.Value = dr[12].ToString();

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
     


        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dbmslink"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        con.Open();
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;
        DateTime dt = DateTime.Now;
        SqlDataReader dr;
        cmd.CommandText = "insert into tbl_order (user_email,order_date,order_time,total_amount) values('" + Session["username"].ToString() + "','" + dt.ToString("M/d/yyyy") + "','" + dt.ToString("hh:mm:ss") + "'," + Session["total"].ToString() + ")";
        int z = cmd.ExecuteNonQuery();
        if (z == 1)
        {
            con.Close();
            con.Open();
            cmd.CommandText = "select order_id from tbl_order where user_email='" + Session["username"].ToString() + "' and order_date='" + dt.ToString("M/d/yyyy") + "' and order_time='" + dt.ToString("hh:mm:ss") + "'";
            dr = cmd.ExecuteReader();
            dr.Read();
            Session["order_id"] = dr[0].ToString();
            con.Close();
            con.Open();
            cmd.CommandText = "select * from tbl_cart where user_email='" + Session["username"].ToString() + "'";

            dr = cmd.ExecuteReader();
            DataTable dat = new DataTable();
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
                int x = cmd.ExecuteNonQuery();
            }
            con.Close();
            con.Open();
            cmd.CommandText = "insert into tbl_shipping (user_email,fname,lname,address,state,city,pincode,mobileno,order_id) values ('" + Session["username"].ToString() + "','" + txtfname.Text.ToString() + "','" + txtlname.Text.ToString() + "','" + txtadd.Text.ToString() + "','" + txtstate.Text.ToString() + "'," +DropDownList1.SelectedValue.ToString() + "," + txtzip.Text.ToString() + "," + txtmobile.Text.ToString() + "," + Session["order_id"].ToString() + ")";
            // cmd.CommandText = "select order_id tbl_order where user_email='" + Session["user_email"].ToString() + "' and order_date='" + dt.ToString("M/d/yyyy") + "' and order_time='" + dt.ToString("hh:mm:ss") + "'";
            int xz = cmd.ExecuteNonQuery();
            con.Close();
            con.Open();
             for (i = 0; i < rows; i++)
            {
                cmd.CommandText = "update  tbl_product set qty -= " + qty[i] + " where model_id='"+model_id[i]+"'";
            int x = cmd.ExecuteNonQuery();
            }
           con.Close();

           con.Open();

           cmd.CommandText = "delete from tbl_cart where user_email='"+Session["username"]+"'";
               int xx = cmd.ExecuteNonQuery();
          
           con.Close();
            Response.Redirect("bill_final.aspx");
        }
    }
}