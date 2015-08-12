<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.util.*, java.sql.*, Model.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Sp IT!</title>
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
</head>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap2.3.2.min.css" rel="stylesheet">
<link href="css/lightbox.css" rel="stylesheet">
<link rel="stylesheet" href="css/demo.css">
	<link rel="stylesheet" href="css/footer-distributed-with-search.css">

<link rel="stylesheet" href="lightbox/lightbox.css" type="text/css" media="screen" />
<script type="text/javascript" src="lightbox/lightbox.js"></script>

<!-- Custom CSS -->
<style>

body{
	background: url("simple1.jpg");
	}

.container1{
 	margin-top: -35em; 
	margin-left: 35em;
	
}
.btn-product{
	width: 100%;
}
#buy{
	width: 100%;

}
.thumbnail{
	margin-top: 9em;
	border: 2px solid grey;
	padding-bottom: 2em;
}
/* #border{ */
/* 	margin-top: 4em; */
/* 	padding-bottom: 3em;	 */
/* } */
#best{
	width: 25%;
	float: right;
/*  	margin-top: 5em;  */
	margin-right: 10em;
	padding-top: 10em;
}
#best1 {
	width: 25%;
	margin-top: 1em;
	margin-left: 8em;
	padding-top: 10em;
}
#position{
	padding-top: 4em;
}
h2, h3{
	text-align: center;
}

</style>



<body>

	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="homePageEdit.jsp">SP IT!</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<!-- <li><a href="homePageEdit.jsp#services">About Us</a></li>-->
				<!-- <li><a href="homePageEdit.jsp#portfolio">Products</a></li>-->
				<% 
				
				
                    User usr= (User)session.getAttribute("result");
            		if(usr!=null){
                    String email =  usr.getEmail();
                    String password =  usr.getPassword();
                    String nickname = usr.getNickname();
                    String dob =usr.getDob();
                    int contact =usr.getContact();
                    String MailAdr= usr.getMaillingaddress();
                    String type = usr.getType();%>
                    <li>
                    <%
                    
                    
                    if(type.equals("member")){ %>
                        <a class="page-scroll" href="updateUser.jsp"><%=usr.getNickname()%></a></li>
                         <li>
                    <form action="Logout" method="post">
    				<input type="submit" value="Logout" />
					</form>
                    </li>
                    <%}else if(type.equals("staff")){%>
                    
                    	<a class="page-scroll" href="AdminPage.jsp">Admin</a>
                    	</li>
                         <li>
                    <form action="Logout" method="post">
    				<input type="submit" value="Logout" />
					</form>
                    </li>
                   <%  }else{}}else {%>
                   <li>
                        <a class="page-scroll" href="Login.jsp">Login</a>
                    </li>
                   <%} %>
                   
			</ul>
		</div>
	</div>
	</nav>
	
	

	<%
		try {

		Class.forName("com.mysql.jdbc.Driver");

		String connURL = "jdbc:mysql://localhost/finalsp_it?user=root&password=root";

		Connection conn = DriverManager.getConnection(connURL);

		String sql = "Select * from it_product where CategoryID=?";
		//String sql2 = "Select count(*) from comment where productid=?";

		String categoryid = request.getParameter("catid");
		//String productidc = request.getParameter("productid");

		PreparedStatement pstmt = conn.prepareStatement(sql);
		//PreparedStatement pstmt2 = conn.prepareStatement(sql2);

		//setting the ?
		pstmt.setString(1, categoryid);
		//pstmt2.setString(1, productidc);

		ResultSet rs = pstmt.executeQuery();
		//ResultSet rs2 = pstmt2.executeQuery();
		%>	
		
<!-- 		<div class="container"> -->
<!--     	<div class="row"> -->
<!--     	<div class="col-md-12">  -->
<!-- 		<div class="col-md-4 col-sm-6"> -->

			<div id="best"><img src="img/best1.png"></div>
			<div id="best1"><img src="img/best1.png"></div>
<!-- 			<div id="border"><img src="img/border.png"></div> -->
			
			<div class="container1">
			<div class="container">
			<div id="portfolio" class="row">
		
		<%

		while (rs.next()) {

			int catid = rs.getInt("CategoryID");
			int productid = rs.getInt("ProductID");
			String brand = rs.getString("Brand");
			String model = rs.getString("model");
			String imgPath = rs.getString("Img_Path");
			double price = rs.getDouble("Price");
			String specs = rs.getString("Specification_Info");
			String description = rs.getString("Short_Description");
			int quantity = rs.getInt("quantity");
			
			
// 			out.println("<div class='container'>");
// 			out.println("<div id='portfolio' class='row'>");
			    
//			out.println("<div class='span5 box'>");

			out.println("<div class='span4 box'>");
			out.println("<div class='thumbnail'>");
			out.println("<a href='productPageDetails.jsp?productid="+productid+"' class='portfolio-link' data-toggle='modal'><img src='"+imgPath+"' class='img-responsive' alt=''></a>");
			
	
// 			out.println("  <p>Nullam sapien massa, aliquam in cursus ut, ullamcorper in tortor. ");
// 			out.println("Aliquam mauris arcu, tristique a lobortis vitae, condimentum feugiat justo.</p>");

			
			out.println("<h2>"+ model +"</h2>");
			
			out.println(" <div class='caption'>");
			out.println("<h3>$"+ price +"0</h3>");
			out.println("</div>");
		

			out.println("<div class='row-fluid'>");
			out.println("  <div class='span6'>");
			out.println(" <a href='comments.jsp?productid="+ productid+ "'class='btn btn-info' role='button'><span class='glyphicon glyphicon-thumbs-up'></span> Comment here!</a>");
			out.println("   </div>");
			out.println("   <div class='span6'>");
// 			out.println("<a href='ObtainProductServlet?productid="+ productid+"' class='btn btn-success btn-product'><span class='glyphicon glyphicon-shopping-cart'></span> Buy</a>");
			
		%>
		
			
			<form action="ObtainProductServlet">
			<input type="hidden" name="productid" value="<%=productid %>"/>
     		<!-- <input type="hidden" name="quantity" value="<%=quantity %>"/>-->
			<input class="btn btn-success" type="submit" value="Buy" id="buy">
			</form>	
		
		
		<%


			out.println("   </div>");
			out.println("  </div>");
			out.println("  </div>");
			out.println("</div>");
			out.println("</div>");
		
		%>
		
		
		</div>	
		</div>
		</div>
		
		<%
					
		}
		conn.close();

			} catch (Exception e) {

		out.println(e);

			}
	%>

	

</body>
	<div id="position">
	 <footer class="footer-distributed">

			<div class="footer-left">

				<p class="footer-links">
					<a href="homePageEdit.jsp">Sp IT!</a>
					·
					<a href="homePageEdit.jsp#services">About Us</a>
					·
					<a href="homePageEdit.jsp#portfolio">Products</a>
					·
					<a href="homePageEdit.jsp#contact">Login</a>
					·
					
				</p>

				<p class="footer-company-name">SP IT! &copy; 2015</p>

			</div>

			<div class="footer-right">

				<form method="get" action="#">
					<input placeholder="Search our website" name="search" />
					<i class="fa fa-search"></i>
				</form>

			</div>

		</footer>
		</div>

</html>