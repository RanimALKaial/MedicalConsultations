﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="knn.aspx.cs" Inherits="MedicalConsultation.knn" %>

<!DOCTYPE html>

<html>
<head>
<title>Online KNN Classifier</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-select.css">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Resale Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<!--fonts-->
<link href='//fonts.googleapis.com/css?family=Ubuntu+Condensed' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<!--//fonts-->	
<!-- js -->
<script type="text/javascript" src="js/jquery.min.js"></script>
<!-- js -->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap-select.js"></script>
    <script type="text/javascript" src="//cdn.fusioncharts.com/fusioncharts/latest/fusioncharts.js"></script>
    <script type="text/javascript" src="//cdn.fusioncharts.com/fusioncharts/latest/themes/fusioncharts.theme.fusion.js"></script>


<script>
  $(document).ready(function () {
    var mySelect = $('#first-disabled2');

    $('#special').on('click', function () {
      mySelect.find('option:selected').prop('disabled', true);
      mySelect.selectpicker('refresh');
    });

    $('#special2').on('click', function () {
      mySelect.find('option:disabled').prop('disabled', false);
      mySelect.selectpicker('refresh');
    });

    $('#basic2').selectpicker({
      liveSearch: true,
      maxOptions: 1
    });
  });
</script>
<script type="text/javascript" src="js/jquery.leanModal.min.js"></script>
<link href="css/jquery.uls.css" rel="stylesheet"/>
<link href="css/jquery.uls.grid.css" rel="stylesheet"/>
<link href="css/jquery.uls.lcd.css" rel="stylesheet"/>
<!-- Source -->
<script src="js/jquery.uls.data.js"></script>
<script src="js/jquery.uls.data.utils.js"></script>
<script src="js/jquery.uls.lcd.js"></script>
<script src="js/jquery.uls.languagefilter.js"></script>
<script src="js/jquery.uls.regionfilter.js"></script>
<script src="js/jquery.uls.core.js"></script>
<script>
			$( document ).ready( function() {
				$( '.uls-trigger' ).uls( {
					onSelect : function( language ) {
						var languageName = $.uls.data.getAutonym( language );
						$( '.uls-trigger' ).text( languageName );
					},
					quickList: ['en', 'hi', 'he', 'ml', 'ta', 'fr'] //FIXME
				} );
			} );
		</script>
		<link rel="stylesheet" type="text/css" href="css/easy-responsive-tabs.css " />
    <script src="js/easyResponsiveTabs.js"></script>
</head>
<body>
<div class="header">
		<div class="container">
			
			
		</div>
	</div>
	<div class="banner text-center" style="background-image:url(..\\Patient\\images\\medical-doctor-stethoscope-and-office-sign-web-header.jpg);height: 250px;">
	  <div class="container">    
			<h1 style="color: #5f85c6;">Enter your     <span class="segment-heading">   medical    </span>analysis information </h1>
			<p style="color: #6e7b87;">see the result with KNN Classifier</p>
	  </div>
	</div>
    <br />
    <br />
    <form id="f1" runat="server">



	<div class="submit-ad main-grid-border">
		<div class="container">
			<div>
				<div class="panel-body">

             <div class="form-group">
                            <label  class="col-sm-2 control-label">Your Result</label>
                            <div class="col-sm-4">
<asp:DropDownList ID ="DropDownList3" runat="server" class="form-control">
             <asp:ListItem Text="positive" Value="positive"></asp:ListItem>
             <asp:ListItem Text="negative" Value="negative"></asp:ListItem>
    </asp:DropDownList>                            </div>
                    </div>
                                    <br />
                                <br />

                    <div class="form-group" style="float: right;margin-top: -55px;">
                              
            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                              
        </div>

                    

                    <div class="form-group">
                            <label  class="col-sm-2 control-label">Age</label>
                            <div class="col-sm-4">
          <asp:TextBox ID="t1" runat="server" class="form-control" placeholder="Age" type="text" ></asp:TextBox>
                                

                            </div>
                    </div>
                <br />
                                <br />

  <div class="form-group">
    <label class="col-sm-2 control-label">Chest Pain Type</label>
       <div class="col-sm-4">
