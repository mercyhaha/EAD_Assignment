<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SP Admin</title>
	 <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico" />
	
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <style>
    body {
        padding-top: 70px;
        /* Required padding for .navbar-fixed-top. Remove if using .navbar-static-top. Change if height of navigation changes. */
    }
    </style>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<script>

	
function signUp(){
	
	var txtUserid=document.getElementById("email");
	var uid=txtUserid.value;
	var error=false;
	
	var txtPassword=document.getElementById("password");
	var password=txtPassword.value;
	
	var name=document.getElementById("nickname");
	var nickname =name.value;
	var dateofbirth=document.getElementById("dob");
	var dob=dateofbirth.value;
	var contactno=document.getElementById("contactno");
	var cn=contactno.value;
	var maillingaddr=document.getElementById("mailingaddr");
	var ma=maillingaddr.value;
	
	var errorMsg="";
	
	
	
	if(uid==""){
		//alert("1");		
		errorMsg +="Please enter a Email!";
		//alert("User id is empty!")
		alert(errorMsg);
		var msgDivBox=document.getElementById("msgBox");
		msgDivBox.innerHTML=errorMsg;
		return false;
		
	}
	if(password==""){
			//alert("2");
			errorMsg +="\nPlease enter the Password!";
			//alert("User id is empty!")
			alert(errorMsg);
			var msgDivBox=document.getElementById("msgBox");
			msgDivBox.innerHTML=errorMsg;
			return false;
			
		}
	 if(nickname==""){
		//alert("3");
		errorMsg +="\nPlease enter the Nickname!";
		//alert("User id is empty!")
		alert(errorMsg);
		var msgDivBox=document.getElementById("msgBox");
		msgDivBox.innerHTML=errorMsg;
		return false;
		
	}
	 if(dob==""){
			//alert("3");
			errorMsg +="\nPlease enter the Date of Birth!";
			//alert("User id is empty!")
			alert(errorMsg);
			var msgDivBox=document.getElementById("msgBox");
			msgDivBox.innerHTML=errorMsg;
			return false;
			
		}
	 if(cn==""){
			//alert("3");
			
			errorMsg +="\nPlease enter the Contact Number!";
			//alert("User id is empty!")
			alert(errorMsg);
			var msgDivBox=document.getElementById("msgBox");
			msgDivBox.innerHTML=errorMsg;
			return false;
			
		}
	 if(ma==""){
			//alert("3");
			
			errorMsg +="\nPlease enter the Mailing Address!";
			//alert("User id is empty!")
			alert(errorMsg);
			var msgDivBox=document.getElementById("msgBox");
			msgDivBox.innerHTML=errorMsg;
			return false;
			
		}
	 
		
		
		var emailID =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i; 
		var resultID = emailID.test(uid);
		
		var criteriaPw =/(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$&*]).{8,}/; 
		var resultPw = criteriaPw.test(password);

		var criteriadob = /^\d{4}-\d{2}-\d{2}$/;
		var resultdob = criteriadob.test(dob);
		
		var criteriacn = /^\d{8}/;
		var resultcn = criteriacn.test(cn);
		
		
		if(resultID){
		}else{
			
			errorMsg+="Invalid Email!\n Example@Example.com";
			alert(errorMsg);
			var msgDivBox=document.getElementById("msgBox");
			msgDivBox.innerHTML=errorMsg;
			return false;
		}
		if(resultPw){
		}else{
			
			errorMsg+="Invalid Password!\n Must Contain one lower case,\n one upper case,\n one !@#$%^&* \nand one numeric.\nAt least 8 characters!!!";
			alert(errorMsg);
			var msgDivBox=document.getElementById("msgBox");
			msgDivBox.innerHTML=errorMsg;
			return false;
			}
		if(resultdob){
		}else{
				
			errorMsg+="Invalid Date of Birth\nPlease write in YYYY-MM-DD Format!!";
			alert(errorMsg);
			var msgDivBox=document.getElementById("msgBox");
			msgDivBox.innerHTML=errorMsg;
			return false;
			}
		if(resultcn){
		}else{
			
			errorMsg+="Invalid Contact number 8 digit numeral. ";
			alert(errorMsg);
			var msgDivBox=document.getElementById("msgBox");
			msgDivBox.innerHTML=errorMsg;
			return false;
			}
	
	
	

	
	
	return true;
	
	
	
} 

</script>
    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">SP IT</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <!-- <li>
                        <a href="#">About</a>
                    </li>
                    <li>
                        <a href="#">Services</a>
                    </li>-->
                    <li>
                        <a href="Login.jsp">LOG IN</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Page Content -->
    <div class="container">
   <% String msg=request.getParameter("msg");
          if(msg!=null){
        	  out.print(msg);
          }
        %>
                <div id="msgBox"></div>
	<form action="Signup" method="post" class="form-horizontal" >
	
	<div class="form-group">
	<label for="email" class="col-sm-2 control-label" >Email :</label>	
    <div class="col-sm-8"><input type="text" class="form-control"  name="email" id="email" placeholder=" Example:Email@Email.com ">  	       
    </div>    
	</div>
		
	<div class="form-group" >		
	<label for="Password" class="col-sm-2 control-label">Password :</label>
    <div class="col-sm-4"> <input type="password" class="form-control"  name="password" id="password" placeholder=" Password "></div>
	</div>
	
	<div class="form-group" >
	<label for="email" class="col-sm-2 control-label" >Nickname :</label>	
    <div class="col-sm-4"><input type="text" class="form-control"  name="nickname" id="nickname" placeholder=" Nickname">  
    </div></div>
    
    <div class="form-group" >
	<label for="email" class="col-sm-2 control-label" >Date of birth :</label>	
    <div class="col-sm-2"><input type="text" class="form-control"  name="dob" id="dob" placeholder=" YYYY-MM-DD ">  
    </div></div>
    
    <div class="form-group" >
	<label for="email" class="col-sm-2 control-label" >Contact No :</label>	
    <div class="col-sm-3"><input type="text" class="form-control"  name="contactno" id="contactno" placeholder=" Contact ">  
    </div></div>
    
    <div class="form-group" >
	<label for="email" class="col-sm-2 control-label" >Mailing Address :</label>	
    <div class="col-sm-12"><input type="text" class="form-control"  name="mailingaddr" id="mailingaddr" placeholder=" Address ">  
    </div></div>
    
 
    
    	
		 <div class="form-group" >
		 <input type="submit" name="submit" value="Sign Up" onclick="return signUp()" class="btn btn-success col-sm-1 col-sm-offset-3"/>
		 <input type="reset" name="reset" value="Reset" class="btn btn-danger col-sm-1 col-sm-offset-1">
		</div>
		
			   

		
    </div>
    <!-- /.container -->

    <!-- jQuery Version 1.11.1 -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>
</html>