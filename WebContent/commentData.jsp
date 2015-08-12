<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.util.*, java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<style>

	h1{
		text-align: center;
		padding-top: 5em;
	}

</style>

<body>

	<%
		try {
			// Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver");

			// Step 2: Define Connection URL
			String connURL = "jdbc:mysql://localhost/sp_it?user=root&password=root";

			// Step 3: Establish connection to URL
			Connection conn = DriverManager.getConnection(connURL);

			String name = request.getParameter("name");
			int rating = Integer.parseInt(request.getParameter("rating"));
			String comment = request.getParameter("text");
			int productid = Integer.parseInt(request.getParameter("hiddenproductid"));
			
// 			out.println(name);
// 			out.println(rating);
// 			out.println(comment);
// 			out.println(productid);
// 			out.println(new java.sql.Date(System.currentTimeMillis()));
			
			

			String sql = "insert into comment(name,rating,comment,date,productid) Values(?,?,?,?,?)";
			String sql2 = "select * from comment";

			PreparedStatement pstmt = conn.prepareStatement(sql);
			PreparedStatement pstmt2=conn.prepareStatement(sql2);
			
			//ResultSet rs=pstmt.executeQuery();
			//ResultSet rs2 = pstmt.executeQuery();

			pstmt.setString(1, name);
			pstmt.setInt(2, rating);
			pstmt.setString(3, comment);
			pstmt.setDate(4, new java.sql.Date(System.currentTimeMillis()));
			pstmt.setInt(5, productid);

			int count = pstmt.executeUpdate();
			
			//out.println("Your comment has been inserted. Please go back & refresh:)!");
			
			conn.close();
			   
			   if(count > 0){
					out.println("<h1>Thank you for commenting! Please go back & refresh to see!</h1>");
				}else{
					out.println("Commenting failed! Please try again!");
						
				}
			
		} catch (Exception e) {
			out.println(e);
		}
	%>

</body>
</html>