<label class="styled-select">
         <asp:DropDownList ID ="d1" runat="server" class="form-control">
             <asp:ListItem Text="Asymptomatic" Value="4"></asp:ListItem>
             <asp:ListItem Text="Typical type angina" Value="2"></asp:ListItem>
             <asp:ListItem Text="Non-angina pain" Value="3"></asp:ListItem>
    </asp:DropDownList>
</label>
       </div>
             </div>
                <br />
                                <br />

                    

                    <div class="form-group">
                            <label class="col-sm-2 control-label">Rest Blood Pressure</label>
                            <div class="col-sm-4">
    <asp:TextBox ID ="t2" runat="server" class="form-control" type="text" placeholder="Rest Blood Pressure"></asp:TextBox>

                            </div>
                     </div>
                                <br />
                                <br />

                    <div class="form-group">
                            <label  class="col-sm-2 control-label">Fasting Blood Sugar</label>
                            <div class="col-sm-4">
    <asp:TextBox ID ="t4" runat="server" class="form-control" placeholder="Fasting Blood Sugar" type="text" ></asp:TextBox>


                            </div>
                    </div>
                                <br />
                                <br />

 <div class="form-group">
                  <label class="col-sm-2 control-label">Resting Electro</label>
       <div class="col-sm-4">
<label class="styled-select">
  
         <asp:DropDownList ID ="DropDownList1" runat="server" class="form-control">
             <asp:ListItem Text="Normal" Value="1"></asp:ListItem>
             <asp:ListItem Text=" Left ventricular hypertrophy" Value="2"></asp:ListItem>
             <asp:ListItem Text="ST-T wave abnormality" Value="3"></asp:ListItem>
    </asp:DropDownList>
</label>
       </div>
          </div>
                <br />
                                <br />
                    <br />


                    <div class="form-group">
                            <label  class="col-sm-2 control-label">Max Heart Rate</label>
                            <div class="col-sm-4">
    <asp:TextBox ID="t3" runat="server" class="form-control" placeholder="Max Heart Rate" type="text" ></asp:TextBox>
                                
                            </div>
                    </div>
                                <br />
                                <br />

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Exercise Angina</label>
                            <div class="col-sm-4">

<label class="styled-select">
         <asp:DropDownList ID ="DropDownList2" runat="server" class="form-control">
             <asp:ListItem Text="Yes" Value="2"></asp:ListItem>
             <asp:ListItem Text="No" Value="1"></asp:ListItem>
    </asp:DropDownList>
</label>

 </div>
                    </div>
                                <br />
                                <br />

                            


                    <div class="form-group">
                            <div class="col-md-10">
                        <asp:Button  ID="b2" runat="server" class="btn" Text="Classify" OnClick="b2_Click" style="margin-left: 21%;width: 100px;background-color: #5f85c6;color: white;"/>
    <asp:Label ID ="l1" runat ="server" ForeColor="#064686" Text="" style="font-size: 16px;font-weight: bold;"></asp:Label>

                            </div>
                    </div>
                                <br />
                                <br />
                    <div class="form-group">
                            <div class="col-md-10">
                        <asp:Button  ID="Button1" runat="server" class="btn" Text="Show Rate" OnClick="Button1_Click" style="margin-left: 21%;width: 100px;background-color: #5fad6d;color: white;"/>
    <asp:Label ID ="Label1" runat ="server" Text="" style="color:#064686;font-size: 16px;font-weight: bold;"></asp:Label>

                            </div>
                    </div>
                      <br />
                                <br />
                    <div class="form-group">
                            <div class="col-md-10">
                        <asp:Button  ID="Button2" runat="server" class="btn" Text="Send As Counseling " OnClick="Button2_Click" style="margin-left: 21%;width: 100px;background-color: #f25858;color: white;width: 150px;"/>
    <asp:Label ID ="Label2" runat ="server" Text="" style="color:#064686;font-size: 16px;font-weight: bold;"></asp:Label>

                            </div>
                    </div>
            </div>

					</div>
			</div>
		</div>	
	
        </form>
</body>
</html>

