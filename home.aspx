<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="home2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="css/flexslider.css" rel="stylesheet" />
<link href="css/style2.css" rel="stylesheet" />

    <script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.fancybox.pack.js"></script>
<script src="js/jquery.flexslider.js"></script>
<script src="js/animate.js"></script>
<script src="js/custom.js"></script>

<!-- Theme skin -->
        <link href="css/menu.css" rel="stylesheet" />
<script>$(document).ready(function () { $(".megamenu").megamenu(); });</script>
<script type="text/javascript" src="js/megamenu.js"></script>

<link href="skins/default.css" rel="stylesheet" />
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="wrapper">
	<!-- start header -->
		<!-- end header -->
	<section id="featured">
	<!-- start slider -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
	<!-- Slider -->
        <div id="main-slider" class="flexslider">
            <ul class="slides">
              <li>
                <img src="images/slides/1.jpg" height="360" width="1024" alt="" />
                <div class="flex-caption">
                    <h3>Modern Design</h3> 
					<p>We Give The Best Design And Lastest Desing That People Love To Wear</p> 
					<a href="gallery.aspx" class="btn btn-theme">View Gallery</a>
                </div>
              </li>
              <li>
                <img src="images/slides/2.jpg" height="360" width="1024" alt="" />
                <div class="flex-caption">
                    <h3>Fully Responsive</h3> 
					<p>We Belive Customer Is God,We Have A Very Responsive Staff Which Answers All Your Question</p> 
					<a href="gallery.aspx" class="btn btn-theme">View Gallery</a>
                </div>
              </li>
              <li>
                <img src="images/slides/3.png" height="360" width="1024" alt="" />
                <div class="flex-caption">
                    <h3>Clean & Fast</h3> 
					<p>We Never Compromise Our Services,Provides Best And Quality Service To Our Customers</p> 
					<a href="gallery.aspx" class="btn btn-theme">View Gallery</a>
                </div>
              </li>
            </ul>
        </div>
	<!-- end slider -->
			</div>
		</div>
	</div>	
	
	

	</section>
	<section class="callaction">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="big-cta">
					<div class="cta-text">
						<h2><span>WELCOME TO </span> PALAK OPTICS </h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	<section id="content">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="row">
					<div class="col-lg-3">
						<div class="box">
							<div class="box-gray aligncenter">
								<h4>Eye-checkup Booking</h4>
								<div class="icon">
								<%--<i class="fa fa-desktop fa-3x"></i>--%>
                                    <asp:Image ID="Image1" runat="server"  ImageUrl="~/images/eye.png"/>
								</div>
								<p>
								       Eye Checkup is done<br />
                                     by an expert doctor
                                     and latest technology
								</p>
									
							</div>
							<div class="box-bottom">
								<a href="booking.aspx">Booking</a>
							</div>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="box">
							<div class="box-gray aligncenter">
								<h4>Product</h4>
								<div class="icon">
								<asp:Image ID="Image2" runat="server"  ImageUrl="~/images/glass.png"/>
								</div>
								<p>
								 Our All Product are well <br /> Design / Stylist <br />
                                    Best Quality
								</p>
									
							</div>
							<div class="box-bottom">
								<a href="product.aspx">View Product</a>
							</div>
						</div>
					</div>
						<div class="col-lg-3">
						<div class="box">
							<div class="box-gray aligncenter">
								<h4>Sign In</h4>
								<div class="icon">
								<asp:Image ID="Image3" runat="server"  ImageUrl="~/images/log.png"/>
								</div>
								<p>
                                    Are You<br />
								    New Customer?<br />
                                    Click Here
								</p>
									
							</div>
							<div class="box-bottom">
								<a href="Register.aspx">Create Account </a>
							</div>
						</div>
					</div>

					<div class="col-lg-3">
						<div class="box">
							<div class="box-gray aligncenter">
								<h4>Feedback</h4>
								<div class="icon">
					                <asp:Image ID="Image4" runat="server" Height="48px" Width="48"  ImageUrl="~/images/feedback.png"/>
								</div>
								<p>
								    Give Us Feedback<br />
                                    To Slove Your<br />
                                    Problem 
								</p>
									
							</div>
							<div class="box-bottom">
								<a href="feedback.aspx">Submit Feedback</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- divider -->
		<div class="row">
			<div class="col-lg-12">
				<div class="solidline">
				</div>
			</div>
		</div>
		<!-- end divider -->
	
		
	</section>

</asp:Content>

