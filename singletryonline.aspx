<%@ Page Language="C#" AutoEventWireup="true" CodeFile="singletryonline.aspx.cs" Inherits="singletryonline" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
   <title>Palak Optics</title>
    <link href="css/fancybox/jquery.fancybox1.css" rel="stylesheet">
    <script src="js/jquery.fancybox.pack.js"></script>
  <link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/style2.css" rel="stylesheet" />

    
<script src="js/jquery.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.fancybox.pack.js"></script>
<script src="js/portfolio/setting.js"></script>
<script src="js/custom.js"></script>
<!-- Theme skin -->
<link href="skins/default.css" rel="stylesheet" />


<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/form.css" rel="stylesheet" type="text/css" media="all" />
    
<link href='fonts/Indian_Rupee_Symbol.sgv' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Exo+2' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="js/jquery1.min.js"></script>
    <link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/m1.css" rel="stylesheet" type="text/css" media="all" />
    <script>$(document).ready(function () { $(".megamenu").megamenu(); });</script>

    <link href="css/menu.css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/form.css" rel="stylesheet" type="text/css" media="all" />
<link href='http://fonts.googleapis.com/css?family=Exo+2' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="js/jquery1.min.js"></script>
   <link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/megamenu.js"></script>
<script>$(document).ready(function () { $(".megamenu").megamenu(); });</script>

    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
.searchtextbox {
            border: none;
            outline: none;
            background: none;
            font-size: 0.85em;
            font-family: 'Exo 2', sans-serif;
            color: #777;
            width: 130px;
            padding: 7px;
            -webkit-apperance: none;
            margin: 0;
            -webkit-transition: all 0.5s ease-out;
            -moz-transition: all 0.5s ease-out;
            -ms-transition: all 0.5s ease-out;
            -o-transition: all 0.5s ease-out;
        }
        .searchtextbox:focus {
            width: 150px;
        }
        .searchbutton {
            border: none;
            text-indent: -9999px;
            outline: none;
            cursor: pointer;
            background: url("../images/search.png") no-repeat 0px 3px;
            width: 30px;
            height: 25px;
            padding: 8px;
        }

    </style>


    <script type="text/javascript">
      //  alert('<%= Session["path"].ToString()%>');
        //object of the element to be moved
        _item = null;
        //stores x & y co-ordinates of the mouse pointer
        mouse_x = 0;
        mouse_y = 0;
        degree = 0;

        // stores top,left values (edge) of the element
        ele_x = 0;
        ele_y = 0;

        //bind the functions
        function move_init() {
           
            document.onmousemove = _move;
            document.onmouseup = _stop;
        }

        //destroy the object when we are done
        function _stop() {
            _item = null;
        }

        //main functions which is responsible for moving the element (div in our example)
        function _move(e) {
            mouse_x = document.all ? window.event.clientX : e.pageX;
            mouse_y = document.all ? window.event.clientY : e.pageY;

            if (_item != null) {
                if ((mouse_x - ele_x) <= 200 && mouse_y - ele_y <= 385) {
                    _item.style.left = (mouse_x - ele_x) + "px";
                    _item.style.top = (mouse_y - ele_y) + "px";

                }
            }

        }

        //will be called when use starts dragging an element
        function _move_item(ele) {
            //store the object of the element which needs to be moved
            var a = document.getElementById('btnup');
            a.style.display = 'inherit';
            a = document.getElementById('btndown');
            a.style.display = 'inherit';
            _item = ele;
            ele_x = mouse_x - _item.offsetLeft;
            ele_y = mouse_y - _item.offsetTop;

        }

        function up() {
            degree = degree + 2;
            document.getElementById('ele').style.WebkitTransform = 'rotate(' + degree + 'deg)';
        }
        function down() {
            degree = degree - 2;
            document.getElementById('ele').style.WebkitTransform = 'rotate(' + degree + 'deg)';
        }

    </script>
    <style type="text/css">
      #ele{
        width: 300px;
        height:100px;
        cursor: move;
        position: relative;
        padding: 10px;
    
       
      }
 
    .resize
    {
         background-image:url('<%= "./images/try_online/"+Request.QueryString.Get("query")+".png"%>');
         background-size:contain;
         background-repeat:no-repeat;
         resize: both;
         overflow: auto;
         cursor:nw-resize;
    }
        
        .pan{
        background-size:contain;
        background-image:url('<%= Session["path"].ToString()%>');
        background-repeat:no-repeat;
        }
    </style>
    <script src="js/slides.min.jquery.js"></script>
   <script>
       $(function () {

         var a = document.getElementById('btnup');
           a.style.display = 'none';
           a = document.getElementById('btndown');
           a.style.display = 'none';
           $('#products').slides({
               preload: true,
               preloadImage: 'img/loading.gif',
               effect: 'slide, fade',
               crossfade: true,
               slideSpeed: 350,
               fadeSpeed: 500,
               generateNextPrev: true,
               generatePagination: false
           });
       });
	</script>
	<!-- start zoom -->
	<link rel="stylesheet" href="css/zoome-min.css" />
	<script type="text/javascript" src="js/zoome-e.js"></script>
	<script type="text/javascript">
	    $(function () {
	        $('#img1,#img2,#img3,#img4').zoome({ showZoomState: true, magnifierSize: [250, 250] });
	    });
	</script>		
    <style type="text/css">
        .btn_form {
            font-family: 'Exo 2', sans-serif;
            cursor: pointer;
            border: none;
            outline: none;
            display: inline-block;
            font-size: 1em;
            padding: 10px 34px;
            background: #4CB1CA;
            color: #FFF;
            text-transform: uppercase;
            -webkit-transition: all 0.3s ease-in-out;
            -moz-transition: all 0.3s ease-in-out;
            -o-transition: all 0.3s ease-in-out;
            transition: all 0.3s ease-in-out;
        }
        .btn_form :hover {
            background: #555;
        }
    </style>

    <style type="text/css">
        .recent
        {
            cursor: pointer;
	        position: relative;
	        /*margin-top:10px;*/
	        /*margin-bottom: 10px;*/
	        max-width:150px;
	        max-height:200px;
        }

        .recentlbl
        {
            text-align:center;
            color:#777;
	        font-size:1em;
            text-decoration:none;
            /*height:5px;
            width:2px;*/
        }

        .recentlbl1
        {
            text-align:center;
            color:#777;
	        font-size:small;
            text-decoration:none;
            white-space:nowrap;
          
           
        }

        .recentitem
        {
            
            float: right;
	        margin:0px;
	        padding:20px;
	        cursor: pointer;
	        position: relative;
	        line-height: 0px;
            max-width:150px;
	        max-height:200px;
            margin-top:0px;
	        margin-bottom: 0px;
            
        }

        .span_3_of_4 {
	width: 100px;
}
    </style>  

