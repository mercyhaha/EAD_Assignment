<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import ="java.sql.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Update Page</title>
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

Connection conn = null;
try {
    // Step1: Load JDBC Driver
    Class.forName("com.mysql.jdbc.Driver");

   // Step 2: Define Connection URL
   String connURL ="jdbc:mysql://localhost/sp_it?user=root&password=root"; 

   // Step 3: Establish connection to URL
   conn = DriverManager.getConnection(connURL); 
   
   String Table = request.getParameter("hiddenTable");
   
   if(Table.equals("it_product")){

   String ProductID = request.getParameter("hiddenID");	   
	   
   String sql="Select * from it_product JOIN category ON it_product.CategoryID=category.CategoryID  WHERE ProductID=?";
   
   PreparedStatement pstmt = conn.prepareStatement(sql);
   
   pstmt.setInt(1,Integer.parseInt(ProductID));
   
   ResultSet rs = pstmt.executeQuery();
   
   if(rs.next()){
		
		int CategoryID =rs.getInt("CategoryID");
		String category=rs.getString("CategoryName");
		String brand=rs.getString("Brand");
		String Description=rs.getString("Short_Description");
		String Spec=rs.getString("Specification_Info");
		Double price=rs.getDouble("Price");
		String imgPath=rs.getString("Img_Path");
		String model=rs.getString("model");
		
		out.println("<form action='processUpdate.jsp' methord='get'>");
	    
		out.println("<table class='form-group'>");
		
	
		out.println(" <h1>Product Update</h1>");
		
		
		out.println("<tr>");
		out.println("<td  class='col-md-1'>"+"Name"+":"+"</td>");
		out.println("<td>"+"<input type='text'  class='form-control col-md-offset-1' name='model' value='"+model+"'/>"+"</td>");
		out.println("</tr>");
		
		out.println("<tr>");
		out.println("<td class='col-md-1'>"+"ProductID"+":"+"</td>");
		out.println("<td style='margin-left:100px;'>"+ProductID+"</td>");
		out.println("</tr>");
		
		out.println("<tr>");
		out.println("<td  class='col-md-1'>"+"CategoryID"+":"+"</td>");
		out.println("<td>"+"<input type='text' class='form-control col-md-offset-1' name='CategoryID' value='"+CategoryID+"'/>"+"</td>");
		out.println("</tr>");
		
		//CategoryName
	
		out.println("<tr>");
		out.println("<td  class='col-md-1'>"+"Brand"+":"+"</td>");
		out.println("<td><input type='text' class='form-control col-md-offset-1' name='Brand' value='"+brand+"'/></td>");
		out.println("</tr>");
		
		out.println("<tr>");
		out.println("<td  class='col-md-1'>"+"Description"+":"+"</td>");
		out.println("<td><textarea class='form-control col-md-offset-1'  rows='5' name='Description' >"+Description+"</textarea></td>");
		out.println("</tr>");
		out.println("<br>");
		out.println("<tr>");
		out.println("<td  class='col-md-1'  >"+"Specification"+":"+"</td>");
		out.println("<td><textarea name='Specification' class='form-control col-md-offset-1' rows='5' >"+Spec+"</textarea></td>");
		out.println("</tr>");
		
		out.println("<tr>");
		out.println("<td  class='col-md-1'>"+"Price"+":");
		out.println("<td><input type='text' class='form-control col-md-offset-1' name='Price' value='"+price+"'/></td>");
		out.println("</tr>");
		
		/*out.println("<tr>");
		out.println("<td width='100'  >"+"ImgPath"+":"+"</td>");
		out.println("<td><input type='file' id='exampleInputFile' name='newImgPath'/>");
		out.println("<br>");
		out.println(imgPath+"'/></td>");*/
		out.println("<input type='hidden' name='ImgPath' value='"+imgPath+"'/>");
		//out.println("</tr>");
		
		out.println("<tr>");
		out.println("<td>");
		out.println("<input type='reset' class='btn btn-lg btn-danger' value='reset'/>");
		out.println("</td>");
		out.println("<td>");
		out.println("<input type='hidden' name='hiddenID' value='"+ProductID+"'/>");
		out.println("<input type='hidden' name='hiddenTable' value='it_product'/>");
		out.println("<input type='submit' value='Update Now!' class='col-md-3 btn btn-lg btn-success' name='updateBtn'/>");		
		out.println("</td>");
		
		out.println("</tr>");
		out.println("</form>");
	}
   out.println("</table>");
   }else if(Table.equals("category")){
	   
	   String CategoryID = request.getParameter("hiddenID");
	   
	   String sql="Select * from category WHERE CategoryID=?";
	   
	   PreparedStatement pstmt = conn.prepareStatement(sql);
	   
	   pstmt.setInt(1,Integer.parseInt(CategoryID));
	   
	   ResultSet rs = pstmt.executeQuery();
	   
	   if(rs.next()){
			

			
			   String Category= rs.getString("CategoryName");
			   String CategoryD= rs.getString("CategoryDetail");
			   String CategoryImg= rs.getString("imgpath");
			   
			   
				out.println("<form action='processUpdate.jsp' method='get'>");
			    
				out.println(" <h1>Category Update</h1>");
				
				out.println("<table class='form-group'>");
			   out.println("<br>");
				out.println("<tr>");
				out.println("<td class='col-md-1'>"+"CategoryID"+":"+"</td>");
				out.println("<td>"+CategoryID+"</td>");
				out.println("</tr>");
			   
				out.println("<tr>");
				out.println("<td class='col-md-1'>"+"CategoryName"+":"+"</td>");
				out.println("<td><input type='text' class='form-control col-md-offset-1' name='Category' value='"+Category+"'/></td>");
				out.println("</tr>");
				
				out.println("<tr>");
				out.println("<td class='col-md-1'>"+"Category Details"+":"+"</td>");
				out.println("<td><textarea name='CategoryD' rows='3' class='form-control col-md-offset-1'/>"+CategoryD+"</textarea></td>");
				out.println("</tr>");
				
				out.println("<tr>");
				out.println("<td class='col-md-1'>"+"Img Path"+":"+"</td>");
				out.println("<td><input type='text' name='img' class='form-control col-md-offset-1' value='"+CategoryImg+"'/></td>");
				out.println("</tr>");
				
				
				out.println("<tr>");
				out.println("<td>");
				out.println("<input type='reset' class='btn btn-lg btn-danger' value='reset'/>");
				out.println("</td>");
				out.println("<td>");
				out.println("<input type='hidden' name='hiddenID' value='"+CategoryID+"'/>");
				out.println("<input type='hidden' name='hiddenTable' value='category'/>");
				out.println("<input type='submit' value='Update Now!' class='col-md-3 btn btn-lg btn-success' name='updateBtn'/>");		
				out.println("</td>");
				
				out.println("</tr>");
			
			out.println("</form>");
		}
	   out.println("</table>");
	   
	
		   

	   
	   
   }else{
	   //user table
   }
   
}catch(Exception e){

	out.println(e);
	
}


%></h3>
	 </div>
    <!-- jQuery Version 1.11.1 -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>
</html>