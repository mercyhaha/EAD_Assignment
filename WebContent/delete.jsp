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
String ID = request.getParameter("hiddenID");
String Table = request.getParameter("hiddenTable");
String IDName = request.getParameter("IDName");

Connection conn = null;
int i = 0;
try {
    // Step1: Load JDBC Driver
    Class.forName("com.mysql.jdbc.Driver");

   // Step 2: Define Connection URL
   String connURL ="jdbc:mysql://localhost/finalsp_it?user=root&password=root"; 

   // Step 3: Establish connection to URL
   conn = DriverManager.getConnection(connURL); 

	if(Table.equals("category")){
		
		   String sql1="Select * from it_product where CategoryID=?";
		   
		   PreparedStatement pstmt1 = conn.prepareStatement(sql1);
		   
		   pstmt1.setInt(1,Integer.parseInt(ID));
		   
		   ResultSet rs = pstmt1.executeQuery();
		
		   if(rs.next()){
			   i=1;
		   }
	}

	if(i==1){
		out.println("Please delete all product in the Category first!!!...");
	
	}else{
	
   String sql="Delete from "+ Table +" WHERE "+IDName+"=?";
   
   PreparedStatement pstmt = conn.prepareStatement(sql);
   
   pstmt.setInt(1,Integer.parseInt(ID));
   
   int rec = pstmt.executeUpdate();
         
   if(rec > 0){
	   out.println("Record have been deleted");
		//response.sendRedirect("ProductDetail.jsp?msg=Record have been deleted");
		out.println("redirecting you back to Product page in 3 second...if fail");
		out.println("<form action='ProductDetail.jsp' method='get'>");
		out.println("<input type='submit' value='Go back to Details!' name='Btn'/>");	
		out.println("</form>");
		response.setHeader("Refresh","1;URL=./ProductDetail.jsp");
	}else{
		out.println("Record have failed to be deleted");
	}
	}
}catch(Exception e){

	out.println(e);
	
}


%>
</body>
</html>