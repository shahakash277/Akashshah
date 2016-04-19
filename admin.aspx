<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin.aspx.cs" Inherits="Admin_admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Bootstrap Core CSS -->
    <link href="../Admin/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../Admin/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../Admin/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../Admin/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

</head>
<body>
    <form id="form1" runat="server" role="form">
                 <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
             <asp:View ID="View1" runat="server">
            <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Please Sign In</h3>
                    </div>
                    <div class="panel-body">
                        
                            <fieldset>
                                <div class="form-group">
                                    <asp:TextBox ID="email" CssClass="form-control" runat="server"></asp:TextBox>
                      
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Password" name="password" type="password" id="password" runat="server">
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input name="remember" type="checkbox" value="Remember Me">Remember Me</input>
                                    <br />
                                    <br />
                                    <asp:LinkButton ID="lbForgot" runat="server" OnClick="lbForgot_Click">Forgot Password</asp:LinkButton>
                                    </label>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <!--<a href="index.html" class="btn btn-lg btn-success btn-block">Login</a>-->
                                <asp:Button ID="Button1" runat="server" Text="Login" CssClass="btn btn-lg btn-success btn-block" OnClick="Button1_Click"  />
                            </fieldset>
                        
                    </div>
                </div>
            </div>
        </div>
                
           
    </div> 

             </asp:View>
                     <asp:View ID="View2" runat="server">
                         <asp:MultiView ID="MultiView2" runat="server" ActiveViewIndex="0">
                             <asp:View ID="View3" runat="server">
                             <div class="container">
                                    <div class="row">
                                        <div class="col-md-4 col-md-offset-4">
                                           <div class="login-panel panel panel-default">
                                                <div class="panel-heading">
                                                        <h3 class="panel-title">Forgot Password</h3>
                                                </div>
                                            <div class="panel-body">
                                                    Enter Email ID <asp:TextBox ID="txtId" CssClass="form-control" runat="server"></asp:TextBox><br />
                                                    <asp:Button ID="btnOk" runat="server" Text="Ok" OnClick="Button2_Click" />
                                                </div>
                                               </div>
                                            </div>
                                        </div>
                                 </div>
                              </asp:View>
                        <asp:View ID="View4" runat="server" OnActivate="View4_Activate">
                               <div class="row">
                                        <div class="col-md-4 col-md-offset-4">
                                           <div class="login-panel panel panel-default">
                                                <div class="panel-heading">
                                                        <h3 class="panel-title">Forgot Password</h3>
                                                </div>
                                            <div class="panel-body">
                        Sequrity Que <asp:TextBox ID="txtQue" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox><br />
                        Security Ans <asp:TextBox ID="txtAns" CssClass="form-control" runat="server"></asp:TextBox><br />
                                                <asp:Button ID="btnCheck" runat="server" Text="Check" OnClick="Button3_Click" />
                           
                        </div>
                    </div>
                </div>
            </div>
                             </asp:View>

                                  </asp:MultiView>
                     </asp:View>
                    
                       </asp:MultiView>

    <!-- jQuery -->
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

    </form>
</body>
</html>
