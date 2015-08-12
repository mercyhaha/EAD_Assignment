<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import ="java.sql.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Category Details</title>
 <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico" />
<!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<style>
h3{
	font-size: 3.7em;
	margin=0;
}
#img{
max-width:20px;
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
                        <a href="AdminPage.jsp">Back</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    <div class = "row">
    <div class="container">
     <div class="text-left">
     <h3 class = "col-md-5 col-md-offset-1" style="margin-left: 0; padding-top: 100px;" >Product Image!!!</h3>
     </div>
     </div>
     </div>
 
      <div class="row" style="margin-left: 0; padding-left:0;">
      <div class = "container">	
 	
 	<br>
     </div>
     </div>
     <div class = "container">
<%
try {
    // Step1: Load JDBC Driver
    Class.forName("com.mysql.jdbc.Driver");

   // Step 2: Define Connection URL
   String connURL ="jdbc:mysql://localhost/finalsp_it?user=root&password=root"; 

   // Step 3: Establish connectiron to URL
   Connection conn = DriverManager.getConnection(connURL); 
   

   String sql="Select * from it_product";
	
   PreparedStatement pstmt = conn.prepareStatement(sql);
	
   ResultSet rs = pstmt.executeQuery();
   
   out.println("<br>");
	out.println("<table class='table table-hover'>");
	
	out.println("<tr>");
	out.println("<th class='col-md-1'>"+"Product Name"+"</th>");
	out.println("<th class='col-md-2'>"+"Category ID"+"</th>");
	out.println("<th class='col-md-6'>"+"Image Path"+"</th>");
	out.println("<th class='col-md-2'>"+"Image"+"</th>");
	out.println("<th class='col-md-1'></th>");
	out.println("<th class='col-md-1'></th>");
	
	out.println("</tr>");
	
	while(rs.next()){
		
		int CategoryID =rs.getInt("CategoryID");
		String model = rs.getString("model");
		String imgPath = rs.getString("Img_Path");
		String img=rs.getString("Img_Path");
		
		
		
		out.println("<tr>");
		out.println("<td>"+model+"</td>");
		out.println("<td>"+CategoryID+"</td>");
		out.println("<td>"+imgPath+"</td>");
		out.println("<td><img src='"+img+"'/></td>");

		out.println("</tr>");
	}
	
	out.println("</table>");
	conn.close();
	
}catch(Exception e){

	out.println(e);
	
}


%>
	</div>
    <!-- jQuery Version 1.11.1 -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>


</body>
</html>