</head>
     <body onload="move_init()" >
    <form id="form2" runat="server">
       <table class="auto-style1">
            <tr>
                <td>

                    <div class="header-top">
                        <div class="wrap">
                            <div class="cssmenu">
                                <ul>
                                   <li><a href="login.aspx">
                            <asp:Label ID="lbllogin" runat="server" Text="Log In"></asp:Label></a></li>
                                    |  	   
                                    <li><a href="register.aspx">
                            <asp:Label ID="lblsighup" runat="server" Text="Sigh Up"></asp:Label>
                        </a></li> 
                                    |
					    <li><a href="checkout.aspx">
                            <asp:Label ID="lblcheckout" runat="server" Text="Checkout"></asp:Label></a>
                        </li>  | 	    
					    <li><a href="booking.aspx">
                            <asp:Label ID="Label1" runat="server" Text="Booking"></asp:Label></a>
                        </li>
                                    |
					    
					    
                                </ul>
                            </div>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <div class="header-bottom">
                        <div class="wrap">
                            <div class="header-bottom-left">
                                <div class="logo">
                                    <a href="home.aspx">
                                        <img src="images/logo.png" width="171" height="81" alt="" /></a>
                                </div>
				<div class="menu">
	            <ul class="megamenu skyblue">
			<li class="active grid"><a href="home.aspx">Home</a></li>
			<li><a class="color4" href="#">women</a>
				<div class="megapanel">
					<div class="row">
						<div class="col1">
							<div class="h_nav">
								<h4>Brand</h4>
								<ul>
									<li><a href="product.aspx?ref=brand_id&id=18&gender=FEMALE">IDEE</a></li>
									<li><a href="product.aspx?ref=brand_id&id=19&gender=FEMALE">FCUK</a></li>
									<li><a href="product.aspx?ref=brand_id&id=20&gender=FEMALE">RAY BAN</a></li>
									<li><a href="product.aspx?ref=brand_id&id=21&gender=FEMALE">FASTRACK</a></li>
                                    <li><a href="product.aspx?ref=brand_id&id=22&gender=FEMALE">LEE COOPER</a></li>
								</ul>	
							</div>							
						</div>
						<div class="col1">
							<div class="h_nav">
								<h4>Shape</h4>
								<ul>
									<li><a href="product.aspx?ref=shape_id&id=1&gender=FEMALE">Avator</a></li>
									<li><a href="product.aspx?ref=shape_id&id=2&gender=FEMALE">Wayfarer</a></li>
								</ul>	
							</div>							
						</div>
						<div class="col1">
							<div class="h_nav">
								<h4>Material</h4>
								<ul>
									<li><a href="product.aspx?ref=material_id&id=1&gender=FEMALE">Acetate</a></li>
									<li><a href="product.aspx?ref=material_id&id=2&gender=FEMALE">Wood</a></li>
								</ul>	
							</div>												
						</div>
                        <div class="col1">
							<div class="h_nav">
								<h4>Frame Type</h4>
								<ul>
									<li><a href="product.aspx?ref=frame_type_id&id=1&gender=FEMALE">Full Rim</a></li>
									<li><a href="product.aspx?ref=frame_type_id&id=2&gender=FEMALE">Rim Less</a></li>
                                    <li><a href="product.aspx?ref=frame_type_id&id=3&gender=FEMALE">Half Rim</a></li>
								</ul>	
							</div>							
						</div>
					  </div>
					</div>
				</li>				
				<li><a class="color5" href="#">Men</a>
				<div class="megapanel">
					<div class="row">
						<div class="col1">
							<div class="h_nav">
								<h4>Brand</h4>
								<ul>
									<li><a href="product.aspx?ref=brand_id&id=18&gender=MALE">IDEE</a></li>
									<li><a href="product.aspx?ref=brand_id&id=19&gender=MALE">FCUK</a></li>
									<li><a href="product.aspx?ref=brand_id&id=20&gender=MALE">RAY BAN</a></li>
									<li><a href="product.aspx?ref=brand_id&id=21&gender=MALE">FASTRACK</a></li>
                                    <li><a href="product.aspx?ref=brand_id&id=22&gender=MALE">LEE COOPER</a></li>
								</ul>	
							</div>							
						</div>
						<div class="col1">
							<div class="h_nav">
								<h4>Shape</h4>
								<ul>
									<li><a href="product.aspx?ref=shape_id&id=1&gender=MALE">Avator</a></li>
									<li><a href="product.aspx?ref=shape_id&id=2&gender=MALE">Wayfarer</a></li>
								</ul>	
							</div>							
						</div>
						<div class="col1">
							<div class="h_nav">
								<h4>Material</h4>
								<ul>
									<li><a href="product.aspx?ref=material_id&id=1&gender=MALE">Acetate</a></li>
									<li><a href="product.aspx?ref=material_id&id=2&gender=MALE">Wood</a></li>
								</ul>	
							</div>												
						</div>
                        <div class="col1">
							<div class="h_nav">
								<h4>Frame Type</h4>
								<ul>
									<li><a href="product.aspx?ref=frame_type_id&id=1&gender=MALE">Full Rim</a></li>
									<li><a href="product.aspx?ref=frame_type_id&id=2&gender=MALE">Rim Less</a></li>
                                    <li><a href="product.aspx?ref=frame_type_id&id=3&gender=MALE">Half Rim</a></li>
								</ul>	
							</div>							
						</div>
					  </div>
					</div>
				</li>
                    
				<li><a class="color4" href="#">ALL</a>
				<div class="megapanel">
					<div class="row">
						<div class="col1">
							<div class="h_nav">
								<h4>Brand</h4>
								<ul>
									<li><a href="product.aspx?ref=brand_id&id=18">IDEE</a></li>
									<li><a href="product.aspx?ref=brand_id&id=19">FCUK</a></li>
									<li><a href="product.aspx?ref=brand_id&id=20">RAY BAN</a></li>
									<li><a href="product.aspx?ref=brand_id&id=21">FASTRACK</a></li>
                                    <li><a href="product.aspx?ref=brand_id&id=22">LEE COOPER</a></li>
								</ul>	
							</div>							
						</div>
						<div class="col1">
							<div class="h_nav">
								<h4>Shape</h4>
								<ul>
									<li><a href="product.aspx?ref=shape_id&id=1">Avator</a></li>
									<li><a href="product.aspx?ref=shape_id&id=2">Wayfarer</a></li>
								</ul>	
							</div>							
						</div>
						<div class="col1">
							<div class="h_nav">
								<h4>Material</h4>
								<ul>
									<li><a href="product.aspx?ref=material_id&id=1">Acetate</a></li>
									<li><a href="product.aspx?ref=material_id&id=2">Wood</a></li>
								</ul>	
							</div>												
						</div>
                        <div class="col1">
							<div class="h_nav">
								<h4>Frame Type</h4>
								<ul>
									<li><a href="product.aspx?ref=frame_type_id&id=1">Full Rim</a></li>
									<li><a href="product.aspx?ref=frame_type_id&id=2">Rim Less</a></li>
                                    <li><a href="product.aspx?ref=frame_type_id&id=3">Half Rim</a></li>
								</ul>	
							</div>							
						</div>
					  </div>
					</div>
                    
				</li>
				<%--<li><a class="color7" href="other.html">Purchase</a></li>--%>
			</ul>
                    </div>
                                </div>
                  <div class="header-bottom-right">
                        <div class="search">

                            <asp:TextBox ID="TextBox1" CssClass="searchtextbox" runat="server"></asp:TextBox>
                            <asp:Button ID="Button1" CausesValidation="false" runat="server" CssClass="searchbutton" Text="Button" OnClick="Button1_Click" />
                        </div>
                        <div class="tag-list">
                         
                            <ul class="icon1 sub-icon1 profile_img">
                                <li><a class="active-icon c2" href="checkout.aspx"></a>
                                    <ul class="sub-icon1 list">
                                     <a href="checkout.aspx">
                                     <p style="text-align: center">   your item is <asp:Label ID="lblitem" Text="0" runat="server" ></asp:Label>
                                         <br /> price is <asp:Label ID="lblprice" runat="server" Text="0" ></asp:Label>&nbsp;<asp:Image ID="Image2" ImageUrl="~/fonts/Indian_Rupee_Symbol.png" Height="10px" Width="10px" runat="server" />
                          
                                    </p> </a>
                                    </ul>
                                </li>
                            </ul>
                            <ul class="last">
                                <li><a href="checkout.aspx">Cart(<asp:Label ID="lblitem1" runat="server" Text="0"></asp:Label>)</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="clear"></div>
                            </td>
            </tr>
            <tr>
                <td>
                    <div class="mens" onload="move_init()">
                        <div class="main">
                            <div class="wrap">
                                <ul class="breadcrumb breadcrumb__t">
                                    <a class="home" href="home.aspx">Home</a> / <a href="product.aspx">product</a> /
                                    <asp:Label ID="lblbrad" runat="server" Text=""></asp:Label>
                                </ul>
                                </div>
                                <div class="cont span_2_of_3">
                                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                       <div class="grid images_3_of_2">
                                        <div id="container">
                                            <div id="products_example">
                                                <div id="products">   <div class="slides_container">
                                                    <asp:ImageButton ID="imgmain" Height="285" Width="465px"   CausesValidation="false" runat="server" />
                                                     </div>
                                                    <ul class="pagination">
                                                        <li>
                                                              <asp:ImageButton ID="imgslide1" runat="server" Height="100" Width="150px" OnClick="imgslide1_Click" CausesValidation="false" /></li>
                                                        <li>
                                                          <asp:ImageButton ID="imgslide2" OnClick="imgslide2_Click" Height="100px" Width="150px" CausesValidation="false" runat="server" /></li>
                                                          <li>
                                                              <asp:ImageButton ID="imgslide3" OnClick="imgslide3_Click" Height="100px" Width="150px" CausesValidation="false" runat="server" />
                                                          </li>
                                                            </ul>
                                                     </div>

                                            </div>
                                        </div>
                                    </div>
                                        </ContentTemplate>
                                        </asp:UpdatePanel>

                                    <div class="desc1 span_3_of_2">
                                        <h3 class="m_3">
                                            <asp:Label ID="lblproduct_name" runat="server"></asp:Label></h3>
                                        <p class="m_5">
                                            <asp:Label ID="lblproduct_price" runat="server"></asp:Label> &nbsp;<asp:Image ID="Image1" ImageUrl="~/fonts/Indian_Rupee_Symbol.png" Height="10px" Width="10px" runat="server" />
                                            <span class="reducedfrom">
                                               
                                        </p>
                                        <asp:Button ID="Button2" CssClass="btn_form" runat="server" Text="Buy" CausesValidation="False" OnClick="Button1_Click" />
                                        <asp:Label ID="lblchckqty" runat="server" Text=""></asp:Label>
                                        <br />
                                       <p class="m_text2">
                                        </p>
                                        <p class="m_text2">
                                              <asp:Label ID="Lbldesc" runat="server" Text='<%#Eval("product_des") %>'></asp:Label>
                                </p>
                                      

                                     </div>
                                    </div>
                            
                            <div class="rsingle span_1_of_single" style="margin-top: 20px;margin-left: 15px;">
                                   <asp:Button ID="Button3" OnClick="Button3_Click" runat="server" CssClass="btn_form"
                                                Text="Try Online" />&nbsp;
                                         <p class="m_text2">
                                                <asp:FileUpload ID="FileUpload1" Visible="false" runat="server" />
                                                <br />
                                                <asp:Button ID="btnviewimage" OnClick="btnviewimage_Click" Visible="false" runat="server" CssClass="btn_form" Text="View Image" />
                                           
                                              </p>
                                   <p class="m_text2">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FileUpload1" Display="Dynamic" ErrorMessage="Please Upload File" ForeColor="Red"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic" ErrorMessage="Please Upload .jpg Or .png File." ForeColor="Red" ValidationExpression="(.*\.([Jj][Pp][Gg])|.*\.([pP][nN][gG]))" ControlToValidate="FileUpload1"></asp:RegularExpressionValidator>
                                           
                                              </p>  
                                        
                               <a id="test" class="fancybox">
                                  <asp:Panel ID="Panel1" Visible="false" CssClass="pan" BackImageUrl='<%# Session["path"].ToString() %>' runat="server" Height="350px" Width="334px">
                                                            &nbsp;
                                                            <div runat="server" class="resize" id="ele" onmousedown="_move_item(this);" style="height: 40px; width: 110px">
                                                            </div>

                                                        </asp:Panel>
                                             <input type="button" id="btnup" onclick="up()" title="plus"  />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                             <input type="button" id="btndown" onclick="    down()" title="minus" />
                            
                                  </a>
                                </div>
                 </div>


                 <div>                       
                                    </div>

                                    <div class="clear"></div>
                                    <div class="clients">
                                        <h3 class="m_3">Other Products in the same category</h3>
                                        <p class="m_3">


                                            <asp:DataList ID="DataList1" AutoPostBack="true" runat="server" RepeatColumns="5" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand" DataSourceID="SqlDataSource1">
                                                <ItemTemplate>

                                                    <asp:Image ID="Image1" CommandName="viewproduct" CommandArgument='<%# Eval("model_id") %>' runat="server" CssClass="recent" ImageUrl='<%# "~/images/"+Eval("model_id")+".jpg"%>' />
                                                    <br />

                                                    <asp:Label ID="pnameLabel" runat="server" Text='<%# Eval("pname") %>' CssClass="recentlbl1" />
                                                    <br />


                                                    <asp:Label ID="ppriceLabel" runat="server" Text='<%# Eval("pprice") %>' CssClass="recentlbl" />
                                                    <br />

                                                    <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="viewproduct" CommandArgument='<%# Eval("model_id") %>' CssClass="btn_form" Text="view product" />

                                                    <br />
                                                    <br />
                                                </ItemTemplate>
                                            </asp:DataList>

                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbmslink %>" SelectCommand="SELECT tbl_brand.brand_name, tbl_product.pprice, tbl_product.pname,tbl_product.model_id FROM tbl_brand INNER JOIN tbl_product ON tbl_brand.brand_id = tbl_product.brand_id AND tbl_brand.brand_id = tbl_product.brand_id WHERE (tbl_product.category_id = @cat) AND (tbl_product.gender = @gen) AND (tbl_product.brand_id = @brnd)">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="cat" SessionField="cat" />
                                                    <asp:SessionParameter Name="gen" SessionField="gen" />
                                                    <asp:SessionParameter Name="brnd" SessionField="brand" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>


                                            <%--</ul>--%>
                                        </p>


                                    </div>
                                    <br />
                                    <br />
                                    <h3 class="m_3">Product Details</h3>
                                    <p class="m_text">
                                          </p>
                                    <table class="auto-style1" style="border:solid" style="margin-left: 20px;">
                                        <tr>
                                            <td>Category</td>
                                            <td>
                                                <asp:Label ID="lblcategory" runat="server" Text="Label"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Colour</td>
                                            <td>
                                                <asp:Label ID="lblcolor" runat="server" Text="Label"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Type</td>
                                            <td>
                                                <asp:Label ID="lbltype" runat="server" Text="Label"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Lens Tech</td>
                                            <td>
                                                <asp:Label ID="lbltech" runat="server" Text="Label"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Material</td>
                                            <td>
                                                <asp:Label ID="lblmatetial" runat="server" Text="Label"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Shape</td>
                                            <td>
                                                <asp:Label ID="lblshape" runat="server" Text="Label"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Model No</td>
                                            <td>
                                                <asp:Label ID="lblmodel_no" runat="server" Text="Label"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Gender</td>
                                            <td>
                                                <asp:Label ID="lblgender" runat="server" Text="Label"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Size</td>
                                            <td>
                                                <asp:Label ID="lblsize" runat="server" Text="Label"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Height</td>
                                            <td>
                                                <asp:Label ID="lblheight" runat="server" Text="Label"></asp:Label>
                                                &nbsp;mm</td>
                                        </tr>

                                        <tr>
                                            <td>Weight</td>
                                            <td>
                                                <asp:Label ID="lblwidth" runat="server" Text="Label"></asp:Label>
                                                &nbsp;mm</td>
                                        </tr>

                                        <tr>
                                            <td>Warranty</td>
                                            <td>
                                                <asp:Label ID="lblwarranty" runat="server" Text="Label"></asp:Label>
                                                &nbsp;month</td>
                                        </tr>

                                        <tr>
                                            <td>Brand</td>
                                            <td>
                                                <asp:Label ID="lblbrand" runat="server" Text="Label"></asp:Label>
                                            </td>
                                        </tr>

                                    </table>
                                </div>
                </td>
            </tr>
            <tr>
                <td>
    <div class="footer">
		<div class="footer-top">
			<div class="wrap">
			  <div class="section group example">
				<div class="col_1_of_2 span_1_of_2">
					<ul class="f-list">
					  <li><img src="images/2.png"><span class="f-text">Free Shipping And Cash On Deliver </span><div class="clear"></div></li>
					</ul>
				</div>
				<div class="col_1_of_2 span_1_of_2">
					<ul class="f-list">
					  <li><img src="images/3.png"><span class="f-text">Call us! +(91)-9426421211 </span><div class="clear"></div></li>
					</ul>
				</div>
				<div class="clear"></div>
		      </div>
			</div>
		</div>
		<div class="footer-middle">
			<div class="wrap">
		   <div class="section group example">
			  <div class="col_1_of_f_1 span_1_of_f_1">
				 <div class="section group example">
				   <div class="col_1_of_f_2 span_1_of_f_2">
				      <h3>Facebook</h3>
						<script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
						<div class="like_box">	
							<div class="fb-like-box" data-href="https://www.facebook.com/palakoptic?fref=ts" data-colorscheme="light" data-show-faces="true" data-header="true" data-stream="false" data-show-border="true"></div>
						</div>
 				  </div>
				  <div class="col_1_of_f_2 span_1_of_f_2">
						<h3>From Twitter</h3>
				       <div class="recent-tweet">
							<div class="recent-tweet-icon">
								<span> </span>
							</div>
							<div class="recent-tweet-info">
								<p> which don't look even slightly believable. If you are <a href="www.twitter.com">Follow us On Twitter</a> And Know More About Our Products</p>
							</div>
							<div class="clear"> </div>
					   </div>
					   <div class="recent-tweet">
							<div class="recent-tweet-icon">
								<span> </span>
							</div>
							<div class="recent-tweet-info">
								<p>To See Our Products And Our latest Products<a href="www.instagram.com">Follow Us On Instagram</a> We Upload Our latest Products there</p>
							</div>
							<div class="clear"> </div>
					  </div>
				</div>
				<div class="clear"></div>
		      </div>
 			 </div>
			 <div class="col_1_of_f_1 span_1_of_f_1">
			   <div class="section group example">
				 <div class="col_1_of_f_2 span_1_of_f_2">
				    <h3>Information</h3>
						<ul class="f-list1">
						    <li><a href="home.aspx">Home</a></li>
				            <li><a href="feedback.aspx">Feedback </a></li>
				            <li><a href="booking.aspx">Booking</a></li>
				             <li><a href="register.aspx">Sign Up</a></li>
				            <li><a href="login.aspx">Login</a></li>
				            <li><a href="gallery.aspx">Gallery</a></li>
			         	</ul>
 				 </div>
				 <div class="col_1_of_f_2 span_1_of_f_2">
				   <h3>Contact us</h3>
						<div class="company_address">
					                <p> G4 Yash Aqua Building, Below ,</p>
							   		<p>Macdonald, Vijay Cross Road, </p>
							   		<p>Navrangpura, Ahmedabad - 380009</p>
					   		<p>Phone: +(91)-79-31901007, 31901006,<br /> 
                                    +(91)-9426421211, 9879010013
                                    </p>
					   		<p>Email: <span>contact@palakoptics.com</span></p>
					   		
					   </div>
					   <div class="social-media">
						     <ul>
						        <li> <span class="simptip-position-bottom simptip-movable" data-tooltip="Google"><a href="https://plus.google.com/111939855219407485401/about" target="_blank"> </a></span></li>
			         <li><span class="simptip-position-bottom simptip-movable" data-tooltip="Linked in"><a href="#" target="_blank"> </a> </span></li>
						        <li><span class="simptip-position-bottom simptip-movable" data-tooltip="Rss"><a href="#" target="_blank"> </a></span></li>
						        
                                 <li><span class="simptip-position-bottom simptip-movable" data-tooltip="Facebook"><a href="https://www.facebook.com/palakoptic?fref=ts" target="_blank"> </a></span></li>
						    </ul>
					   </div>
				</div>
				<div class="clear"></div>
		    </div>
		   </div>
		  <div class="clear"></div>
		    </div>
		  </div>
		</div>
		<div class="footer-bottom">
			<div class="wrap">
	             <div class="copy">
			        <p>© PalakOptics 2014. All Rights Are Reserved</p>
		         </div>
				<div class="f-list2">
				 <ul>
					<li class="active"><a href="about.html">About Us</a></li> |
					<li><a href="delivery.html">Delivery & Returns</a></li> |
					<li><a href="delivery.html">Terms & Conditions</a></li> |
					<li><a href="feedback.aspx">Contact Us</a></li> 
				 </ul>
			    </div>
			    <div class="clear"></div>
		      </div>
	     </div>
	</div> 

                </td>
            </tr>
        </table>
     </form></body>