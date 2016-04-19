using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            rvusername.ErrorMessage = "Username Cannot Be Blank..";
            if (rbmale.Checked)
            {
                Session["gender"] = "Male";
            }
            else
            {
                Session["gender"] = "Female";
            }

            long zip = long.Parse(txtzip.Text);
            long num = long.Parse(txtmobile.Text);
            SqlConnection con;
            SqlCommand cmd = new SqlCommand();
            String str = System.Configuration.ConfigurationManager.ConnectionStrings["dbmslink"].ConnectionString;
           
            con = new SqlConnection(str);
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "insert into tbl_user values('" + txtusername.Text + "','" + txtpassword.Text + "','" + txtfname.Text + "','" + txtlname.Text + "','" + Session["gender"].ToString() + "','" + txtadd.Text + "','"+txtstate.Text+"',"+DropDownList1.SelectedValue.ToString() +"," + zip + "," + num + "," + ddsecurityque.SelectedValue + ",'" + txtsecurityans.Text + "')";
            cmd.CommandType = CommandType.Text;
          

            int x = cmd.ExecuteNonQuery();

            if (x == 1)
            {
                // ClientScript.RegisterClientScriptBlock(this.GetType(), "key", "alert('Registered Succesfully..')", true);
                Session["username"] = txtusername.Text;
                Session["lblitem"] = "0";
                Session["lblprice"] = "0";
                Session["lbllogin"] = txtfname.Text;
                Response.Redirect("product.aspx");
            }
            else {
                rvusername.ErrorMessage = "Username Is Already Taken..";
                rvusername.Enabled = true;
            }
           
        }
        catch (Exception ex)
        {
            rvusername.ErrorMessage = "Username Is Already Taken..";
            rvusername.Enabled = true;
        }
    }
}