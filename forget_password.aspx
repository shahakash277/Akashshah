<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="forget_password.aspx.cs" Inherits="forget_password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="login">
        <div class="col_1_of_login span_1_of_login">
            <div class="login-title">
                <h4 class="title">Forget Password</h4>
                <div id="loginbox" class="loginbox">

                    <p id="login-form-username">
                        <label for="modlgn_username">
                            <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label></label>
                    </p>

                    <asp:TextBox ID="txtusername" runat="server" Height="21px" Width="531px" Style="margin-top: 0px"></asp:TextBox><asp:TextBox ID="txtpassword" runat="server" Height="21px" Width="531px" Style="margin-top: 0px" TextMode="Password"></asp:TextBox>

                    <p>
                        &nbsp;</p>
                    <p id="login-form-password">
                        <label for="modlgn_passwd">
                            <asp:Label ID="Label2" runat="server" Text="Security Question :"></asp:Label>
                            <asp:Label ID="lblquestion" runat="server"></asp:Label></label>
                        <asp:TextBox ID="txtsecurity" runat="server" Height="21px" Width="531px"></asp:TextBox><asp:TextBox ID="txtconfirm" runat="server" Height="21px" Width="531px" TextMode="Password"></asp:TextBox>
                    </p>
                    <p>
                        <asp:RequiredFieldValidator ID="rvsecurity" runat="server" ErrorMessage="RequiredFieldValidator" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator><asp:RequiredFieldValidator ID="rvusername" runat="server" ErrorMessage="Username is Require.." ControlToValidate="txtusername" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator><asp:CustomValidator ID="cvvalid" runat="server" ErrorMessage="CustomValidator" OnServerValidate="cvvalid_ServerValidate" Display="Dynamic" ForeColor="Red"></asp:CustomValidator>
                        
                        
                    </p>
                    <div class="remember">
                        <p id="login-form-remember">
                            <label for="modlgn_remember"><a href="#"></a></label>
                        </p>
                        <div class="button1">
                            <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" /><div class="clear"></div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div class="clear"></div>
    </div>
	

</asp:Content>

