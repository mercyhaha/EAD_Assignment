<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@page import="java.util.*, java.sql.*, java.text.*"%>
	
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

<body>
	
<style>
	body{
		background: url("simple1.jpg");
	}

	table{
		border-bottom: 2px solid black;
	}
	.container{
		padding-top: 2em;
		padding-left: 28em;
		padding-bottom: 5em;
	}

</style>
	
<%
				
try{

		int hiddenproductid = Integer.parseInt(request.getParameter("productid"));
		String date = request.getParameter("date");
		
 		Class.forName("com.mysql.jdbc.Driver");
		
 		String connURL ="jdbc:mysql://localhost/sp_it?user=root&password=root"; 
		
 		Connection conn =   DriverManager.getConnection(connURL); 
		
		String sql="Select * from comment where productid = ?"; 
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		
		pstmt.setInt(1, hiddenproductid);	
		
		ResultSet rs=pstmt.executeQuery();
		
		out.println("<div class='table-responsive'>");
		out.println("<table class='table'>");
		out.println("<caption>Feel free to comment here!</caption>");
		out.println("<thead>");
		out.println("<tr>");
		out.println("<th>Name</th>");
		out.println("<th>Rating<br/>(1-5 Stars)</th>");
		out.println("<th>Date</th>");
		out.println("<th>Comments</th>");
		out.println("</tr>");
		out.println("</thead>");
		out.println("<tbody>");
			
		while(rs.next()){
			String name=rs.getString("name");
 			int rating=rs.getInt("rating");
			String comment=rs.getString("comment");
						
			out.println("<tr>");
			out.println("<td>"+name+"</td>");
			out.println("<td>"+rating+"</td>");
			out.println("<td>"+rs.getString("date")+"</td>");
			out.println("<td>"+comment+"</td>");
			out.println("</tr>");
			
		}
		
			out.println("</tbody>");
			out.println("</table>");
			out.println("</div>");
		
		%>
		
		<div class="container" align="center" style="width:1500px; margin:0 auto;">
    <div class="row">
        <form action="commentData.jsp" method="post" role="form">
            <div class="col-lg-6">
                <div class="well well-sm"><strong><span class="glyphicon glyphicon-asterisk"></span>Required Field</strong></div>
                <div class="form-group">
                    <label for="InputName">Enter Name</label>
                    <div class="input-group">
                        <input type="text" class="form-control" name="name" id="InputName" placeholder="Enter Name" required>   
                        <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>                    
                    </div>
                </div>
                <div class="form-group">
                    <label for="InputEmail">Ratings (1-5 stars):</label>
                    <div class="input-group">
                        <input type="text" class="form-control" id="InputEmailSecond" name="rating" placeholder="Your Rating" required> 
                        <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>                      
                    </div>
                </div>
                <div class="form-group">
                    <label for="InputMessage">Enter Comments:</label>
                    <div class="input-group">
                        <textarea name="text" id="textarea" class="form-control" rows="5" required></textarea>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                    </div>
                </div>
                <input type="hidden" name="hiddenproductid" value="<%=hiddenproductid %>">
                <input type="submit" name="submit" id="submit" value="Submit" class="btn btn-info pull-center">
            </div>
        </form>
    </div>
</div>
	
		<%
		
		
		conn.close();
		
	}catch(Exception e){
		
		out.println(e);
		
	}
	
	%>
	
	

</body>
</html>