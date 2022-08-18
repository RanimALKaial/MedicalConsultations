<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reg_Patient.aspx.cs" Inherits="MedicalConsultation.Patient.reg_Patient" %>

<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Medical Consultations System</title>
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
		 <script src="js/jquery.js"></script>
		
    </head>
    <body style="overflow-x: hidden;">
	
	<div class="container-fluid">
		<!--- Header --------------------------->
		<div class="row navbar-fixed-top">
			<nav class="navbar navbar-default header">
			<div class="container-fluid">
				<div class="navbar-header">
				  <a class="navbar-brand logo" href="#">
					<img alt="Brand" src="images/logo.png">
				  </a>
				  <div class="navbar-text title"><p>Medical Consultations System<p></div>
				</div>
			</div>
			</nav>
		</div>
		<!--- Header Ends Here --------------------------->
		
		<div class="row ">
			<div class="col-md-12">
				<div class="panel panel-default login">
					<div class="panel-heading logintitle">Register</div>
					
					<div class="panel-body">
                                            <form id="f1" runat="server" class="form-horizontal center-block" >
							
								
								<br/>
                                                                <div>
                                                                    
                                                                </div>
								<div class="input-group input-group-lg col-md-12">
                                    <asp:TextBox ID ="t1" runat ="server"  class="form-control" style="height: 35px;"  placeholder="user name" required aria-describedby="sizing-addon1"></asp:TextBox>
								</div>
								
								<br/>
                                               
								<div class="input-group input-group-lg col-md-12">
                                    <asp:TextBox ID="t2" runat="server" type="password" style="height: 35px;" name="password" class="form-control" placeholder="Password" required aria-describedby="sizing-addon1"></asp:TextBox>
								</div>
<br/>
								<div class="input-group input-group-lg col-md-12">
                                    <asp:TextBox ID="t3" runat="server" type="text" style="height: 35px;" class="form-control" placeholder="Full Name" required aria-describedby="sizing-addon1"></asp:TextBox>
								</div>
                                                <br/>
								<div class="input-group input-group-lg col-md-12">
                                    <asp:TextBox ID="t4" runat="server" type="email" style="height: 35px;" class="form-control" placeholder="Email" required aria-describedby="sizing-addon1"></asp:TextBox>
								</div>
                                                <br/>
								<div class="input-group input-group-lg col-md-12">
                                    <asp:TextBox ID="t5" runat="server" type="text" style="height: 35px;" class="form-control" placeholder="Phone" required aria-describedby="sizing-addon1"></asp:TextBox>
								</div>
                                                <br/>
								<div class="input-group input-group-lg col-md-12">
                                    <asp:TextBox ID="t6" runat="server" type="text" style="height: 35px;" class="form-control" placeholder="Age" required aria-describedby="sizing-addon1"></asp:TextBox>
								</div>
<br/> 
								<div class="input-group input-group-lg col-md-9">
                                    <asp:DropDownList ID="d1" runat="server" CssClass="form-control" style="height: 40px;">
                                        <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                                        <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                    </asp:DropDownList>
								</div>



								<br/>
								<div class="col-sm-7 col-sm-offset-2">
                                    <asp:Button ID ="b1" runat="server" type="submit" class="btn btn-primary btn-block btn-lg" Text="Register" OnClick="b1_Click" />
                                    <asp:Label ID="l1" runat="server" Text="" ></asp:Label>
								</div> 
						</form>
					</div>
						
				</div>
			</div>				
		</div>
		
		
		
		
		
		
	
		
	</div>
		 
    <script src="js/bootstrap.min.js"></script>

    </body>
</html>

