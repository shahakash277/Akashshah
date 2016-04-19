<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="login">
          	<div class="wrap">
				<div class="col_1_of_login span_1_of_login">
					<h4 class="title">New Customers</h4>
					<p>Get our best serivces by signing up on our websites.Your informations will be keept same in our websites.To Get services like Eye checkup Booking and buy our best products online.You cannot place order or you cannot book without siging up to our website </p>
					<div class="button1">
					   <a href="register.aspx">
                           <asp:Button ID="Button2" runat="server" Text="Create Account" OnClick="Button2_Click" CausesValidation="False" /></a>
					 </div>
					 <div class="clear"></div>
				</div>
				<div class="col_1_of_login span_1_of_login">
				<div class="login-title">
	           		<h4 class="title">Registered Customers</h4>
					<div id="loginbox" class="loginbox">
						
						    <p id="login-form-username">
						      <label for="modlgn_username">Username :</label> <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Username Cannot Be Empty" ControlToValidate="txtusername" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtusername" runat="server" Width="569px" Height="20px"></asp:TextBox>
						    </p>
						    <p id="login-form-password">
						      <label for="modlgn_passwd">Password :</label><asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Username Or Password Is Wrong" ControlToValidate="txtpassword" ValidateEmptyText="True" ForeColor="Red" OnServerValidate="CustomValidator1_ServerValidate" Display="Dynamic"></asp:CustomValidator><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="You Must Enter Password" ControlToValidate="txtpassword" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
						      <asp:TextBox ID="txtpassword" runat="server" Width="569px" Height="20px" TextMode="Password"></asp:TextBox>
						    </p>
						    <div class="remember">
							    <p id="login-form-remember">
							      <label for="modlgn_remember"><a href="#">
                                      <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/forget_password.aspx" Font-Underline="True" ForeColor="Blue">Forget Your Password ?</asp:HyperLink></a></label>
							   </p>
                                <div class="button1">
                                <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" /><div class="clear"></div>
							 </div>
                                </div>
						
					</div>
			    </div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
</asp:Content>

