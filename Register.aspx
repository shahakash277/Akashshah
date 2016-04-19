<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="login">
     <div class="wrap">
	    <ul class="breadcrumb breadcrumb__t"><a class="home" href="#">Home</a>  / Register</ul>
         </div>
                               </div>
    				<div class="col_1_of_login span_1_of_login">
				<div class="login-title">
	           		<h4 class="title">
                         
                           &nbsp;Register</h4>
					<div id="loginbox" class="loginbox">
						<form action="" method="post" name="login" id="login-form">
						  <fieldset class="input">
						    <p id="login-form-username">
						      <label for="modlgn_username">First Name*</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:TextBox ID="txtfname" runat="server" Width="208px" CssClass="inputbox"></asp:TextBox>
						    </p>
                              <p>
                                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                  <asp:RequiredFieldValidator ID="rvfname" runat="server" ErrorMessage="First Name Cannot Be Empty.." ControlToValidate="txtfname" Display="Dynamic" Font-Bold="False" ForeColor="Red"></asp:RequiredFieldValidator>&nbsp;</p>
						    <p id="login-form-password">
						      <label for="modlgn_passwd">Last Name*</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:TextBox ID="txtlname" runat="server" Width="208px" CssClass="inputbox"></asp:TextBox>
						    </p>
                              <p>
						          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						          <asp:RequiredFieldValidator ID="rvlname" runat="server" ErrorMessage="Last Name Cannot Be Empty.." ControlToValidate="txtlname" Display="Dynamic" Font-Bold="False" ForeColor="Red"></asp:RequiredFieldValidator>&nbsp;</p>
                              <p id="P1">
						      <label for="modlgn_passwd">&nbsp;&nbsp;&nbsp;&nbsp; Gender</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                  <asp:RadioButton ID="rbmale" runat="server" GroupName="gender" Text="Male" CssClass="inputbox" Checked="True"/>
                                  <asp:RadioButton ID="rbfemale" runat="server" GroupName="gender" Text="Female" CssClass="inputbox"/>
						    </p>
                              <p>
						          &nbsp;</p>
                              <p id="P2">
						      <label for="modlgn_passwd">&nbsp;&nbsp;&nbsp; Address</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                  <asp:TextBox ID="txtadd" runat="server" Height="50px" TextMode="MultiLine" Width="208px" CssClass="inputbox"></asp:TextBox></a>
						    </p>
                           <p id="P10">
						      <label for="modlgn_passwd">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; State*</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:TextBox ID="txtstate" runat="server" Width="208px" CssClass="inputbox" Text="Gujarat" Enabled="false"></asp:TextBox>
						    </p>
                              <p>
						          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="state Should Not Be Black.." ControlToValidate="txtstate" Display="Dynamic" Font-Bold="False" ForeColor="Red"></asp:RequiredFieldValidator>&nbsp;</p>
                               <p id="P11">
						      <label for="modlgn_passwd">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; City*</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp;
                                   <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataCity" DataTextField="city" DataValueField="id" Width="200px" Height="30px" CssClass="frm-field required">
                                   </asp:DropDownList>
                                   <asp:SqlDataSource ID="SqlDataCity" runat="server"  ConnectionString="<%$ ConnectionStrings:dbmslink %>" SelectCommand="SELECT * FROM [tbl_city]"></asp:SqlDataSource>
						    </p><br />
                           <p id="P3">
                             
						      <label for="modlgn_passwd">&nbsp;&nbsp; Zip Code*</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:TextBox ID="txtzip" runat="server" Width="208px" CssClass="inputbox"></asp:TextBox>
                               <p>
						          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						          <asp:RequiredFieldValidator ID="rvzip" runat="server" ErrorMessage="ZipCode Should Not Be Black.." ControlToValidate="txtzip" Display="Dynamic" Font-Bold="False" ForeColor="Red"></asp:RequiredFieldValidator>&nbsp;</p>
                              <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="zip must be a six digit" ControlToValidate="txtzip"  Font-Bold="False" ForeColor="Red" Display="Dynamic" ValidationExpression="[0-9][0-9][0-9][0-9][0-9][0-9]"></asp:RegularExpressionValidator> </p>
                             
                                <p id="P4">
						      <label for="modlgn_passwd">&nbsp; Mobile No*</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:TextBox ID="txtmobile" runat="server" Width="208px" CssClass="inputbox" TextMode="Number"></asp:TextBox>
						    </p>
                              <p>
						          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						          <asp:RegularExpressionValidator ID="remobile" runat="server" ErrorMessage="Number Is Invalid.." ValidationExpression="[0-9]{10}" ControlToValidate="txtmobile" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                              </p>
                              <p>
						          &nbsp;</p>
                              <p>
						          &nbsp;</p>

                              <h4 class="title">Login Info</h4>
					<div id="Div1" class="loginbox">
						      </div>
						<form action="" method="post" name="login" id="Form1">
						  <fieldset class="input">
						    <p id="P5">
						        <label for="modlgn_username">Username*</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
                              <p>
						          <asp:TextBox ID="txtusername" runat="server" Width="208px" CssClass="inputbox"></asp:TextBox>
						    </p>
                              <p>
						          <asp:RequiredFieldValidator ID="rvusername" runat="server" ErrorMessage="Please Enter Username.." ControlToValidate="txtusername" Display="Dynamic" Font-Bold="False" ForeColor="Red"></asp:RequiredFieldValidator>&nbsp;</p>

                            <p id="P6">
						      <label for="modlgn_username">Password*</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
                              <p>
						          <asp:TextBox ID="txtpassword" runat="server" Width="208px" CssClass="inputbox" TextMode="Password"></asp:TextBox>
						    </p>
                              <p>
						          <asp:RequiredFieldValidator ID="rvpassword" runat="server" ErrorMessage="Please Enter Password.." ControlToValidate="txtpassword" Display="Dynamic" Font-Bold="False" ForeColor="Red"></asp:RequiredFieldValidator>&nbsp;</p>

                              <p id="P7">
						      <label for="modlgn_username">Confirm Password*</label>
                                </p>
                              <p>
                                <asp:TextBox ID="txtconfirmpass" runat="server" Width="208px" CssClass="inputbox" TextMode="Password"></asp:TextBox>
						    </p>
                              <p>
						          <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtconfirmpass" ControlToValidate="txtpassword" ErrorMessage="Password Must Be Same.." ForeColor="Red"></asp:CompareValidator>
                              </p>

                              <p id="P8">
						      <label for="modlgn_username">Security Question*</label>
                                </p>
                              <p>
                                  <asp:DropDownList ID="ddsecurityque" runat="server" Width="208px" CssClass="inputbox" DataSourceID="SqlDataSource1" DataTextField="sname" DataValueField="sid">
                                      <asp:ListItem>Your Birth Place ?</asp:ListItem>
                                      <asp:ListItem>What Is Fav Sport?</asp:ListItem>
                                      <asp:ListItem>Childhood Pet Name ?</asp:ListItem>
                                  </asp:DropDownList>
						          <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbmslink %>" SelectCommand="SELECT * FROM [tbl_security]"></asp:SqlDataSource>
						    </p>
                              <p>
						          &nbsp;</p>

                              <p id="P9">
						      <label for="modlgn_username">Secutiry Answer*        &nbsp;&nbsp;&nbsp;
                                						    
						      </label>
						    </p>
                              <p>
						          <label for="modlgn_username">
                                <asp:TextBox ID="txtsecurityans" runat="server" Width="208px" CssClass="inputbox"></asp:TextBox>

						      </label>
						    <asp:Button ID="btnsubmit" runat="server" Text="Submit" CssClass="remember" OnClick="btnsubmit_Click"/>&nbsp;</p>
                              <p>
						          <asp:RequiredFieldValidator ID="rvsecurityans" runat="server" ControlToValidate="txtsecurityans" ErrorMessage="Security Answer Is Required.." ForeColor="Red"></asp:RequiredFieldValidator>
                              </p>
                                  
						  </fieldset>
						 </form>
					</div>
			    </div>
				</div>
</asp:Content>

