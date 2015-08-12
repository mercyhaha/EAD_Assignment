<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.util.*, java.sql.*, java.text.*"%>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sp IT!</title>
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
</head>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrapjs.min.js" rel="stylesheet">
<link href="css/lightbox.css" rel="stylesheet">

<link rel="stylesheet" href="lightbox/lightbox.css" type="text/css" media="screen" />
<script type="text/javascript" src="lightbox/lightbox.js"></script>

<body>

<style>
	body{
		background: url("simple1.jpg");
	}

.image {
	margin-top: 5em;
}

.model {
/* 	text-align: right; */
	font-size: 3em;
	font-style: italic;
	font-weight: bold;
	margin-top: 1em;
	margin-left: 2em;
	
}

h1 {
	font-size: 3em;
}

/* h2 { */
/* 	font-size: 2em; */
/* 	text-align: left; */
/* 	padding-top: 1em; */
/* } */

/* p { */
/* 	text-align: left; */
/* } */

.container {
	padding-bottom: 3em;
	margin-left: 23em;
}
#position{
	padding-left: 3em;
	
}
#position2{
	padding-left: 2em;
	
}


</style>

<%
		try {

		Class.forName("com.mysql.jdbc.Driver");

		String connURL = "jdbc:mysql://localhost/sp_it?user=root&password=root";

		Connection conn = DriverManager.getConnection(connURL);

		//String sql = "Select * from it_product where CategoryID=?";
		String sql="Select * from it_product where productid = ?"; 

		String productid = request.getParameter("productid");
		//String productidc = request.getParameter("productid");

		PreparedStatement pstmt = conn.prepareStatement(sql);
		//PreparedStatement pstmt2 = conn.prepareStatement(sql2);

		//setting the ?
		pstmt.setString(1, productid);
		//pstmt2.setString(1, productidc);

		ResultSet rs = pstmt.executeQuery();
		//ResultSet rs2 = pstmt2.executeQuery();

		while (rs.next()) {

			int catid = rs.getInt("CategoryID");
			int prodid = rs.getInt("ProductID");
			String brand = rs.getString("Brand");
			String model = rs.getString("model");
			String imgPath = rs.getString("Img_Path");
			double price = rs.getDouble("Price");
			String specs = rs.getString("Specification_Info");
			String description = rs.getString("Short_Description");
			
			out.println("<div id='position'>");
			out.println("<div class='container'>");
			out.println("<div class='row'>");
			out.println("<div class='model'>"+model+"</div>");
			out.println("<div class='image'>");
			out.println("<a href='"+imgPath+"' rel='lightbox' title='"+model+"'><img src='"+imgPath+"'/></a>");
			out.println("</div>");
			out.println("</div>");
			out.println("<div id='position2'>");
			out.println("<div class='col-md-6 text-center'>");
			out.println("<h1>$"+price+"0</h1>");
			out.println("<div class='desc'>");
					out.println("<h2>Description:</h2>");
					out.println("<p>"+description+"</p>");
			out.println("</div>");
			out.println("<div class='specs'>");
					out.println("<h2>Specification:</h2>");
					out.println("<p>"+specs+"</p>");
			out.println("</div>");
			out.println("<div class=comment>");
					out.println("<a href='comments.jsp?productid="+ prodid+ "'class='btn btn-info' role='button'>Comments here!</a>");
			out.println("</div>");
			out.println("</div>");
			out.println("</div>");
			out.println("</div>");
					
		}
		conn.close();

			} catch (Exception e) {

		out.println(e);

			}
	%>


</body>
</html>