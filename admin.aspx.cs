using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using ASPSnippets.SmsAPI;

public partial class Admin_admin : System.Web.UI.Page
{
    String constr = System.Configuration.ConfigurationManager.ConnectionStrings["dbmslink"].ConnectionString;
    SqlConnection con;
    SqlCommand cmd;
    DataSet ds;
    SqlDataAdapter adp;
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (email.Text != "" && password.Value != "")
        {
            con = new SqlConnection();
            con.ConnectionString = constr;
            con.Open();
            cmd = new SqlCommand();
            cmd.CommandText = "select count(*) from tbl_admin where admin_email='" + email.Text + "' and password='" + password.Value + "'";
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            int login = int.Parse(cmd.ExecuteScalar().ToString());
            con.Close();

            if (login == 1)
            {
                Session["admin_uname"] = email.Text;
                Session["admin_pass"] = password.Value;

                Response.Redirect("product_add.aspx");
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "key", "alert('Please enter correct Email or password')", true);
            }
        }
        else
        {
            if (email.Text == "" && password.Value=="")
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "key", "alert('Please enter  Email and password')", true);
            }
            else if (email.Text == "")
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "key", "alert('Please enter Email')", true);
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "key", "alert('Please enter password')", true);
            }

            
        }
    
    }
    protected void lbForgot_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        con = new SqlConnection();
        con.ConnectionString = constr;
        con.Open();
        cmd = new SqlCommand();
        cmd.CommandText = "select count(*) from tbl_admin where admin_email='" + txtId.Text + "'";
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        int login = int.Parse(cmd.ExecuteScalar().ToString());
        con.Close();

        if (login == 1)
        {
            Session["fg_email"] = txtId.Text;
            MultiView2.ActiveViewIndex = 1;
        }
        else
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "key", "alert('Email Address is not in Database')", true);
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        con = new SqlConnection();
        con.ConnectionString = constr;
        con.Open();
        cmd = new SqlCommand();
        cmd.CommandText = "select count(*) from tbl_admin where seq_ans='" + txtAns.Text + "'";
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        int login = int.Parse(cmd.ExecuteScalar().ToString());
        con.Close();

        if (login == 1)
        {
            //sanghvi no code

            try
            {
                SMS.APIType = SMSGateway.Site2SMS;

                SMS.MashapeKey = "cRkCBsAfEimshA4uhO4F7Yh74zsup1BhYpajsnWN2O8zDrgy5c";
                SMS.Username = "8000538030";
                SMS.Password = "don12345";
                String msg = "Dear Admin " + Session["smsfname"].ToString() +" " + Session["smslname"].ToString() + Environment.NewLine +" Email :-" + Session["smsemail"].ToString() + Environment.NewLine + " Password :-" + Session["smspwd"].ToString();
                SMS.SendSms(Session["smsno"].ToString(), msg);
            }
            catch (Exception ex)
            {
                Response.Redirect("home.aspx");
            }
        }
        else
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "key", "alert('Email Address is not in Database')", true);
        }
    }
 
    protected void View4_Activate(object sender, EventArgs e)
    {
        con = new SqlConnection();
        cmd = new SqlCommand();
        ds = new DataSet();
        adp = new SqlDataAdapter();

        con.ConnectionString = constr;
        con.Open();
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        cmd.CommandText = "SELECT tbl_admin.*, tbl_security.sname FROM tbl_admin INNER JOIN tbl_security ON tbl_admin.seq_que = tbl_security.sid WHERE admin_email='" + Session["fg_email"] + "'";
        adp.SelectCommand = cmd;
        adp.Fill(ds);

        txtQue.Text = ds.Tables[0].Rows[0][7].ToString();
        Session["smsfname"] = ds.Tables[0].Rows[0][1].ToString();
        Session["smslname"] = ds.Tables[0].Rows[0][2].ToString();
        Session["smsemail"] = ds.Tables[0].Rows[0][0].ToString();
        Session["smspwd"] = ds.Tables[0].Rows[0][3].ToString();
        Session["smsno"] = ds.Tables[0].Rows[0][6].ToString();
        con.Close();
    }
}