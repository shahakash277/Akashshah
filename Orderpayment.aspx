<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Orderpayment.aspx.cs" Inherits="Orderpayment" %>

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
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <div class="wrap">
            <ul class="breadcrumb breadcrumb__t"><a class="home" href="home.aspx">Home</a>  / Order Payment</ul>
        </div>
    		<div class="col_1_of_login span_1_of_login">
				<div class="login-title">
	           		<h4 class="title">
                         
                           &nbsp;Order Payment</h4>
					<div id="loginbox" class="loginbox">
						
						    <p id="login-form-username">
						      <asp:Label ID="lblbookingdate" runat="server" Text="Booking Date"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              <asp:Label ID="txtbookingdate" runat="server" Text="Label"></asp:Label>

						    </p>
                        <p id="P1">
						      <asp:Label ID="lbltotalprice" runat="server" Text="Total price"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               <asp:Label ID="txttotalprice" runat="server" Text="Label"></asp:Label>
                              </p>
                         <p id="P2">
						       <asp:Label ID="lblpaymenttype" runat="server" Text="Payment Type"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              <asp:DropDownList ID="ddlpaymenttype" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"  CssClass="styled-select" runat="server">
                                  <asp:ListItem>Case On Delivery</asp:ListItem>
                                  <asp:ListItem>Credit Card</asp:ListItem><asp:ListItem>Debit Card</asp:ListItem>
                              </asp:DropDownList>
                              </p>
                          <p id="P3">
						       <asp:Label ID="lblcardno" runat="server" Text="Card Number"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               <asp:TextBox ID="txtcardno" CssClass="inputbox" runat="server"></asp:TextBox>

                          </p>
                          <p id="P5">
						       <asp:Label ID="lblcardname" runat="server" CssClass="inputbox" Text="Name Of Card"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                             <asp:TextBox ID="txtcardname" runat="server" CssClass="inputbox"></asp:TextBox> 
                              </p>
                          <p id="P6">
						       <asp:Label ID="lblexpiry" runat="server" Text="Expiry Date MM/YY"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:TextBox ID="txtmm" CssClass="inputbox" runat="server"></asp:TextBox>/<asp:TextBox ID="txtyy" runat="server"></asp:TextBox>
                                </p>
                          <p id="P7">
						       <asp:Label ID="lblcvv" runat="server" Text="CVV"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                             <asp:TextBox ID="txtcvv" CssClass="inputbox" runat="server"></asp:TextBox>

                          </p>
                        <br />
                         <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click" CssClass="remember" />
                          
            </div></div></div>
            </ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>

