using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["username"].ToString().Length > 0)
            {
                Session["lbllogin"] = "Login";
                Session["username"] = "";
                Session["password"] = "";
                Session["lblprice"] = "0";
                Session["lblitem"] = "0";
            }
        }
        catch { }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
 
    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        //try
        //{
        if (IsPostBack)
        {
            SqlConnection con;
            SqlCommand cmd = new SqlCommand();
            String str = System.Configuration.ConfigurationManager.ConnectionStrings["dbmslink"].ConnectionString;
            SqlDataReader dr;
            CustomValidator1.ControlToValidate = "txtusername";
            Session["password"] = args.Value.ToString();
            CustomValidator1.ControlToValidate = "txtpassword";
            Session["username"] = args.Value.ToString();


            con = new SqlConnection(str);
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "select user_email,password,fname,mobileno from tbl_user where user_email='" + txtusername.Text + "' and password='" + txtpassword.Text + "'";
            cmd.CommandType = CommandType.Text;

            dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                dr.Read();


                if (Session["chk"].ToString() == "0")
                {
                    Session["password"] = dr[1].ToString();

                    Session["username"] = dr[0].ToString();
                    Session["lbllogin"] = dr[2].ToString();
                    Session["smsnumber"] = dr[3].ToString();
                    Session["login"] = 1;
                    con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dbmslink"].ConnectionString);
                    con.Open();
                    cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.CommandText = "Select tbl_cart.qty,tbl_product.pprice from tbl_product,tbl_cart where tbl_product.model_id=tbl_cart.model_id and user_email='" + Session["username"].ToString() + "'";
                    dr = cmd.ExecuteReader();
                    displaycart();
                    Response.Redirect("product.aspx");

                }
                else if (Session["chk"].ToString() == "2")
                {

                    Session["password"] = dr[1].ToString();

                    Session["username"] = dr[0].ToString();
                    Session["lbllogin"] = dr[2].ToString();
                    Session["chk"] = "0";
                    displaycart();

                    Response.Redirect("booking.aspx");

                }
                else
                {
                    Session["password"] = dr[1].ToString();

                    Session["username"] = dr[0].ToString();
                    Session["lbllogin"] = dr[2].ToString();
                    Session["login"] = 1;
                    //String str1 = System.Configuration.ConfigurationManager.ConnectionStrings["dbmslink"].ConnectionString;
                    //SqlConnection con = new SqlConnection(str1);
                    con.Close();
                    con.Open();
                    // SqlCommand cmd = new SqlCommand();
                    // SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.CommandText = "select user_email,password from tbl_user where user_email='" + Session["username"] + "' and password='" + Session["password"] + "'";
                    cmd.CommandType = CommandType.Text;
                    dr = cmd.ExecuteReader();
                    dr.Read();
                    if (dr[0].ToString() == Session["username"].ToString())
                    {
                        //long tot = long.Parse(Session["lblprice"].ToString());
                        con.Close();
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandText = "insert into tbl_cart values('" + Session["username"].ToString() + "','" + Session["modelno"].ToString() + "',1," + Session["price"].ToString() + ")";
                        int z = 0;
                        try
                        {
                            z = cmd.ExecuteNonQuery();
                        }
                        catch
                        {
                            cmd.CommandText = "update tbl_cart set qty +=1,sub_total+=" + Session["product_price"].ToString() + " where user_email='" + Session["username"].ToString() + "' and model_id='" + Session["modelno"].ToString() + "'";
                            z = cmd.ExecuteNonQuery();
                        }
                        displaycart();
                        if (z == 1)
                        {
                            displaycart();
                            Session["chk"] = "0";
                            Response.Redirect("checkout.aspx");
                        }
                        else
                        {
                            displaycart();
                            Response.Redirect("home.aspx");
                        }
                    }
                    // Response.Redirect("checkout.aspx");
                }
                 con.Close();
                           
            }
            else
            {
                args.IsValid = false;
            }
            con.Close();
        }
        //}
        //catch
        //{
        //    TextBox1.Text = "You Didn't enter any Value";
        //}
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Register.aspx");
    }
 public   void displaycart()
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dbmslink"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand();
           cmd.Connection = con;
        cmd.CommandText = "Select tbl_cart.qty,tbl_product.pprice from tbl_product,tbl_cart where tbl_product.model_id=tbl_cart.model_id and user_email='" + Session["username"].ToString() + "'";
       SqlDataReader dr = cmd.ExecuteReader();
        decimal qty = 0;
        decimal price = 0;
        decimal total = 0;
        int countitem = 0;
        try
        {

           
            while (dr.HasRows)
            {
                dr.Read();
                qty = decimal.Parse(dr[0].ToString());
                countitem += int.Parse(qty.ToString());
                price = decimal.Parse(dr[1].ToString());
                total += qty * price;
               
            }

        }
        catch { }
        Session["lblitem"] = countitem.ToString();
        Session["lblprice"] = total.ToString();
             
    }
}