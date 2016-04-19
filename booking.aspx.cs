using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing.Imaging;
using System.Drawing;
using ASPSnippets.SmsAPI;

public partial class booking : System.Web.UI.Page
{
    public static int chk = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {

            btnsms.Visible = false;
            txtnumber.Visible = false;
            lblsms.Visible = false;
           // try
          //  {
                if (Session["username"].ToString().Length <= 0)
                {
                    Session["chk"] = "2";
                    Response.Redirect("login.aspx");
                }
                
      //      }
       //     catch {
        //        Session["chk"] = "2";
         //       Response.Redirect("login.aspx");
          //  }
            DateTime dt = DateTime.Now;
            ddldate.Items.Add(new ListItem() { Text = dt.ToString("d/M/yyyy"), Value = dt.ToString("M/d/yyyy") });
       
          //  ddldate.Items.Add(dt.ToString("d/M/yyyy"));
           // ddldate.DataTextField = dt.ToString("d/M/yyyy");
            // DropDownList1.DataTextField = dt.ToString("ddd, d - MMM");
           // ddldate.DataValueField = dt.ToString("M/d/yyyy");
            //Label1.Text = ddldate.SelectedValue.ToString();
            // Label1.Text = ddldate.SelectedValue.ToString();
            for (int i = 1; i < 14; i++)
            {
                dt = dt.AddDays(1);
                ddldate.Items.Add(new ListItem() { Text = dt.ToString("d/M/yyyy"), Value = dt.ToString("M/d/yyyy") });
   
             //   ddldate.Items.Add(dt.ToString("d/M/yyyy"));
              //  ddldate.DataTextField = dt.ToString("d/M/yyyy");
               // ddldate.DataValueField = dt.ToString("M/d/yyyy");
                //    DropDownList1.DataTextField = dt.ToString("ddd, d - MMM");
                //   DropDownList1.DataValueField = dt.ToString("d/M/yyyy");
            }

            additem();
            String str = System.Configuration.ConfigurationManager.ConnectionStrings["dbmslink"].ConnectionString;
            SqlConnection con = new SqlConnection(str);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            cmd.Connection = con;
            cmd.CommandText = "select btime from tbl_booking where bdate='" + ddldate.SelectedValue.ToString() + "'";
            cmd.CommandType = CommandType.Text;
            dr = cmd.ExecuteReader();
            try
            {
                dr.Read();
                if (DropDownList1.Items.FindByValue(dr[0].ToString()) != null)
                {
                    DropDownList1.SelectedValue = dr[0].ToString();
                    int x = DropDownList1.SelectedIndex;
                    DropDownList1.Items.RemoveAt(x);
                   // Label2.Text = x.ToString();
                }
                while (dr.HasRows)
                {

                    dr.Read();
                    if (DropDownList1.Items.FindByValue(dr[0].ToString()) != null)
                    {
                        DropDownList1.SelectedValue = dr[0].ToString();
                        int x = DropDownList1.SelectedIndex;
                        DropDownList1.Items.RemoveAt(x);
                        //Label2.Text = x.ToString();
                    }
                }
            }
            catch
            {
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        
        if(chk==0)
        {
            Button1.Visible = true;
            Button1.Text = "Book";
            
       String str = System.Configuration.ConfigurationManager.ConnectionStrings["dbmslink"].ConnectionString;
       SqlConnection con = new SqlConnection(str);
        con.Open();
       SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select count(*) from tbl_booking";
        cmd.CommandType = CommandType.Text;
        Object ob=cmd.ExecuteScalar();
        int bid = ((int)ob)+1;
        con.Close();
        con.Open();
        

        var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        var random = new Random();
        var result = new string(
            Enumerable.Repeat(chars, 8)
                      .Select(s => s[random.Next(s.Length)])
                      .ToArray());

        cmd.CommandText = "insert into tbl_booking (user_email,bdate,btime,brecepit) values('" + Session["username"].ToString() + "','" + ddldate.SelectedValue.ToString() + "','"+DropDownList1.SelectedValue.ToString()+"','" + result.ToString() + "')";
        cmd.CommandType = CommandType.Text;
       int x= cmd.ExecuteNonQuery();

       if (x == 1)
       {
           lblreceipt.Text = "Your Booking Is Sucessfully Done <br/>  Receipt No :  " + result.ToString()+"<br/>*click on save to save you receipt no*";
           Button1.Text = "Save Image";
           Session["rnumber"]= result.ToString();
           Session["time"] = ddldate.SelectedItem.ToString();
           Session["date"] = DropDownList1.SelectedValue.ToString();
           
           chk++;
           lblsms.Visible = true;
           btnsms.Visible = true;
           txtnumber.Visible = true;
           con.Close();
           con.Open();
           
           cmd.CommandText = "select mobileno from tbl_user where user_email='"+Session["username"].ToString()+"'";
           cmd.CommandType = CommandType.Text;
           SqlDataReader  dr=cmd.ExecuteReader();
      dr.Read();

      txtnumber.Text = dr[0].ToString();
      con.Close();


       }
    }
    else if(chk==1)
    {
           Bitmap bitMapImage = new
           System.Drawing.Bitmap((Server.MapPath("~")+"/images/receipt.png"));
           Graphics graphicImage = Graphics.FromImage(bitMapImage);
           graphicImage.DrawString("Name :" + Session["username"].ToString() + "\n" + "Date :" + Session["date"] + "\n" + "Time :" + Session["time"]+"\n"+"Receipt No :"+Session["rnumber"],
           new Font("Arial", 14, FontStyle.Bold),
           SystemBrushes.WindowText, new Point(157, 131));
          bitMapImage.Save("C:\\Users\\Akash\\Downloads\\image\\booking.png", ImageFormat.Jpeg);

           lblreceipt.Text = "Your Image Saved Sucessfully";

           graphicImage.Dispose();
           bitMapImage.Dispose();
           Button1.Visible = false;
           chk = 0;
    }
       //result.ToString();
       
       
    }
    
    public void additem()
    {
        DropDownList1.Items.Clear();
        DropDownList1.Items.Add(new ListItem() { Text = "10:00 AM", Value = "10:00:00" });
        DropDownList1.Items.Add(new ListItem() { Text = "10:30 AM", Value = "10:30:00" });
        DropDownList1.Items.Add(new ListItem() { Text = "11:00 AM", Value = "11:00:00" });
        DropDownList1.Items.Add(new ListItem() { Text = "11:30 AM", Value = "11:30:00" });
        DropDownList1.Items.Add(new ListItem() { Text = "12:00 PM", Value = "12:00:00" });
        DropDownList1.Items.Add(new ListItem() { Text = "12:30 PM", Value = "12:30:00" });
        DropDownList1.Items.Add(new ListItem() { Text = "01:00 PM", Value = "01:00:00" });
        DropDownList1.Items.Add(new ListItem() { Text = "01:30 PM", Value = "01:30:00" });
        DropDownList1.Items.Add(new ListItem() { Text = "02:00 PM", Value = "02:00:00" });
        DropDownList1.Items.Add(new ListItem() { Text = "02:30 PM", Value = "02:30:00" });
        DropDownList1.Items.Add(new ListItem() { Text = "03:00 PM", Value = "03:00:00" });
        DropDownList1.Items.Add(new ListItem() { Text = "03:30 PM", Value = "03:30:00" });
        DropDownList1.Items.Add(new ListItem() { Text = "04:00 PM", Value = "04:00:00" });
        DropDownList1.Items.Add(new ListItem() { Text = "04:30 PM", Value = "04:30:00" });
        DropDownList1.Items.Add(new ListItem() { Text = "05:00 AM", Value = "05:00:00" });
    }

    protected void ddldate_SelectedIndexChanged(object sender, EventArgs e)
    {
        additem();
        String str = System.Configuration.ConfigurationManager.ConnectionStrings["dbmslink"].ConnectionString;
        SqlConnection con = new SqlConnection(str);
        con.Open();
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr;
        cmd.Connection = con;
        cmd.CommandText = "select btime from tbl_booking where bdate='"+ddldate.SelectedValue.ToString()+"'";
        cmd.CommandType = CommandType.Text;
        dr=cmd.ExecuteReader();
        try
        {
            dr.Read();
            if (DropDownList1.Items.FindByValue(dr[0].ToString()) != null)
            {
                DropDownList1.SelectedValue = dr[0].ToString();
                int x = DropDownList1.SelectedIndex;
                DropDownList1.Items.RemoveAt(x);
                //Label2.Text = x.ToString();
            }
            while (dr.HasRows)
            {

                dr.Read();
                if (DropDownList1.Items.FindByValue(dr[0].ToString()) != null)
                {
                    DropDownList1.SelectedValue = dr[0].ToString();
                    int x = DropDownList1.SelectedIndex;
                    DropDownList1.Items.RemoveAt(x);
                    //Label2.Text = x.ToString();
                }
            }
        }
        catch { 
        }
    }
    protected void btnsms_Click(object sender, EventArgs e)
    {
        try
        {
            SMS.APIType = SMSGateway.Site2SMS;

            SMS.MashapeKey = "cRkCBsAfEimshA4uhO4F7Yh74zsup1BhYpajsnWN2O8zDrgy5c";
            SMS.Username = "8000538030";
            SMS.Password = "don12345";
            String msg = "Hello! " + Session["username"].ToString() + Environment.NewLine + " Palak Optics Your Booking Is Done Sucessfully " + Environment.NewLine + " Booking Date :-" + Session["date"].ToString() + Environment.NewLine +" Booking Time :-" + Session["time"].ToString() + Environment.NewLine+" Receipt No :-  " + Session["rnumber"].ToString();
            SMS.SendSms(txtnumber.Text.Trim(), msg);
        }
        catch (Exception ex) 
        { 
            Response.Redirect("home.aspx");
        }
        
        
        // if (txtRecepientNumber.Text.Trim().IndexOf(",") == -1)
        //{
            //Single SMS
            
        //}
        //else
        //{
            //Multiple SMS
           // List<string> numbers = txtRecepientNumber.Text.Trim().Split(',').ToList();
          //  SMS.SendSms(numbers, txtMessage.Text.Trim());
        //}
    }
}