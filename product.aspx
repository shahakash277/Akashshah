<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="product.aspx.cs" Inherits="product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   <link href='fonts/Indian_Rupee_Symbol.sgv' rel='stylesheet' type='text/css'>

     <script type="text/javascript" src="js/jquery.jscrollpane.min.js"></script>
		<script type="text/javascript" id="sourcecode">
		    $(function () {
		        $('.scroll-pane').jScrollPane();
		    });
		</script>
  <style type="text/css">
    .btn_form {
            font-family: 'Exo 2', sans-serif;
            cursor: pointer;
            border: none;
            outline: none;
            display: inline-block;
            font-size: 0.8em;
            padding: 10px 24px;
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                      <ContentTemplate> 
    <div class="main">
        <div class="wrap">
            	<div class="cont span_2_of_3">
		  	
         
                 <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand" DataKeyField="model_id" RepeatColumns="3" RepeatDirection="Horizontal">
                <ItemTemplate>
                     <div class="section group">
                        <div class="cont span_2_of_3">

                    <div class="top-box">
                          <div class="col_1_of_3">
                        <div class="inner_content clearfix">
                            <asp:ImageButton ID="ImageButton1" CssClass="product_image" Height="220" Width="273px" CommandName="addtocart" CommandArgument='<%# Eval("model_id") %>' ImageUrl='<%# Eval("img1")%>'  runat="server" />     
                            </div>
                        <div class="price">
                            <div class="cart-left">
                                <br />
                                &nbsp;<asp:Label ID="pnameLabel" CssClass="title" Width="200px" runat="server" Text='<%# Eval("pname") %>' />
                                <br />
                                <div class="price1">
                                    <span class="actual">&nbsp;<asp:Label ID="priceLabel" runat="server" CssClass="actual" Text='<%# Eval("pprice") %>' />&nbsp;<asp:Image ID="Image1" ImageUrl="~/fonts/Indian_Rupee_Symbol.png" Height="10px" Width="10px" runat="server" />
                                        </div>
						</div>
                                        <%--<asp:ImageButton ID="ImageButton1"  CssClass="cart-right" CommandName="add to cart" CommandArgument='<%# Eval("pid") %>' OnClick="ImageButton1_Click" runat="server" />--%>
                                        <asp:Button ID="Button1" Text="" runat="server" CssClass="cart-right" CommandName="add to cart" CommandArgument='<%# Eval("model_id") %>' />
                            
                             </div>
                        </div>
                    </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>

               </div></div> 
          <div class="rsidebar span_1_of_left">
	
					 <section class="sky-form">
					<h4>Price</h4>
						
							
					    <div class="col col-4">
                                 <asp:TextBox ID="TextBox1" CssClass="inputbox" Width="100px" style="margin-left:40px;margin-top:20px" runat="server"></asp:TextBox> To 
                  <br />      <asp:RegularExpressionValidator ID="RegularExpressionValidator1"  ControlToValidate="TextBox1"  runat="server" ErrorMessage="must be digit" Display="Dynamic" Font-Bold="false" ForeColor="Red" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                   <br />              <asp:TextBox ID="TextBox2" CssClass="inputbox" Width="100px" style="margin-left:40px;margin-top:20px" runat="server"></asp:TextBox> From<br /> 
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator2"  ControlToValidate="TextBox2"  runat="server" ErrorMessage="must be digit" Display="Dynamic" Font-Bold="false" ForeColor="Red" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
               
                              <br />              <asp:Button ID="btnPrice" CssClass="btn_form" style="margin-left:50px;margin-top:10px;margin-bottom:10px" runat="server" Text="Go" OnClick="btnPrice_Click" />
                                     
							</div>

						    
                               </section>
		       <section class="sky-form">
					<h4>Brand Name</h4>
						<div tabindex="0" style="overflow: hidden; padding: 0px; width: 285px;" class="row row1 scroll-pane jspScrollable">
							
							
						<div style="width: 285px; height: 200px;" class="jspContainer">
                            <div style="padding: 20px; width: 238px; top: 0px;" class="jspPane">
                              <div style="overflow-y:auto;width:auto;height:150px">
                                     <asp:CheckBoxList ID="cblBrand" style="height:50px" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cblBrand_SelectedIndexChanged">                                     
                                    </asp:CheckBoxList>
  	     
						</div>  </section>
		       <section class="sky-form">
					<h4>Frame Shape</h4>
						<div tabindex="0" style="overflow: hidden; padding: 0px; width: 285px;" class="row row1 scroll-pane jspScrollable">
							
							
						<div style="width: 285px; height: 200px;" class="jspContainer">
                            <div style="padding: 20px; width: 238px; top: 0px;" class="jspPane">
                              <div style="overflow-y:auto;width:auto;height:150px;">
                                     <asp:CheckBoxList ID="cblshape"  style="height:50px" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cblshape_SelectedIndexChanged">                                     
                                    </asp:CheckBoxList>
  	     
						</div>  </section>
		       <section class="sky-form">
					<h4>Frame Size</h4>
		<div style="overflow-y:auto;width:auto;height:80px">
                            <asp:CheckBoxList ID="cblsize" style="height:50px"  AutoPostBack="True" OnSelectedIndexChanged="cblSize_SelectedIndexChanged" runat="server">
                                <asp:ListItem Value="S">Small</asp:ListItem>
                                <asp:ListItem Value="M">Medium</asp:ListItem>
                                <asp:ListItem Value="L">Large</asp:ListItem>
                            </asp:CheckBoxList>
						</div>
		       </section>
		      
		      
		      
		       <section class="sky-form">
					<h4>Frame Type</h4>
						<div style="overflow: hidden; padding: 0px; width: 285px;" class="row row1 scroll-pane">
						 <div style="overflow-y:auto;width:auto;height:150px;">
                             
                                    <asp:CheckBoxList ID="cblType"  style="height:50px" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cblType_SelectedIndexChanged">
       
                                    </asp:CheckBoxList>
                                   </div>  
							
						<%--<div style="width: 285px; height: 200px;" class="jspContainer">
                            <div style="padding: 20px; top: 0px; left: 0px; width: 245px;" class="jspPane">
                                <div class="col col-4">
								
							</div></div></div>--%></div>
		       </section>
		       
		      </div>
			<div class="clear"></div>
			</div>
		   </div>
		</div>
		<script src="js/jquery.easydropdown.js"></script>
                        
                         </ContentTemplate>
                    </asp:UpdatePanel>      
   
</asp:Content>

