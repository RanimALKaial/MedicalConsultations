<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MedicaltopicsDetails.aspx.cs" Inherits="MedicalConsultation.Patient.MedicaltopicsDetails" %>

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
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">

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
                    <h2 dir="rtl" >‰Ÿ«„ «·«” ‘«—«  «·ÿ»Ì…</h2>
            </div>

            <div class="col-md-2 ">
                <ul class="nav nav-pills ">
                    <li class="dropdown dmenu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Ê«ÃÂ… «·„—Ì÷ <span class="caret"></span></a>
                            <ul class="dropdown-menu ">
                                 <li><a href="Login.aspx"> ”ÃÌ· «·Œ—ÊÃ</a></li>
                            </ul>
                     </li>
                </ul>
            </div>
        </div>
  <!--- Header Ends --------->
       
        <div class="row">
    
        <!----- Menu Area Start ------>
        <div class="col-md-2 menucontent">
          
            <a href="#"><h1>·ÊÕ… «·«Œ Ì«—</h1></a>
                
                <ul class="nav nav-pills nav-stacked">
                  <li role="presentation"><a href="PatientHome.aspx">ﬁ«∆„… «·«” ‘«—« </a></li>
                  <li role="presentation"><a href="AddCounseling.aspx">≈÷«›… «” ‘«—…</a></li>
                  <li role="presentation"><a href="Medicaltopics.aspx">«·„Ê«÷Ì⁄ «·ÿ»Ì…</a></li>
                  <li role="presentation"><a href="../DataMinningPage.aspx">«· Õﬁﬁ »«” Œœ«„ ŒÊ«—“„Ì… »«Ì”</a></li>
                  <li role="presentation"><a href="../Knn.aspx">«· Õﬁﬁ »«” Œœ«„ ŒÊ«—“„Ì… «·Ã«— «·√ﬁ—»</a></li>
                </ul>
        </div>
        <!---- Menu Ares Ends  -------->
        
<!-------   Content Area start  --------->
<div class="col-md-10 maincontent" >

    <!-----------  Content Menu Tab Start   ------------>
    <div class="panel panel-default contentinside">
        <div class="panel-heading" dir="rtl">«·„Ê«÷Ì⁄ «·ÿ»Ì…</div>

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
                           <form  id="f2" runat="server"  >
                               <div id="doctorlist" class="switchgroup">
                                   <asp:Label ID="l3" runat="server" Text="" style="font-size: 30px;"></asp:Label>
                                   <br />
                                                                      <br />

                               <asp:Image ID="img" runat="server" style="height:238px; width:958.5px" />
                                   <br />
                                                                      <br />

                                   <asp:Label ID="l1" runat="server" Text=""></asp:Label>
                                   <asp:Label ID="l2" runat="server" Text="" style="float: right;"></asp:Label>
                                   <br />
            <asp:Repeater ID="rbr" runat="server">
                <HeaderTemplate>
                     <br />
                     <br />
                    </HeaderTemplate>
                <ItemTemplate>
    <embed src="../Doctor/images/<%#Eval("description") %>" width="100%" height="1000"/>
                                    </ItemTemplate>
                <FooterTemplate>
                </FooterTemplate>
            </asp:Repeater>
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


