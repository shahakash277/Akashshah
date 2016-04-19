using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class forget_password : System.Web.UI.Page
{
    public static int flag = 0;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (flag==0)
        {
            txtsecurity.Visible = false;

            Label2.Visible = false;

            rvsecurity.Enabled = false;
            rvsecurity.ControlToValidate = "txtsecurity";

            txtconfirm.Visible = false;

            txtpassword.Visible = false;

            cvvalid.ControlToValidate = "txtusername";
            cvvalid.ErrorMessage = "Invalid Username..";
            rvusername.ControlToValidate = "txtusername";
            rvusername.ErrorMessage = "Username Cannot Be Blank..";

        }

        else if (flag == 1)
        {
            txtconfirm.Visible = false;
            txtpassword.Visible = false;
            txtusername.Visible = false;
            txtsecurity.Visible = true;

            Label1.Visible = false;
            Label2.Visible = true;
            lblquestion.Visible = true;

            cvvalid.ControlToValidate = "txtsecurity";
            cvvalid.ErrorMessage = "Invalid Answer..";

            rvsecurity.ControlToValidate = "txtsecurity";
            rvsecurity.Enabled = true;
            rvsecurity.ErrorMessage = "Answer NOt written";

            Label2.Visible = true;
            txtsecurity.Visible = true;
            
        }

        else if (flag == 2)
        {
            txtusername.Visible = false;
            txtsecurity.Visible = false;

            txtconfirm.Visible = true;
            txtpassword.Visible = true;

            Label1.Visible = true;
            Label2.Visible = true;

            rvsecurity.Enabled = true;
            rvsecurity.ControlToValidate = "txtconfirm";
            rvsecurity.ErrorMessage = "Field Cannot Be Empty";

            rvusername.Enabled = false;
            rvusername.ControlToValidate = "txtpassword";
            rvusername.ErrorMessage = "Field Cannot Be Empty";

            cvvalid.Enabled = true;
            cvvalid.ControlToValidate = "txtpassword";
            cvvalid.ErrorMessage = "Password Must Be Same";
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
     
    }

    protected void cvvalid_ServerValidate(object source, ServerValidateEventArgs args)
    {
        SqlConnection con;
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr;

        //checking if username is not black...


        
            if (flag == 0)
            {
                
                String str = System.Configuration.ConfigurationManager.ConnectionStrings["dbmslink"].ConnectionString;
                con = new SqlConnection(str);
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = "select user_email, sname from tbl_user,tbl_security where tbl_user.secure_que=tbl_security.sid and user_email='" + txtusername.Text.ToString() + "'";
                //cmd.CommandText = "select username,sname from tbl_login,tbl_security where username='" + Session["username"].ToString() + "'";

                cmd.CommandType = CommandType.Text;


                dr = cmd.ExecuteReader();
                dr.Read();
                if (dr.HasRows)
                {
                    txtsecurity.Visible = true;
                    txtusername.Visible = false;
                    Label1.Visible = false;
                    Label2.Visible = true;

                    rvusername.Enabled = false;

                    Button1.Text = "Change Password";
                    lblquestion.Text = dr[1].ToString();
                    flag = 1;
                    Session["username"] = txtusername.Text;
                    //txtusername.Text = "";
                }
                else
                {
                    //ClientScript.RegisterClientScriptBlock(this.GetType(), "key", "alert('Invalid Username')", true);
                    args.IsValid = false;
                }
                con.Close();
            }
            else if (flag == 1)
            {
                

                String str = System.Configuration.ConfigurationManager.ConnectionStrings["dbmslink"].ConnectionString;
                con = new SqlConnection(str);
                con.Open();
                cmd.Connection = con;
                Session["username"] = "akash226";
                cmd.CommandText = "select secure_ans from tbl_user where user_email='" + Session["username"].ToString() + "'";
                cmd.CommandType = CommandType.Text;

                dr = cmd.ExecuteReader();
                dr.Read();
                if (txtsecurity.Text == dr[0].ToString())
                {
                    rvsecurity.Enabled = false;
                    txtsecurity.Visible = false;
                    txtsecurity.Text = "";
                    txtusername.Visible = false;
                    txtusername.Text = "";
                    txtconfirm.Visible = true;
                    txtpassword.Visible = true;
                    Label1.Visible = true;
                    Label1.Text = "New Password";
                    Label2.Visible = true;
                    Label2.Text = "Confirm Password";
                    lblquestion.Visible = false;
                    Button1.Text = "Change It";
                    flag = 2;
                }
                else
                {
                    //ClientScript.RegisterClientScriptBlock(this.GetType(), "key", "alert('Wrong Answer')", true);
                    args.IsValid = false;
                }
                con.Close();
            }
            else if (flag == 2)
            {
                if (txtpassword.Text==txtconfirm.Text)
                {
                    String str = System.Configuration.ConfigurationManager.ConnectionStrings["dbmslink"].ConnectionString;
                    con = new SqlConnection(str);
                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandText = "update tbl_user set password='" + txtpassword.Text + "' where user_email='" + Session["username"].ToString() + "'";
                    cmd.CommandType = CommandType.Text;
                    int x = cmd.ExecuteNonQuery();
                    if (x == 0)
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "key", "alert('Not changed')", true);
                    }
                    else
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "key", "alert('Changed')", true);
                        Response.Redirect("Login.aspx");
                    }
                }
                else
                {
                    //txtusername.Text = "";
                    //txtsecurity.Text = "";
                    args.IsValid = false;
                }
            }
        
    }
}