using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;    
using System.Data;
using System.Data.SqlClient;
public partial class product : System.Web.UI.Page
{
   static String s_brand = "",f_query="",s_frame_shape="",priceto="",pricefrom="",s_size="",s_type="";
     static int selpage = 0;
    static decimal page;
    SqlConnection con=new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dbmslink"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            SqlConnection con;
            SqlCommand cmd;
            String id = "null", str,gender;
            displayGridviewFilter();
            Brand_fill();
            Shape_fill();
            Type_fill();  
            try
            {
                String refe = Request.QueryString.Get("ref");
                id = Request.QueryString.Get("id");
                
                str = System.Configuration.ConfigurationManager.ConnectionStrings["dbmslink"].ConnectionString;
                con = new SqlConnection(str);
                cmd = new SqlCommand();

                con.Open();
                cmd.Connection = con;
                cmd.CommandType = CommandType.Text;
                SqlDataReader dr;
                try {
                  
                    gender = Request.QueryString.Get("gender");
                    cmd.CommandText = "select * from tbl_product where " + refe + "=" + id + " and gender='" + gender + "'";
                    dr = cmd.ExecuteReader();
                    if (!dr.HasRows)
                    {
                        con.Close();
                        con.Open();
                        cmd.CommandText = "select * from tbl_product where " + refe + "=" + id;
                        dr = cmd.ExecuteReader();
                    }
                }
                catch {
                    cmd.CommandText = "select * from tbl_product where " + refe + "=" + id ;
                     dr = cmd.ExecuteReader();
                }

                  DataTable dt = new DataTable();
                dt.Load(dr);
                DataList1.DataSource = dt;
                DataList1.DataBind();
            }
            catch {
                str = System.Configuration.ConfigurationManager.ConnectionStrings["dbmslink"].ConnectionString;
                con = new SqlConnection(str);
                cmd = new SqlCommand();

                con.Open();
                cmd.Connection = con;
                cmd.CommandType = CommandType.Text;

                cmd.CommandText = "select * from tbl_product";
                SqlDataReader dr = cmd.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(dr);
                DataList1.DataSource = dt;
                DataList1.DataBind();

            }
            try
            {
                str = Request.QueryString.Get("query1");
                if (str.ToLower() == "booking")
                {
                    Response.Redirect("booking.aspx");
                }
                else
                {
                    string str1 = System.Configuration.ConfigurationManager.ConnectionStrings["dbmslink"].ConnectionString;
                    con = new SqlConnection(str1);
                    cmd = new SqlCommand();

                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.Text;

                    cmd.CommandText = "SELECT tbl_brand.brand_name, tbl_category.category_name, tbl_lens_technology.lens_tech_name, tbl_frame_type.frame_type_name, tbl_material.material_name, tbl_product.*, tbl_shape.shape_name FROM tbl_brand INNER JOIN tbl_product ON tbl_brand.brand_id = tbl_product.brand_id AND tbl_brand.brand_id = tbl_product.brand_id INNER JOIN tbl_category ON tbl_product.category_id = tbl_category.category_id INNER JOIN tbl_frame_type ON tbl_product.frame_type_id = tbl_frame_type.frame_type_id INNER JOIN tbl_lens_technology ON tbl_product.lense_technology_id = tbl_lens_technology.lens_tech_id INNER JOIN tbl_material ON tbl_product.material_id = tbl_material.material_id INNER JOIN tbl_shape ON tbl_product.shape_id = tbl_shape.shape_id where tbl_material.material_name like '%" + str.Trim() + "%' OR tbl_shape.shape_name like '%" + str.Trim() + "%' OR tbl_product.pname like '%" + str.Trim() + "%' OR tbl_category.category_name like '%" + str.Trim() + "%' OR tbl_frame_type.frame_type_name like '%" + str.Trim() + "%'";
                   SqlDataReader dr = cmd.ExecuteReader();
                   DataTable dt = new DataTable();
                    dt.Load(dr);
                    DataList1.DataSource = dt;
                    DataList1.DataBind();
                }
            }
            catch { }
           
        }
    }
    protected void ddlshow_SelectedIndexChanged(object sender, EventArgs e)
    {
        displayGridviewFilter();
    }
    public void displayGridviewFilter()
    {
        String str = System.Configuration.ConfigurationManager.ConnectionStrings["dbmslink"].ConnectionString;
        SqlConnection con = new SqlConnection(str);
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select * from tbl_product";
        cmd.CommandType = CommandType.Text;
        SqlDataReader dr = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        //  PagedDataSource objPage = new PagedDataSource();
        DataList1.DataSource = dt;
        DataList1.DataBind();
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        
        String s = e.CommandName.ToString();
        if (s.Equals("addtocart"))
        {
           // Response.Redirect("login.aspx");
            Response.Redirect("singletryonline.aspx?query=" + e.CommandArgument.ToString());
      
        }
        else if (s == "add to cart")
        {
            //Session["product_price"] = lblproduct_price.Text;

            //String str = System.Configuration.ConfigurationManager.ConnectionStrings["dbmslink"].ConnectionString;
            //SqlConnection con = new SqlConnection(str);
            //con.Open();
            //SqlCommand cmd = new SqlCommand();
            //cmd.Connection = con;
            //cmd.CommandText = "SELECT tbl_brand.brand_name, tbl_category.category_name, tbl_color.color_name, tbl_frame_type.frame_type_name, tbl_lens_technology.lens_tech_name, tbl_shape.shape_name, tbl_material.material_name,tbl_product.* FROM tbl_brand INNER JOIN tbl_product ON tbl_brand.brand_id = tbl_product.brand_id OR tbl_brand.brand_id = tbl_product.brand_id INNER JOIN tbl_category ON tbl_product.category_id = tbl_category.category_id INNER JOIN tbl_color ON tbl_product.frame_color_id = tbl_color.color_id OR tbl_product.glass_color_id = tbl_color.color_id INNER JOIN tbl_frame_type ON tbl_product.frame_type_id = tbl_frame_type.frame_type_id INNER JOIN tbl_lens_technology ON tbl_product.lense_technology_id = tbl_lens_technology.lens_tech_id INNER JOIN tbl_material ON tbl_product.material_id = tbl_material.material_id INNER JOIN tbl_shape ON tbl_product.shape_id = tbl_shape.shape_id where tbl_product.model_id='" + Request.QueryString.Get("query") + "'";
            //cmd.CommandType = CommandType.Text;
            //SqlDataReader dr = cmd.ExecuteReader();
            //DataTable dt = new DataTable();
            //dt.Load(dr);
            //DataSet ds = new DataSet();
            //ds.Tables.Add(dt);
            //Session["quantity"] = ds.Tables[0].Rows[0][10].ToString();
            //Session["modelno"] = ds.Tables[0].Rows[0][7].ToString();
            //Session["price"] = lblprice.Text;
            //con.Close();
            //if (Session["quantity"].ToString() == "0")
            //{
            //    lblchckqty.Text = "Out Of Stock";
            //}
            //else
            //{
            //    try
            //    {
            //        con.Close();
            //        con.Open();
            //        //    SqlCommand cmd = new SqlCommand();
            //        cmd.Connection = con;
            //        cmd.CommandText = "select user_email,password from tbl_user where user_email='" + Session["username"] + "' and password='" + Session["password"] + "'";
            //        cmd.CommandType = CommandType.Text;
            //        dr = cmd.ExecuteReader();
            //        dr.Read();

            //        if (dr[0].ToString() == Session["username"].ToString())
            //        {

            //            con.Close();
            //            con.Open();
            //            cmd.Connection = con;
            //            cmd.CommandText = "insert into tbl_cart values('" + Session["username"].ToString() + "','" + Session["modelno"].ToString() + "',1," + Session["product_price"].ToString() + ")";
            //            int z = 0;
            //            try
            //            {
            //                z = cmd.ExecuteNonQuery();
            //            }
            //            catch
            //            {
            //                cmd.CommandText = "update tbl_cart set qty +=1,sub_total+=" + Session["product_price"].ToString() + " where user_email='" + Session["username"].ToString() + "' and model_id='" + Session["modelno"].ToString() + "'";
            //                z = cmd.ExecuteNonQuery();
            //            }
            //            if (z == 1)
            //            {
            //                //  here code for lbl in master page it is not complite
            //                int x = int.Parse(Session["lblitem"].ToString());
            //                x += 1;
            //                Session["lblitem"] = int.Parse(x.ToString());
            //                Session["lblprice"] = (int.Parse(Session["lblprice"].ToString()) + int.Parse(lblprice.Text.ToString()));
            //                Response.Redirect("product.aspx");
            //            }
            //            else
            //            {
            //                Response.Redirect("home.aspx");
            //            }
            //        }

            //    }
            //    catch
            //    {
            //        Session["chk"] = 1;
            //        Response.Redirect("login.aspx");
            //    }
            //}

            
            Response.Redirect("singletryonline.aspx?query="+e.CommandArgument.ToString());
        }

    }
   
    public void databind(int selectIndex)
    {
        try
        {
            String str = System.Configuration.ConfigurationManager.ConnectionStrings["dbmslink"].ConnectionString;
            SqlConnection con = new SqlConnection(str);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from tbl_product";
            cmd.CommandType = CommandType.Text;
            SqlDataReader dr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
          
            DataList1.DataSource = dt;
            DataList1.DataBind();
        }
        catch { }
       
    }
  
    protected void btnPrice_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text.ToString().Length == 0 || TextBox2.Text.ToString().Length == 0)
        {
            priceto = "";
            pricefrom = "";
            displayfilteritem();
            return;
        }
      if((float.Parse(TextBox1.Text.ToString())) > (float.Parse(TextBox2.Text.ToString())))
      {
          TextBox2.Text=TextBox1.Text;
      }
        priceto=TextBox1.Text;
        pricefrom=TextBox2.Text;
        displayfilteritem();
    }
    protected void cblBrand_SelectedIndexChanged(object sender, EventArgs e)
    {
      
        s_brand = "";
        foreach (ListItem item in cblBrand.Items)
        {
            if (item.Selected)
            {
                s_brand += item.Value + ",";
            }
        }
        s_brand=s_brand.TrimEnd(',');

        displayfilteritem();
    }
    public void displayfilteritem()
    {
        try
        {
            int i = 0;
            String keyword = "";
            f_query = "";
            if (s_brand != "")
            {
                if (i == 0)
                {
                    i++;
                }
                else
                {
                    keyword = " And ";
                }
                f_query = keyword + " brand_id IN (" + s_brand + ")";
            }
            if (s_frame_shape != "")
            {
                if (i == 0)
                {
                    i++;
                }
                else
                {
                    keyword = " And ";
                }

                f_query += keyword + " shape_id in ( " + s_frame_shape + " ) ";

            }
            if (s_size != "")
            {
                if (i == 0)
                {
                    i++;
                }
                else
                {
                    keyword = " And ";
                }

                f_query += keyword + " frame_size in ( " + s_size + " ) ";

            }
            if (s_type != "")
            {
                if (i == 0)
                {
                    i++;
                }
                else
                {
                    keyword = " And ";
                }

                f_query += keyword + " frame_type_id in ( " + s_type + " ) ";

            }
            if (priceto != "")
            {
                if (i == 0)
                {
                    i++;
                }
                else
                {
                    keyword = " And ";
                }

                f_query += keyword + " ( pprice between " + TextBox1.Text + " and " + TextBox2.Text + " ) ";

            }
            con.Close();
            con.Open();
            SqlCommand cmd_display = new SqlCommand();
            cmd_display.CommandText = "select * from tbl_product where " + f_query;
            cmd_display.CommandType = CommandType.Text;
            cmd_display.Connection = con;
            SqlDataAdapter ad = new SqlDataAdapter(cmd_display);
            DataSet ds = new DataSet();
            ad.Fill(ds);
            con.Close();
            DataList1.DataSource = ds;
            DataList1.DataBind();
        }
        catch
        {
            SqlCommand cmd_display = new SqlCommand();
            cmd_display.CommandText = "select * from tbl_product";
            cmd_display.CommandType = CommandType.Text;
            cmd_display.Connection = con;
            SqlDataAdapter ad = new SqlDataAdapter(cmd_display);
            DataSet ds = new DataSet();
            ad.Fill(ds);
            con.Close();
            DataList1.DataSource = ds;
            DataList1.DataBind();
        }
    }
    protected void cblshape_SelectedIndexChanged(object sender, EventArgs e)
    {
       
        s_frame_shape = "";
        foreach (ListItem item in cblshape.Items)
        {
            if (item.Selected)
            {

                s_frame_shape += item.Value + ",";

            }
        }
       s_frame_shape= s_frame_shape.TrimEnd(',');
        displayfilteritem();
   
    }
    protected void cblSize_SelectedIndexChanged(object sender, EventArgs e)
    {
       s_size = "";
        foreach (ListItem item in cblsize.Items)
        {
            if (item.Selected)
            {

                s_size += "'" + item.Value + "'" + ",";

            }
        }
        s_size = s_size.TrimEnd(',');
        displayfilteritem();
    }
    protected void cblType_SelectedIndexChanged(object sender, EventArgs e)
    {

        s_type = "";
        foreach (ListItem item in cblType.Items)
        {
            if (item.Selected)
            {

                s_type +=item.Value +",";

            }
        }
        s_type = s_type.TrimEnd(',');
        displayfilteritem();
    }

    public void Brand_fill()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select * from tbl_brand";
        cmd.Connection = con;
        con.Open();
        using (SqlDataReader sdr = cmd.ExecuteReader())
        {
            while (sdr.Read())
            {
                ListItem item = new ListItem();
                item.Text = sdr["brand_name"].ToString();
                item.Value = sdr["brand_id"].ToString();
                cblBrand.Items.Add(item);
            }
        }

    }

    public void Shape_fill()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select * from tbl_shape";
        cmd.Connection = con;

        using (SqlDataReader sdr = cmd.ExecuteReader())
        {
            while (sdr.Read())
            {
                ListItem item = new ListItem();
                item.Text = sdr["shape_name"].ToString();
                item.Value = sdr["shape_id"].ToString();
                cblshape.Items.Add(item);
            }
        }

    }

    public void Type_fill()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select * from tbl_frame_type";
        cmd.Connection = con;

        using (SqlDataReader sdr = cmd.ExecuteReader())
        {
            while (sdr.Read())
            {
                ListItem item = new ListItem();
                item.Text = sdr["frame_type_name"].ToString();
                item.Value = sdr["frame_type_id"].ToString();
                cblType.Items.Add(item);
            }
        }

    }
}