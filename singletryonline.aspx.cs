 using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class singletryonline : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                //.Text = Session["lblitem"].ToString();
                //  lblprice.Text = Session["lblprice"].ToString();
                lbllogin.Text = Session["lbllogin"].ToString();
                lblitem.Text = Session["lblitem"].ToString();
                lblprice.Text = Session["lblprice"].ToString();
                lblitem1.Text = Session["lblitem"].ToString();
                //   lblshow.Text = Session["lblshow"].ToString();
                // lblhi.Text = Session["lblhi"].ToString();
            }
            catch
            {

            }
    
            Response.Write(Session["top"].ToString());
          
            // string id = Request.QueryString.Get("query").ToString();
            PagedDataSource objPage = new PagedDataSource();
            String str = System.Configuration.ConfigurationManager.ConnectionStrings["dbmslink"].ConnectionString;
            SqlConnection con = new SqlConnection(str);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "SELECT tbl_brand.brand_name, tbl_category.category_name, tbl_color.color_name, tbl_frame_type.frame_type_name, tbl_lens_technology.lens_tech_name, tbl_shape.shape_name, tbl_material.material_name,tbl_product.* FROM tbl_brand INNER JOIN tbl_product ON tbl_brand.brand_id = tbl_product.brand_id OR tbl_brand.brand_id = tbl_product.brand_id INNER JOIN tbl_category ON tbl_product.category_id = tbl_category.category_id INNER JOIN tbl_color ON tbl_product.frame_color_id = tbl_color.color_id OR tbl_product.glass_color_id = tbl_color.color_id INNER JOIN tbl_frame_type ON tbl_product.frame_type_id = tbl_frame_type.frame_type_id INNER JOIN tbl_lens_technology ON tbl_product.lense_technology_id = tbl_lens_technology.lens_tech_id INNER JOIN tbl_material ON tbl_product.material_id = tbl_material.material_id INNER JOIN tbl_shape ON tbl_product.shape_id = tbl_shape.shape_id where tbl_product.model_id='" + Request.QueryString.Get("query") + "'";
            cmd.CommandType = CommandType.Text;
            SqlDataReader dr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            DataSet ds = new DataSet();
            ds.Tables.Add(dt);
            objPage.AllowPaging = true;
            objPage.DataSource = ds.Tables[0].DefaultView;
            objPage.PageSize = 2;
            //DataList1.DataSource = objPage;
            //DataList1.DataBind();
            try
            {
                Lbldesc.Text = ds.Tables[0].Rows[0][28].ToString();
                Session["cat"] = ds.Tables[0].Rows[0][15].ToString();
                //  Label1.Text = ds.Tables[0].Rows[0][1].ToString();
                //   Label2.Text = ds.Tables[0].Rows[0][2].ToString();
                lblcategory.Text = ds.Tables[0].Rows[0][1].ToString();
                lblcolor.Text = ds.Tables[0].Rows[0][2].ToString();
                lbltype.Text = ds.Tables[0].Rows[0][3].ToString();
                lbltech.Text = ds.Tables[0].Rows[0][4].ToString();
                lblshape.Text = ds.Tables[0].Rows[0][5].ToString();
                lblmatetial.Text = ds.Tables[0].Rows[0][6].ToString();
                lblproduct_name.Text = ds.Tables[0].Rows[0][8].ToString(); ;
                lblproduct_price.Text = ds.Tables[0].Rows[0][9].ToString();
                lblbrad.Text = lblproduct_name.Text;
                Session["gen"] = ds.Tables[0].Rows[0][17].ToString();
                lblgender.Text = ds.Tables[0].Rows[0][17].ToString();
                lblmodel_no.Text = ds.Tables[0].Rows[0][7].ToString();
                // lblgender.Text = ds.Tables[0].Rows[0][21].ToString();
                lblsize.Text = ds.Tables[0].Rows[0][19].ToString();
                lblheight.Text = ds.Tables[0].Rows[0][21].ToString();
                lblwidth.Text = ds.Tables[0].Rows[0][22].ToString();
                lblwarranty.Text = ds.Tables[0].Rows[0][24].ToString();

                lblbrand.Text = ds.Tables[0].Rows[0][0].ToString(); ;
                Session["brand"] = ds.Tables[0].Rows[0][14].ToString();
                imgmain.ImageUrl = ds.Tables[0].Rows[0][11].ToString();
                imgslide1.ImageUrl = ds.Tables[0].Rows[0][11].ToString();
                imgslide2.ImageUrl = ds.Tables[0].Rows[0][12].ToString();
                imgslide3.ImageUrl = ds.Tables[0].Rows[0][13].ToString();


                // img2.Src="~/images/"+ds.Tables[0].Rows[0][7].ToString()+".jpg";
                // i2.Src = img2.Src.ToString();
                con.Close();
            }
            catch { }

        }
    }
    protected void btnp_Click(object sender, EventArgs e)
    {

        Session["i"] = int.Parse(Session["i"].ToString()) + 2;
        ele.Attributes.CssStyle.Add("transform", "rotate(" + Session["i"] + "deg)");
    }
    protected void btnm_Click(object sender, EventArgs e)
    {
        Session["i"] = int.Parse(Session["i"].ToString()) - 2;
        ele.Attributes.CssStyle.Add("transform", "rotate(" + Session["i"] + "deg)");
        ele.Attributes.CssStyle.Add("left", "");
        ele.Attributes.CssStyle.Add("top", "");
    }
  
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        ClientScript.RegisterClientScriptBlock(this.GetType(), "key", "alert('Please Enter Data')", true);

        if (e.CommandName.ToString() == "viewproduct")
            Response.Redirect("singletryonline.aspx?query=" + e.CommandArgument.ToString());
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["product_price"] = lblproduct_price.Text;
           
        String str = System.Configuration.ConfigurationManager.ConnectionStrings["dbmslink"].ConnectionString;
        SqlConnection con = new SqlConnection(str);
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT tbl_brand.brand_name, tbl_category.category_name, tbl_color.color_name, tbl_frame_type.frame_type_name, tbl_lens_technology.lens_tech_name, tbl_shape.shape_name, tbl_material.material_name,tbl_product.* FROM tbl_brand INNER JOIN tbl_product ON tbl_brand.brand_id = tbl_product.brand_id OR tbl_brand.brand_id = tbl_product.brand_id INNER JOIN tbl_category ON tbl_product.category_id = tbl_category.category_id INNER JOIN tbl_color ON tbl_product.frame_color_id = tbl_color.color_id OR tbl_product.glass_color_id = tbl_color.color_id INNER JOIN tbl_frame_type ON tbl_product.frame_type_id = tbl_frame_type.frame_type_id INNER JOIN tbl_lens_technology ON tbl_product.lense_technology_id = tbl_lens_technology.lens_tech_id INNER JOIN tbl_material ON tbl_product.material_id = tbl_material.material_id INNER JOIN tbl_shape ON tbl_product.shape_id = tbl_shape.shape_id where tbl_product.model_id='" + Request.QueryString.Get("query") + "'";
        cmd.CommandType = CommandType.Text;
        SqlDataReader dr = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        DataSet ds = new DataSet();
        ds.Tables.Add(dt);
        Session["quantity"] = ds.Tables[0].Rows[0][10].ToString();
        Session["modelno"] = ds.Tables[0].Rows[0][7].ToString();
        Session["price"] = lblprice.Text;
        con.Close();
        if (Session["quantity"].ToString() == "0")
        {
            lblchckqty.Text = "Out Of Stock";
        }
        else
        {
           
                con.Close();
                con.Open();
                //    SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "select user_email,password from tbl_user where user_email='" + Session["username"] + "' and password='" + Session["password"] + "'";
                cmd.CommandType = CommandType.Text;
                dr = cmd.ExecuteReader();
                dr.Read();
                if (!dr.HasRows)
                {

                    Session["chk"] = "1";
                    Response.Redirect("login.aspx");

                }
                if (dr[0].ToString() == Session["username"].ToString())
                {

                    con.Close();
                    con.Open();
                    cmd.Connection = con;
                    int z = 0;
                    try
                    {
                        cmd.CommandText = "insert into tbl_cart values('" + Session["username"].ToString() + "','" + Session["modelno"].ToString() + "',1," + Session["product_price"].ToString() + ")";
                        z = cmd.ExecuteNonQuery();
                    }
                    catch
                    {
                        cmd.CommandText = "update tbl_cart set qty +=1,sub_total+=" + Session["product_price"].ToString() + " where user_email='" + Session["username"].ToString() + "' and model_id='" + Session["modelno"].ToString() + "'";
                        z = cmd.ExecuteNonQuery();
                    }
                    if (z == 1)
                    {
                        //  here code for lbl in master page it is not complite
                        int x = int.Parse(Session["lblitem"].ToString());
                        x += 1;
                        Session["lblitem"] = int.Parse(x.ToString());
                        Session["lblprice"] = (int.Parse(Session["lblprice"].ToString()) + int.Parse(lblprice.Text.ToString()));
                        Response.Redirect("product.aspx");
                    }
                    else
                    {
                        Response.Redirect("home.aspx");
                    }
                }

        }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        FileUpload1.Visible = true;
        btnviewimage.Visible = true;
     //   Response.Redirect("tryonline.aspx?model_id=" + Request.QueryString.Get("query"));
    }

    protected void btnviewimage_Click(object sender, EventArgs e)
    {
        
        
           
            Panel1.Visible = true;
            //Session["path"] = Server.MapPath(FileUpload1.PostedFile.FileName.ToString());
            //Panel1.BackImageUrl = Server.MapPath(FileUpload1.PostedFile.FileName.ToString());
            Session["Image"] = FileUpload1.PostedFile;
            Stream fs = FileUpload1.PostedFile.InputStream;
            BinaryReader br = new BinaryReader(fs);
            byte[] bytes = br.ReadBytes((Int32)fs.Length);
            string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
            Panel1.BackImageUrl = "data:image/png;base64," + base64String;
            //    ClientScript.RegisterClientScriptBlock(this.GetType(), "key", "alert('" + Server.MapPath(FileUpload1.PostedFile.FileName)+ "')", true);

            Panel1.Visible = true;
        
    }
    protected void imgslide1_Click(object sender, ImageClickEventArgs e)
    {
        imgmain.ImageUrl = imgslide1.ImageUrl.ToString();
    }
    protected void imgslide2_Click(object sender, ImageClickEventArgs e)
    {
        imgmain.ImageUrl = imgslide2.ImageUrl.ToString();
    }
    protected void imgslide3_Click(object sender, ImageClickEventArgs e)
    {
        imgmain.ImageUrl = imgslide3.ImageUrl.ToString();
    }
}