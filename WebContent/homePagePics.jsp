<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
  <%@page import ="java.sql.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
 
 <body>
 
 <%
	try{
		
		Class.forName("com.mysql.jdbc.Driver");
		
		String connURL ="jdbc:mysql://localhost/sp_it?user=root&password=root"; 
		
		Connection conn =   DriverManager.getConnection(connURL);  		
		
		String sql="Select * from category"; 
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		
		ResultSet rs=pstmt.executeQuery();
		
		while(rs.next()){
			
			String catname=rs.getString("CategoryName");
 			int catid=rs.getInt("CategoryID");
			String imgPath=rs.getString("imgpath");
			String catdetail=rs.getString("CategoryDetail");
			
			out.println("<div class='col-md-4 col-sm-6 portfolio-item'><a href='productPage.jsp?catid="+catid+"' class='portfolio-link' data-toggle='modal'><div class='portfolio-hover'><div class='portfolio-hover-content'><i class='fa fa-plus fa-3x'></i></div></div><img src='"+imgPath+"' class='img-responsive' alt=''></a><div class='portfolio-caption'><h4>"+catname+"</h4> <p class='text-muted'>"+catdetail+"</p></div></div>");
			
		}
		 
		conn.close();
		
	}catch(Exception e){
		
		out.println(e);
		
	}

%> 

</body>
</html>