<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta http-equiv="refresh" content="ProductDetail.jsp" />
</head>
<body>


	<%

try {
    // Step1: Load JDBC Driver
    Class.forName("com.mysql.jdbc.Driver");

   // Step 2: Define Connection URL
   String connURL ="jdbc:mysql://localhost/finalsp_it?user=root&password=root"; 

   // Step 3: Establish connection to URL
   Connection conn = DriverManager.getConnection(connURL); 

   String Table = request.getParameter("hiddenTable");
	
   if(Table.equals("it_product")){

	   String ProductID = request.getParameter("hiddenID");
	   String Category = request.getParameter("CategoryID");
	   String Brand = request.getParameter("Brand");
	   String Description = request.getParameter("Description");
	   String Specification = request.getParameter("Specification");
	   String Price = request.getParameter("Price");
	   String ImgPath = request.getParameter("ImgPath");
	   String model = request.getParameter("model");
	
	   String sql="UPDATE it_product SET CategoryID=? ,Brand=? ,Short_Description=? ,Specification_Info=? ,Price=? ,Img_Path=? ,model=? WHERE ProductID=?"  ;
	     
	   PreparedStatement pstmt = conn.prepareStatement(sql);
	   
	   pstmt.setInt(1,Integer.parseInt(Category));
	   pstmt.setString(2, Brand);
	   pstmt.setString(3, Description);
	   pstmt.setString(4, Specification);
	   pstmt.setString(5, Price);
	   pstmt.setString(6, ImgPath);
	   pstmt.setString(7, model);
	   pstmt.setInt(8,Integer.parseInt(ProductID));
	   
	   int rec = pstmt.executeUpdate();

	   conn.close();
	   
	   if(rec > 0){
			out.println("Data have been updated!!");
			out.println("<br>");
			out.println("redirecting you back to Product page in 3 second...if fail");
			out.println("<form action='CatProduct.jsp' method='get'>");
			out.println("<input type='submit' value='Go back to Details!' name='Btn'/>");	
			out.println("</form>");
		}else{
			out.println("Data have failed to update");
				
		}
   
		
   }else if( Table.equals("category")){
	   String CategoryID = request.getParameter("hiddenID");
	   String Category = request.getParameter("Category");
	   String CategoryD = request.getParameter("CategoryD");
	   String img = request.getParameter("img");
	   
		
	   String sql="UPDATE category SET CategoryName=? ,CategoryDetail=?, imgpath=? WHERE CategoryID=?"  ;
	     
	   PreparedStatement pstmt = conn.prepareStatement(sql);
	   
	   pstmt.setString(1,Category);	   
	   pstmt.setString(2,CategoryD);
	   pstmt.setString(3,img);
	   pstmt.setInt(4,Integer.parseInt(CategoryID));
	   
	   int rec = pstmt.executeUpdate();
		
	   conn.close();
	   
	   if(rec > 0){
			out.println("Data have been updated!!");
			out.println("<br>");
			out.println("redirecting you back to Product page in 3 second...if fail");
			out.println("<form action='ProductDetail.jsp' method='get'>");
			out.println("<input type='submit' value='Go back to Details!' name='Btn'/>");	
			out.println("</form>");
		}else{
			out.println("Data have failed to update");
				
		}
	   
   }else{
	   //user
   }	
   


  
	
  
}catch(Exception e){

	out.println(e);
	
}


%>
</body>
</html>