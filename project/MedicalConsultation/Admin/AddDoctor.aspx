<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddDoctor.aspx.cs" Inherits="MedicalConsultation.Admin.AddDoctor" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="images/logo.png" rel="icon" />
    <title>Medical Consultations System</title>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <script src="js/jquery.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            $('#doctorlist').show();
            $('.doctor li:first-child a').addClass('active');
            $('.doctor li a').click(function (e) {

                var tabDiv = this.hash;
                $('.doctor li a').removeClass('active');
                $(this).addClass('.active');
                $('.switchgroup').hide();
                $(tabDiv).fadeIn();
                e.preventDefault();

            });


        });
    </script>
</head>
<body style="overflow-x: hidden;">
    <div class="container-fluid">

        <!--- Header Start -------->
        <div class="row header">

            <div class="col-md-10">
                <h2>Medical Consultations System</h2>
            </div>

            <div class="col-md-2 ">
                <ul class="nav nav-pills ">
                    <li class="dropdown dmenu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Admin <span class="caret"></span></a>
                        <ul class="dropdown-menu ">
                            <li><a href="Login.aspx">Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <!--- Header Ends --------->

        <div class="row">

            <!----- Menu Area Start ------>
            <div class="col-md-2 menucontent">

                <a href="#">
                    <h1>Dashboard</h1>
                </a>

                <ul class="nav nav-pills nav-stacked">
                    <li role="presentation"><a href="DoctorList.aspx">Doctor list</a></li>
                    <li role="presentation"><a href="AddDoctor.aspx">Add Doctor</a></li>
                    <li role="presentation"><a href="Medicalspecialty.aspx">Medical Specialty</a></li>
                    <li role="presentation"><a href="AddMedicalSpecialty.aspx">Add Medical Specialty</a></li>
                </ul>
            </div>
            <!---- Menu Ares Ends  -------->

            <!-------   Content Area start  --------->
            <div class="col-md-10 maincontent">

                <!-----------  Content Menu Tab Start   ------------>
                <div class="panel panel-default contentinside">
                    <div class="panel-heading">Add Doctor</div>

                    <style>
                        .thub {
                            border: 1px solid #ddd; /* Gray border */
                            border-radius: 4px; /* Rounded border */
                            padding: 5px; /* Some padding */
                            width: 89px; /* Set a small width */
                        }

                        /* Add a hover effect (blue shadow) */
                        img:hover {
                            box-shadow: 0 0 2px 1px rgba(0, 140, 186, 0.5);
                        }
                    </style>

                    <!----------------   Panel Body Start   --------------->
                    <div class="panel-body">

                        <!----------------   Add Department Start   --------------->
                        <div>
                            <div class="panel panel-default">
                                <div class="panel-body">
                       <form  id="f2" runat="server"  class="form-horizontal">

                            <div class="form-group">
                                <label  class="col-sm-4 control-label">Full Name</label>
                                <div class="col-sm-4">
                                    <asp:TextBox ID="t1" runat="server" type="text" class="form-control"  placeholder="Full Name"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="col-sm-4 control-label">Medical topic</label>
                                <div class="col-sm-4">
                                    <asp:DropDownList ID="d1" runat="server" class="form-control">

                                    </asp:DropDownList>
                                </div>
                             </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">User Name</label>
                                <div class="col-sm-4">
                                    <asp:TextBox ID="t2" runat="server" type="text" class="form-control"  placeholder="User Name"></asp:TextBox>
                                </div>
                            </div>

                           <div class="form-group">
                                <label class="col-sm-4 control-label">Password</label>
                                <div class="col-sm-4">
                                    <asp:TextBox ID="t3" runat="server" type="password" class="form-control"  placeholder="Password"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-offset-4 col-sm-10">
                                    <asp:Button ID="b1" runat="server" class="btn btn-primary" Text="Add Doctor" OnClick="b1_Click" />
                                                <asp:Label ID="l1" runat="server" Text=""></asp:Label>

                                </div>
                            </div>
                        </form>

                                </div>
                            </div>
                        </div>
                        <!----------------   Add Department Ends   --------------->
                    </div>
                    <!----------------   Panel Body Ends   --------------->


                </div>
                <!-----------  Content Menu Tab Ends   ------------>
            </div>
            <!-------   Content Area Ends  --------->
        </div>
        <script src="js/bootstrap.min.js"></script>
</body>
</html>