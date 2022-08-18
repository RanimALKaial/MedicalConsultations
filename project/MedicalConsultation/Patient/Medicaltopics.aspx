<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Medicaltopics.aspx.cs" Inherits="MedicalConsultation.Patient.Medicaltopics" %>

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
                    <h2 dir="rtl">نظام الاستشارات الطبية</h2>
            </div>

            <div class="col-md-2 ">
                <ul class="nav nav-pills ">
                    <li class="dropdown dmenu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">واجهة المريض <span class="caret"></span></a>
                            <ul class="dropdown-menu ">
                                 <li><a href="Login.aspx">تسجيل الخروج</a></li>
                            </ul>
                     </li>
                </ul>
            </div>
        </div>
  <!--- Header Ends --------->
       
        <div class="row">
    
        <!----- Menu Area Start ------>
        <div class="col-md-2 menucontent">
          
            <a href="#"><h1>لوحة الاختيار</h1></a>
                
                <ul class="nav nav-pills nav-stacked">
                  <li role="presentation"><a href="PatientHome.aspx">قائمة الاستشارات</a></li>
                  <li role="presentation"><a href="AddCounseling.aspx">إضافة استشارة</a></li>
                  <li role="presentation"><a href="Medicaltopics.aspx">المواضيع الطبية</a></li>
                  <li role="presentation"><a href="../DataMinningPage.aspx">التحقق باستخدام خوارزمية بايس</a></li>
                  <li role="presentation"><a href="../Knn.aspx">التحقق باستخدام خوارزمية الجار الأقرب</a></li>

                </ul>
        </div>
        <!---- Menu Ares Ends  -------->
        
<!-------   Content Area start  --------->
<div class="col-md-10 maincontent" >

    <!-----------  Content Menu Tab Start   ------------>
    <div class="panel panel-default contentinside">
        <div class="panel-heading" dir="rtl">المواضيع الطبية</div>

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
                               <asp:Repeater ID="rbr1" runat="server">
                                                   <HeaderTemplate>
      <div id="doctorlist" class="switchgroup">
                   <table class="table table-bordered table-hover">
                   <tr class="active">
                           <td>عنوان الموضوع</td>
                           <td>تاريخ النشر</td>
                           <td>عددالمشاهدات</td>
                           <td>الصورة</td>
                           <td>قراءة المزيد</td>

                   </tr>
                          </HeaderTemplate>

<ItemTemplate>

    <tr>
                           <td><%#Eval("title") %></td>
                           <td><%#Eval("date") %></td>
                           <td><%#Eval("views") %></td>
                           <td><img src="../Doctor/images/<%#Eval("imagepath") %>" style="width:100px; height:100px"  /></td>
                           <td>
                            <a  href="MedicaltopicsDetails.aspx?id=<%#Eval("id") %>" class="btn btn-primary" ><span class="glyphicon glyphicon-share-alt" aria-hidden="true"></span></a>
                           
						   </td>
                   </tr>

    </ItemTemplate>

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

