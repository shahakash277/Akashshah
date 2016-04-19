using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class checkout : System.Web.UI.Page
{
    String constr = System.Configuration.ConfigurationManager.ConnectionStrings["dbmslink"].ConnectionString;
    SqlConnection con;
    SqlCommand cmd;
    DataSet ds;
    SqlDataAdapter adp;


    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack == false)
        {
            btnProceed.Visible = false;
            Getdata();
        }
    }

    public void Getdata()
    {
        con = new SqlConnection();
        cmd = new SqlCommand();
        ds = new DataSet();
        adp = new SqlDataAdapter();

        SqlCommand cmd_t = new SqlCommand();
        DataSet ds_t = new DataSet();
        SqlDataAdapter adp_t = new SqlDataAdapter();

        con.ConnectionString = constr;
        con.Open();
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        cmd.CommandText = "SELECT tbl_cart.user_email, tbl_cart.model_id, tbl_cart.qty, tbl_cart.sub_total, tbl_product.pname, tbl_product.pprice, tbl_product.qty AS pro_qty,tbl_product.img1 FROM tbl_cart INNER JOIN tbl_product ON tbl_cart.model_id = tbl_product.model_id WHERE tbl_cart.user_email='" + Session["username"] + "'";

        adp.SelectCommand = cmd;
        adp.Fill(ds);
        if (ds.Tables[0].Rows.Count <= 0)
        {
           
            lblGt.Text = "Cart is Empty";

        }
        else
        {
            btnProceed.Visible = true;
            GridView1.DataSource = ds.Tables[0];

            GridView1.DataBind();

            cmd_t.CommandText = "SELECT SUM(sub_total) AS Total FROM tbl_cart WHERE tbl_cart.user_email='" + Session["username"] + "'";
            cmd_t.CommandType = CommandType.Text;
            cmd_t.Connection = con;
            adp_t.SelectCommand = cmd_t;
            adp_t.Fill(ds_t);
            Session["total"] = ds_t.Tables[0].Rows[0][0].ToString();
            lblGt.Text = "Grand Total = " + ds_t.Tables[0].Rows[0][0].ToString();
            con.Close();
        }
    }

    public void get_total()
    {
        int sum = 0;
        foreach (GridViewRow grv in GridView1.Rows)
        {
           Label lbl = (Label)grv.FindControl("lblSubtotal");
            sum += int.Parse(lbl.Text);
        }

        lblGt.Text = "Grand Total = "+sum.ToString();
        Session["total"] = sum.ToString() ;
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        con = new SqlConnection();
        con.ConnectionString = constr;
        con.Open();
        cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        if (e.CommandName == "Delete")
        {

            cmd.CommandText = "delete from tbl_cart where user_email='" + Session["username"] + "' AND model_id='" + e.CommandArgument + "'";
            cmd.ExecuteNonQuery();

            displaycart();
        }
        if (e.CommandName == "save")
        {
            
            //int id = Convert.ToInt16(e.CommandArgument.ToString());
            //GridViewRow gvr = GridView1.Rows[id];
            foreach (GridViewRow gvb in GridView1.Rows)
            {
                Label lbl_model_id =(Label)gvb.FindControl("lblProId");
                if(lbl_model_id.Text.ToString().Equals(e.CommandArgument.ToString()))
                {
                    TextBox txt_qty = (TextBox)gvb.FindControl("txtQty");
                    cmd.CommandText = "select qty from tbl_product where model_id='" + e.CommandArgument.ToString() + "'";
                     SqlDataReader dr = cmd.ExecuteReader();
                    dr.Read();
                   // int qa = int.Parse(dr[0].ToString().Trim());
                   
                   // ClientScript.RegisterClientScriptBlock(this.GetType(), "key", "alert('"+dr[0].ToString().Trim()+"')", true);
                       
                    if (decimal.Parse(txt_qty.Text.ToString().Trim()) > int.Parse(dr[0].ToString().Trim()))
                    {
                        
                        //   ClientScript.RegisterClientScriptBlock(this.GetType(), "key", "alert('')", true);
                        lbl_model_id = (Label)gvb.FindControl("lblerror");
                        lbl_model_id.Text = "only " + dr[0].ToString() + " quantity left";
                        return;
                    }
                    else
                    {
                        lbl_model_id = (Label)gvb.FindControl("lblerror");
                        lbl_model_id.Text = "";
                        con.Close();
                        con.Open();
                        lbl_model_id = (Label)gvb.FindControl("lblprice");

                        cmd.CommandText = "update tbl_Cart set qty=" + txt_qty.Text.ToString() + ",sub_total=" + (int.Parse(txt_qty.Text.ToString()) * int.Parse(lbl_model_id.Text.ToString())) + " where user_email='" + Session["username"].ToString() + "' And model_id='" + e.CommandArgument.ToString() + "'";
                        int x = cmd.ExecuteNonQuery();
                        if (x >= 1)
                        {
                            con.Close();
                            displaycart();
                        }
                    }
                }
              //  TextBox lbl_qty = (TextBox)gvb.FindControl("txtqty");
            }
            //   GridViewRow item = (GridViewRow)(((Control)sender).NamingContainer);
          //  Label lbl_qty = (Label)item.FindControl("txtqty");

            //if (int.Parse(lbl_qty.Text.ToString()) > 2)
            //{
            //    //   lblerror.Text = "qty must be in   " + dr[0].ToString();
                return;
        //    }
        }
        
    }

    public void displaycart()
    {
        con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dbmslink"].ConnectionString);
        con.Open();
        cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "Select tbl_cart.qty,tbl_product.pprice from tbl_product,tbl_cart where tbl_product.model_id=tbl_cart.model_id and user_email='" + Session["username"].ToString() + "'";
       SqlDataReader dr = cmd.ExecuteReader();
        int qty = 0;
        int price = 0;
        int total = 0;
        int countitem = 0;
        try
        {


            while (dr.HasRows)
            {
                dr.Read();
                qty = int.Parse(dr[0].ToString());
                countitem += int.Parse(qty.ToString());
                price = int.Parse(dr[1].ToString());
                total += qty * price;

            }

        }
        catch { }
        Session["lblitem"] = countitem.ToString();
        Session["lblprice"] = total.ToString();
        Response.Redirect("checkout.aspx");
                        
    }
    protected void btnSave_Click(object sender, GridViewCommandEventArgs e)
    {

        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dbmslink"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;   
       
        //if (e.CommandName == "save")
        //{
        //    cmd.CommandText = "select qty from tbl_product where model_id='" + e.CommandArgument + "'";
        //    SqlDataReader dr = cmd.ExecuteReader();
        //    dr.Read();
        //    if (int.Parse(txtQty.Text.ToString()) > int.Parse(dr[0].ToString()))
        //    {
        //        lblerror.Text = "qty must be in " + dr[0].ToString();
        //    }
        //}
        GridViewRow item = (GridViewRow)(((Control)sender).NamingContainer);
        Label lbl_price = (Label)item.FindControl("lblPrice");
        Label lbl_total = (Label)item.FindControl("lblSubtotal");
        TextBox qty = (TextBox)item.FindControl("txtQty");
        lbl_total.Text = (int.Parse(qty.Text) * float.Parse(lbl_price.Text.ToString())).ToString();

        
        get_total();
    }

    protected void brnProceed_Click(object sender, EventArgs e)
    {
       // Session["total"] = lblGt.Text;
        Response.Redirect("shipping.aspx");

    }
    protected void txtQty_TextChanged(object sender, EventArgs e)
    {
       
       // String s = e.CommandArgument.ToString();
    //    Session["tempqty"] = txtQty.Text.ToString();
      //  Response.Redirect("checkout.aspx");
    }
}
