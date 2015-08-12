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

	
function autenticate(){
	
	var txtUserid=document.getElementById("email");
	var uid=txtUserid.value;
	var error=false;
	
	var txtPassword=document.getElementById("password");
	var password=txtPassword.value;
	
	var errorMsg="";
	
	
	
	if(uid==""){
		//alert("1");
		error=true;
		errorMsg +="Please enter the Email!";
		//alert("User id is empty!")
		
		if(password==""){
			//alert("2");
			error=true;
			errorMsg +="\n&  Please enter the Password!";
			//alert("User id is empty!")
			alert(errorMsg);
		}
	}else if(password==""){
		//alert("3");
		error=true;
		errorMsg +="  Please enter the Password!";
		//alert("User id is empty!")
		alert(errorMsg);
		
	}else{
		


		}
	
	

	
	var msgDivBox=document.getElementById("msgBox");
	msgDivBox.innerHTML=errorMsg;
	
	if(error)
		return false;
	else
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
                        <a href="homePageEdit.jsp">Home</a>
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
	<form action="verifyUser" method="get" class="form-horizontal" >
	
	<div class="form-group row">
	<label for="email" class="col-sm-2 control-label" >Email :</label>
	
    <div class="col-sm-6"><input type="text" class="form-control"  name="email" id="email" placeholder=" Example:Email@Email.com ">
      
    		
	
	       
    </div>
    
		</div>
		
		<div class="form-group" >
		
		 	<label for="Password" class="col-sm-2 control-label">Password :</label>
   <div class="col-sm-4"> <input type="password" class="form-control"  name="password" id="password" placeholder=" Password! "></div>
		 </div>
		 <div class="form-group" >
		 <div class="col-sm-offset-1 col-sm-10">
      <div class="checkbox">
        <label>
          <input type="checkbox"> Remember Me!!!
        </label>
      </div>
    </div>
    </div>
    	
		 <div class="form-group" >
		 <input type="submit" name="submit" value="Login" onclick="return autenticate()" class="btn btn-success col-sm-1 col-sm-offset-3"/>
		 <input type="reset" name="reset" value="Reset" class="btn btn-danger col-sm-1 col-sm-offset-1">
		</div>
		
			   
	</form>
             <form action="Signup.jsp" method="post" class="form-horizontal">
		 <input type="submit" name="signup" value="signup"  class="btn btn-lg btn-info col-sm-2 col-sm-offset-10"/>
		</form>
		
    </div>
    <!-- /.container -->

    <!-- jQuery Version 1.11.1 -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>
</html>