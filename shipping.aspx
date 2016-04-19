<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="shipping.aspx.cs" Inherits="shipping" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style9 {
            width: 108px;
            text-align: right;
        }
        .auto-style10 {
            width: 108px;
            text-align:center;
        }
        .auto-style12 {
            width: 199px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <div class="login">
     <div class="wrap">
	    <ul class="breadcrumb breadcrumb__t"><a class="home" href="#">Home</a>  / Shipping</ul>
         </div>
                               </div>
    				<div class="col_1_of_login span_1_of_login">
				<div class="login-title">
	           		<h4 class="title">
                         
                           &nbsp;Shipping Address</h4>
					<div id="loginbox" class="loginbox">
						<form action="" method="post" name="login" id="login-form">
						  <fieldset class="input">
						    <p id="login-form-username">
						      <label for="modlgn_username">First Name*</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:TextBox ID="txtfname" runat="server" Width="208px" CssClass="inputbox"></asp:TextBox>
						    </p>
                              <p>
                                  
                                  <asp:RequiredFieldValidator ID="rvfname" runat="server" ErrorMessage="First Name Cannot Be Empty.." ControlToValidate="txtfname" Display="Dynamic" Font-Bold="False" ForeColor="Red"></asp:RequiredFieldValidator>&nbsp;</p>
						    <p id="login-form-password">
						      <label for="modlgn_passwd">Last Name*</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:TextBox ID="txtlname" runat="server" Width="208px" CssClass="inputbox"></asp:TextBox>
						    </p>
                              <p>
						          
						          <asp:RequiredFieldValidator ID="rvlname" runat="server" ErrorMessage="Last Name Cannot Be Empty.." ControlToValidate="txtlname" Display="Dynamic" Font-Bold="False" ForeColor="Red"></asp:RequiredFieldValidator>&nbsp;</p>
                              
                              <p id="P2">
						      <label for="modlgn_passwd">&nbsp;&nbsp;&nbsp; Address</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                  <asp:TextBox ID="txtadd" runat="server" Height="50px" TextMode="MultiLine" Width="208px" CssClass="inputbox"></asp:TextBox></a>
						    </p>
                              <p>
						          
						          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Address Is Required.." ControlToValidate="txtadd" Display="Dynamic" Font-Bold="False" ForeColor="Red"></asp:RequiredFieldValidator>&nbsp;</p>
                           <p id="P10">
						      <label for="modlgn_passwd">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; State*</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:TextBox ID="txtstate" runat="server" Width="208px" CssClass="inputbox" Text="Gujarat" Enabled="false"></asp:TextBox>
						    </p>
                              <p>
						          
						          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="state Should Not Be Black.." ControlToValidate="txtstate" Display="Dynamic" Font-Bold="False" ForeColor="Red"></asp:RequiredFieldValidator>&nbsp;</p>
                               <p id="P11">
						      <label for="modlgn_passwd">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; City*</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataCity" DataTextField="city" DataValueField="id" Width="200px" Height="30px" CssClass="frm-field required">
                                   </asp:DropDownList>
                                   <asp:SqlDataSource ID="SqlDataCity" runat="server"  ConnectionString="<%$ ConnectionStrings:dbmslink %>" SelectCommand="SELECT * FROM [tbl_city]"></asp:SqlDataSource>
						       </p>
                              <p>
						          
						              
                              <p id="P3">
						      <label for="modlgn_passwd">&nbsp;&nbsp; Zip Code*</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:TextBox ID="txtzip" runat="server" Width="208px" CssClass="inputbox"></asp:TextBox>
						    </p>
                              <p>
						          
						          <asp:RequiredFieldValidator ID="rvzip" runat="server" ErrorMessage="ZipCode Should Not Be Black.." ControlToValidate="txtzip" Display="Dynamic" Font-Bold="False" ForeColor="Red"></asp:RequiredFieldValidator>&nbsp;</p>
                              <p id="P4">
						      <label for="modlgn_passwd">&nbsp; Mobile No*</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:TextBox ID="txtmobile" runat="server" Width="208px" CssClass="inputbox" TextMode="Number"></asp:TextBox>
						    </p>
                              <p>
						          
						          <asp:RegularExpressionValidator ID="remobile" runat="server" ErrorMessage="Number Is Invalid.." ValidationExpression="[0-9]{10}" ControlToValidate="txtmobile" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                              </p>
						    <asp:Button ID="btnsubmit" runat="server" Text="Submit" CssClass="remember" OnClick="btnsubmit_Click"/>&nbsp;</p>
                              <p>
						          
                              </p>
                                  
						  </fieldset>
						 </form>
					</div>
			    </div>
				</div>
</asp:Content>

