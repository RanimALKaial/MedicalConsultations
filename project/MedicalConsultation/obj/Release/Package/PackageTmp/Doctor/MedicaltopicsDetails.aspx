<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MedicaltopicsDetails.aspx.cs" Inherits="MedicalConsultation.Doctor.MedicaltopicsDetails" %>

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
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Doctor <span class="caret"></span></a>
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
                  <li role="presentation"><a href="MedicaltopicsList.aspx">Medical topics</a></li>
                  <li role="presentation"><a href="AddMedicaltopics.aspx">Add Medical topics</a></li>
                  <li role="presentation"><a href="Counseling.aspx">Medical Consultations</a></li>
                </ul>
        </div>
        <!---- Menu Ares Ends  -------->
        
<!-------   Content Area start  --------->
<div class="col-md-10 maincontent" >

    <!-----------  Content Menu Tab Start   ------------>
    <div class="panel panel-default contentinside">
        <div class="panel-heading">Medical topics</div>

      

        <!----------------   Panel Body Start   --------------->
        <div class="panel-body">
              
              <!----------------   Add Department Start   --------------->
               <div>
                   <div class="panel panel-default">
                       <div class="panel-body">
                           <form  id="f2" runat="server"  class="form-horizontal">

 <asp:Repeater ID="rbr" runat="server">
                <HeaderTemplate>
      <div id="doctorlist" class="switchgroup">
                   <table class="table table-bordered table-hover">
                   <tr class="active">
                           
                          
                   </tr>
                          </HeaderTemplate>
                          <ItemTemplate>
                   <tr>
                           <img src="../Doctor/images/<%#Eval("imagepath") %>" style="height:238px; width:958.5px"/> 
                           <td><%#Eval("description") %></td>
                           
						  
                   </tr>
            </ItemTemplate>
                <FooterTemplate>
                  </table>
               </div>
                </FooterTemplate>
            </asp:Repeater>



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
