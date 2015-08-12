<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import ="java.sql.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Create Page</title>
	 
	  <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico" />
	
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<style>

table {
    border-collapse: collapse;
}

td {
    padding-top: .5em;
    padding-bottom: .5em;
}

h1{
	padding-top: 100px;
}


</style>
<body>

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
                <a class="navbar-brand" href="AdminPage.jsp">SP IT</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="CategoryDetail.jsp">Back</a>
                    </li>
                    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    <!-- Page Content -->
    <div class="container">
   
    <h3>
<%
String Table = request.getParameter("hiddenTable");
if(Table.equals("it_product")){	
		out.println("<form action='processCreate.jsp' methord='get'>");
	   		
		out.println(" <h1>Create Product</h1>");
		
		out.println("<table class='form-group'>");
		
		out.println("<tr>");
		out.println("<td  class='col-md-1'>"+"Name"+":"+"</td>");
		out.println("<td>"+"<input type='text'  class='form-control col-md-offset-1' name='model' placeholder='Model' />"+"</td>");
		out.println("</tr>");
		
		out.println("<tr>");
		out.println("<td class='col-md-1'>"+"CategoryID"+":"+"</td>");
		out.println("<td>"+"<input type='text' name='Category' class='form-control col-md-offset-1' placeholder='Category ID'/>"+"</td>");
		out.println("</tr>");
	
		out.println("<tr>");
		out.println("<td class='col-md-1'>"+"Brand"+":"+"</td>");
		out.println("<td><input type='text' name='Brand' class='form-control col-md-offset-1' placeholder='Brand'/></td>");
		out.println("</tr>");
		
		out.println("<tr>");
		out.println("<td>"+"Description"+":"+"</td>");
		out.println("<td><textarea name='Description' rows='5' class='form-control col-md-offset-1' placeholder='Description'/></textarea></td>");
		out.println("</tr>");
		
		out.println("<tr>");
		out.println("<td class='col-md-1'>"+"Specification"+":"+"</td>");
		out.println("<td><textarea name='Specification' rows='5' class='form-control col-md-offset-1' placeholder='Specification'/></textarea></td>");
		out.println("</tr>");
		
		out.println("<tr>");
		out.println("<td class='col-md-1'>"+"Price"+":");
		out.println("<td><input type='text' name='Price' class='form-control col-md-offset-1'/></td>");
		out.println("</tr>");
		
		out.println("<tr>");
		out.println("<td class='col-md-1'>"+"ImgPath"+":"+"</td>");
		out.println("<td><input type='text' name='ImgPath' class='form-control col-md-offset-1'/></td>");
		out.println("</tr>");
		
		out.println("<tr>");
		out.println("<td>");
		out.println("<input type='reset' value='reset' class='btn btn-lg btn-danger'/>");
		out.println("</td>");
		out.println("<td>");
		out.println("<input type='hidden' name='hiddenTable' value='it_product'/>");
		out.println("<input type='submit' value='Create Product!' class='col-md-3 btn btn-lg btn-success' name='createBtn'/>");
		out.println("</td>");
		
		out.println("</tr>");
		out.println("</table>");
		out.println("</form>");

}else if( Table.equals("category")){
	out.println("<form action='processCreate.jsp' methord='get'>");
    	
	out.println(" <h1>Create Category</h1>");
	
	out.println("<table class='form-group'>");
	
	out.println("<tr>");
	out.println("<td class='col-md-1'>"+"Category"+":"+"</td>");
	out.println("<td><input type='text' name='Category' placeholder='Category Name' class='form-control col-md-offset-1'/></td>");
	out.println("</tr>");
	
	out.println("<tr>");
	out.println("<td class='col-md-1'>"+"Category Details"+":"+"</td>");
	out.println("<td><textarea name='CategoryD' rows='3' placeholder='Category Details' class='form-control col-md-offset-1'/></textarea></td>");
	out.println("</tr>");
	
	out.println("<tr>");
	out.println("<td class='col-md-1'>"+"Img Path"+":"+"</td>");
	out.println("<td><input type='text' name='img' placeholder='Home Image' class='form-control col-md-offset-1'/></td>");
	out.println("</tr>");
	
	out.println("<tr>");
	out.println("<td>");
	out.println("<input type='reset' class='btn btn-lg btn-danger' value='reset'/>");
	out.println("</td>");
	
	
	
	out.println("<td>");
	out.println("<input type='hidden' name='hiddenTable' value='category'/>");
	out.println("<input type='submit' value='Create Product!' name='createBtn' class='col-md-3 btn btn-lg btn-success' name='updateBtn'/>");
	out.println("</td>");

	out.println("</tr>");
	out.println("</table>");
	out.println("</form>");

}else{
//user
}	

%></h3>
	 </div>
    <!-- jQuery Version 1.11.1 -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>


</body>
</html>