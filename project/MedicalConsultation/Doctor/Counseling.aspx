<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Counseling.aspx.cs" Inherits="MedicalConsultation.Doctor.Counseling" %>

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
        <div class="panel-heading">Counseling List</div>

      <style>
.thub {
  border: 1px solid #ddd; /* Gray border */
  border-radius: 4px;  /* Rounded border */
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
                            <asp:LinkButton ID="l1" runat="server" class="btn btn-primary" OnClick="l1_Click" Text="Show All"></asp:LinkButton>
                            <asp:LinkButton ID="l2" runat="server" class="btn btn-danger" OnClick="l2_Click" Text="Show Null Replay"></asp:LinkButton>
                               <br />
                               <br />
 <asp:Repeater ID="rbr" runat="server">
                <HeaderTemplate>
      <div id="doctorlist" class="switchgroup">
                   <table class="table table-bordered table-hover">
                   <tr class="active">
                           <td>ID</td>
                           <td>Name</td>
                           <td>Age</td>
                           <td>Gender</td>
                           <td>Disease Date</td>
                           <td>Counseling</td>
                           <td>Counseling Date</td>
                           <td>Attachments</td>
                           <td>replay</td>

                   </tr>
                          </HeaderTemplate>
                          <ItemTemplate>
                   <tr>
                           <td><%#Eval("id") %></td>
                           <td><%#Eval("name") %></td>
                           <td><%#Eval("age") %></td>
                           <td><%#Eval("gender") %></td>
                           <td><%#Eval("disease_date") %></td>
                           <td><%#Eval("Counseling") %> <a href="replay.aspx?id=<%#Eval("id") %>">Read more</a></td>
                           <td><%#Eval("Counseling_date") %></td>
                           <td><img src="../Patient/images/<%#Eval("image_path") %>" style="width:100px;height:100px"></td>
                           <td><%#Eval("replay") %></td>
                           
                           <td>
                            <a  href="replay.aspx?id=<%#Eval("id") %>" class="btn btn-primary" ><span class="glyphicon glyphicon-share-alt" aria-hidden="true"></span></a>
                           
						   </td>
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
