<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCounseling.aspx.cs" Inherits="MedicalConsultation.Patient.AddCounseling" %>

<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="images/logo.png" rel="icon"/>
        <title>Medical Consultations System</title>
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <script src="js/jquery.js"></script>
        <script type="text/javascript">
                $(document).ready(function()
                {

                        $('#doctorlist').show();
                        $('.doctor li:first-child a').addClass('active');
                        $('.doctor li a').click(function(e){

                                var tabDiv=this.hash;
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
                    <h2 >Medical Consultations System</h2>
            </div>

            <div class="col-md-2 ">
                <ul class="nav nav-pills ">
                    <li class="dropdown dmenu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Patient <span class="caret"></span></a>
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
          
            <a href="#"><h1>Dashboard</h1></a>
                
                <ul class="nav nav-pills nav-stacked">
                  <li role="presentation"><a href="PatientHome.aspx">Counseling List</a></li>
                  <li role="presentation"><a href="AddCounseling.aspx">Add Counseling</a></li>
                  <li role="presentation"><a href="Medicaltopics.aspx">Medical topics</a></li>
                  <li role="presentation"><a href="../DataMinningPage.aspx">Check your heart With Bayes</a></li>
                  <li role="presentation"><a href="../Knn.aspx">Check your heart With Knn</a></li>
                </ul>
        </div>
        <!---- Menu Ares Ends  -------->
        
<!-------   Content Area start  --------->
<div class="col-md-10 maincontent" >

    <!-----------  Content Menu Tab Start   ------------>
    <div class="panel panel-default contentinside">
        <div class="panel-heading">Add Counseling</div>

      

        <!----------------   Panel Body Start   --------------->
        <div class="panel-body">
              
              <!----------------   Add Department Start   --------------->
               <div>
                   <div class="panel panel-default">
                       <div class="panel-body">
                           <form  id="f2" runat="server"  class="form-horizontal">
                               <div class="form-group">
                                <label  class="col-sm-4 control-label">Medical specialty</label>
                                <div class="col-sm-4">
                                    <asp:DropDownList id="drop" runat="server" CssClass="form-control">

                                    </asp:DropDownList>

                                </div>
                             </div>

                            <div class="form-group">
                                <label  class="col-sm-4 control-label">Disease Date</label>
                                <div class="col-sm-4">
                                    <asp:TextBox ID="t1" runat="server" type="date" CssClass="form-control" placeholder="_/__/__" ></asp:TextBox>
                                </div>
                             </div>

                               <div class="form-group">
                                <label class="col-sm-4 control-label">Attachments</label>
                                <div class="col-sm-4">
                                    <asp:FileUpload ID="f1" runat="server" CssClass="form-control" />
                                </div>
                            </div>

                               <div class="form-group">
                                <label  class="col-sm-4 control-label">Counseling</label>
                                <div class="col-sm-4">
                                    <textarea id="t2" runat="server"  class="form-control" style="height: 200px;"></textarea>
                                </div>
                             </div>



                            <div class="form-group">
                                <div class="col-sm-offset-4 col-sm-10">
                                    <asp:Button ID="b1" runat="server" class="btn btn-primary" Text="Add Counseling" OnClick="b1_Click" />
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

