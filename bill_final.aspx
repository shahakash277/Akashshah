<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="bill_final.aspx.cs" Inherits="dill_final" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" ToolPanelView="None" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbmslink %>" SelectCommand="SELECT tbl_user.user_email, tbl_user.fname, tbl_user.lname, tbl_user.address, tbl_user.state, tbl_user.pincode, tbl_user.mobileno, tbl_order.order_date, tbl_order.total_amount, tbl_order_items.qty, tbl_order_items.total_price, tbl_order_items.model_id, tbl_product.pname, tbl_product.pprice, tbl_city.city FROM tbl_user INNER JOIN tbl_order ON tbl_user.user_email = tbl_order.user_email INNER JOIN tbl_order_items ON tbl_order.order_id = tbl_order_items.order_id INNER JOIN tbl_product ON tbl_order_items.model_id = tbl_product.model_id INNER JOIN tbl_city ON tbl_user.city = tbl_city.Id"></asp:SqlDataSource>
</asp:Content>

