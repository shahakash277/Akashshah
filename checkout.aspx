<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="checkout.aspx.cs" Inherits="checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
      <link href="css/css/bootstrap-responsive.css" rel="stylesheet" type="text/css" media="all" />
   <link href="css/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" media="all" />
   <link href="css/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
   <link href="css/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
 
  <link href="css/js/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
   <link href="css/js/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
    
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

   <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>--%>
             <asp:GridView ID="GridView1" runat="server"  CssClass="table table-hover table-striped" GridLines="None"  AutoGenerateColumns="False"  OnRowCommand="GridView1_RowCommand">
              <Columns>
                  <asp:TemplateField Visible="False">
                      <HeaderStyle Font-Bold="true" CssClass="breadcrumb breadcrumb__t" />
                      <HeaderTemplate>Product ID</HeaderTemplate>
                       <ItemTemplate>
                           <asp:Label ID="lblProId" runat="server" Text='<%# Eval("model_id") %>'></asp:Label>
                       </ItemTemplate>               
                  </asp:TemplateField>
                <%--  <asp:TemplateField Visible="False">
                      <HeaderTemplate>Offer ID</HeaderTemplate>
                       <ItemTemplate>
                           <asp:Label ID="lblOfferId" runat="server" Text='<%# Eval("") %>'></asp:Label>
                       </ItemTemplate>
                  </asp:TemplateField>--%>
                  <asp:TemplateField>
                   <HeaderTemplate>Product Image</HeaderTemplate>
                          <ItemTemplate>
                           <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("img1") %>' Height="92px" Width="98px" />
                       </ItemTemplate>
                  </asp:TemplateField>
                  <asp:TemplateField>
                       <HeaderTemplate>Name</HeaderTemplate>
                       <ItemTemplate>
                           <asp:Label ID="lblName" runat="server" Text='<%# Eval("pname") %>'></asp:Label>
                       </ItemTemplate>
                  </asp:TemplateField>
                  <asp:TemplateField>
                      <HeaderTemplate>Price(<asp:Image ID="Image1" ImageUrl="~/fonts/Indian_Rupee_Symbol.png" Height="10px" Width="10px" runat="server" />
                   )   </HeaderTemplate>
                       <ItemTemplate>
                           <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("pprice") %>'></asp:Label>
                       </ItemTemplate>
                  </asp:TemplateField>
                  <asp:TemplateField>
                      <HeaderTemplate>Qty</HeaderTemplate>
                       <ItemTemplate>
                        
                         <asp:TextBox ID="txtQty" OnTextChanged="txtQty_TextChanged" runat="server" Text='<%# Eval("qty") %>' Height="16px" Width="22px"></asp:TextBox>
                           <br /> <asp:LinkButton ID="btnSave" CommandName="save" CommandArgument='<%# Eval("model_id") %>' runat="server">Save</asp:LinkButton>
                                 <br />
                                   <asp:Label ID="lblerror" style="color:red;" runat="server" ></asp:Label>  

                      </ItemTemplate>
                  </asp:TemplateField>
                  <asp:TemplateField>
                       <HeaderTemplate>Sub Total(<asp:Image ID="Image1" ImageUrl="~/fonts/Indian_Rupee_Symbol.png" Height="10px" Width="10px" runat="server" />
                      ) </HeaderTemplate>
                       <ItemTemplate>
                           <asp:Label ID="lblSubtotal" runat="server" Text='<%# Eval("sub_total") %>'></asp:Label>
                       </ItemTemplate>
                      <FooterTemplate>
                    
                      </FooterTemplate>
                  </asp:TemplateField>
                  <asp:TemplateField>
                      <ItemTemplate>
                          <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Delete" CommandArgument='<%# Eval("model_id") %>'>Remove</asp:LinkButton>
                      </ItemTemplate>
                  </asp:TemplateField>
              </Columns>
            </asp:GridView>
        <div  class="breadcrumb breadcrumb__t" Style="padding-left:1000px">
           
            &nbsp; <asp:Label ID="lblGt"  runat="server"></asp:Label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnProceed" CssClass="btn_form" runat="server" Text="Proceed" OnClick="brnProceed_Click" />
     
            <br />
           </div>  <br />
            <br />
               <br /><br />

            &nbsp;&nbsp;&nbsp;
    
            
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                         <%--  </ContentTemplate>
                               </asp:UpdatePanel>--%>
</asp:Content>

