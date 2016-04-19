<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="feedback.aspx.cs" Inherits="feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .inputbox
        {}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
				<div class="col_1_of_login span_1_of_login">
				<div class="login-title">
	           		<h4 class="title">Give Us Your Feedback</h4>
					<div id="loginbox" class="loginbox">
						<form action="" method="post" name="login" id="login-form">
						  <fieldset class="input">
						    <p id="login-form-username">
						      <label for="modlgn_username">Email&nbsp;&nbsp; </label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtemail" ErrorMessage="Please Enter Email It Help Us Contact Us" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;<asp:TextBox ID="txtemail" runat="server" CssClass="inputbox" TextMode="Email"></asp:TextBox>
						    </p>
						    <p id="login-form-password">
						      <label for="modlgn_passwd">Subject</label>
                                <asp:TextBox ID="txtsubject" runat="server" CssClass="inputbox"></asp:TextBox>
						    </p>
                              
                             <p id="P1">
						      <label for="modlgn_passwd">Content</label>
                                </p>
                              <p>
                                <asp:TextBox ID="txtcontent" runat="server" CssClass="inputbox" Height="118px" TextMode="MultiLine" Width="324px"></asp:TextBox>
						    </p>
						    <div class="remember">
                                <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click" /><div class="clear"></div>
							 </div>
						  </fieldset>
						 </form>
					</div>
			    </div>
				</div>
				<div class="clear"></div>
		
 </asp:Content>

