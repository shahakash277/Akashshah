<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="booking.aspx.cs" Inherits="booking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .styled-select select {
   background: transparent;
   width: 268px;
   padding: 5px;
   font-size: 16px;
   line-height: 1;
   border: 0;
   border-radius: 0;
   height: 34px;
   -webkit-appearance: none;
   }
        .styled-select {
   width: 240px;
   height: 34px;
   overflow: hidden;
   background: url(new_arrow.png) no-repeat right #ddd;
   border: 1px solid #ccc;
   }
</style>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="wrap">
            <ul class="breadcrumb breadcrumb__t"><a class="home" href="#">Home</a>  / Booking</ul>

        </div>
    <div class="col_1_of_login span_1_of_login">
				<div class="login-title">
	           		<h4 class="title">Book For Eye-Checkup</h4>
					<div id="loginbox" class="loginbox">
						<form action="" method="post" name="login" id="login-form">
						  <fieldset class="input">
						    <p id="login-form-username">
						      <label for="modlgn_username">Select Your Date :&nbsp;&nbsp; </label>
                               
&nbsp;<br /><asp:DropDownList ID="ddldate" runat="server" OnSelectedIndexChanged="ddldate_SelectedIndexChanged" AutoPostBack="True" Width="120px"  ForeColor="#7d6754" Font-Names="Andalus" CssClass="styled-select"></asp:DropDownList>
						    </p>
						    <p id="login-form-password">
						      <label for="modlgn_passwd">Select Your Time :</label>&nbsp;&nbsp;
                                <br /><asp:DropDownList ID="DropDownList1" runat="server" Width="120px"  ForeColor="#7d6754" Font-Names="Andalus" CssClass="styled-select">
                         <%--       <asp:ListItem Value="10:00:00">10:00 AM</asp:ListItem>
                               <asp:ListItem Value="10:30:00">10:30 AM</asp:ListItem>
                               <asp:ListItem Value="11:00:00">10:00 AM</asp:ListItem>
                               <asp:ListItem Value="11:30:00">11:30 AM</asp:ListItem>
                               <asp:ListItem Value="12:00:00">12:00 PM</asp:ListItem>
                               <asp:ListItem Value="12:30:00">12:30 PM</asp:ListItem>
                               <asp:ListItem Value="01:00:00">01:00 PM</asp:ListItem>
                               <asp:ListItem Value="01:30:00">01:30 PM</asp:ListItem>
                               <asp:ListItem Value="02:00:00">02:00 PM</asp:ListItem>
                               <asp:ListItem Value="02:30:00">02:30 PM</asp:ListItem>
                               <asp:ListItem Value="03:00:00">03:00 PM</asp:ListItem>
                               <asp:ListItem Value="03:30:00">03:30 PM</asp:ListItem>
                               <asp:ListItem Value="04:00:00">04:00 PM</asp:ListItem>
                               <asp:ListItem Value="04:30:00">04:30 PM</asp:ListItem>
                               <asp:ListItem Value="05:00:00">05:00 PM</asp:ListItem>
                              --%>
                                      </asp:DropDownList>
						    </p>
                              <p>
						          &nbsp;</p>
                              <p>
						          <asp:Label ID="lblreceipt" runat="server" ForeColor="#0033CC"></asp:Label>
						    </p>
                              
                            
						    <div class="remember">
                               &nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button2_Click" Text="Book" />  <div class="clear"></div>
                                 <p id="P1">
						      <label for="modlgn_username">
                                  <asp:Label ID="lblsms" runat="server" Text="Enter Your Number :"></asp:Label>&nbsp;&nbsp; </label>
                               
&nbsp;<br />
                                     <asp:TextBox ID="txtnumber" runat="server" CssClass="inputbox"></asp:TextBox>
						    </p>
                                
                                <br />
                                <br />
                                <asp:Button ID="btnsms" runat="server" Text="Send" OnClick="btnsms_Click" /> <div class="clear"></div>
							 </div>
						  </fieldset>
						 </form>
					</div>
			    </div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
    

















<%--</asp:DropDownList>
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Button" />
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Button" />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>





        
    </div>
    <br />
    <br />
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>--%--%>
        <%--</asp:DropDownList>
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Button" />
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Button" />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>





        
    </div>
    <br />
    <br />
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>--%--%>





        
    </asp:Content>

