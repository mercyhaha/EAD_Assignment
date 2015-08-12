<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="Model.*, java.util.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sp IT!</title>
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
</head>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<style>

.table{
	margin-top: 3em;

}

.size{
	width: 200px;
    height: 120px;
    border-radius: 2px solid black;
}

.size img {
    width: 100%;
    height: auto;
}

#checkout{
	padding-left: 1em;
	padding-bottom: 3em;
	font-size: 120%;

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
				<li><a href="homePageEdit.jsp#services">About Us</a></li>
				<li><a href="homePageEdit.jsp#portfolio">Products</a></li>
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
                   <%  }else{}}else {
                   		response.sendRedirect("Login.jsp");
                   } %>
			</ul>
		</div>
	</div>
	</nav>
	
<%		
				
				out.println("<div class='table-responsive'>");
				out.println("<table class='table'>");
				out.println("<caption>Your Shopping Cart!</caption>");
				out.println("<thead>");
				out.println("<tr>");
				out.println("<th>Brand</th>");
				out.println("<th>Model</th>");
				out.println("<th>Image</th>");
				out.println("<th>Unit Price</th>");
				out.println("<th>Quantity</th>");
				out.println("<th>Total Price</th>");
				out.println("</tr>");
				out.println("</thead>");
				out.println("<tbody>");
				
				ArrayList<Products> productList = (ArrayList<Products>)session.getAttribute("productCart");
				
				double totaltotalprice = 0.0;
				
				if (productList != null) {
					for (Products p : productList) {
						
						int productid = p.getProductid();
				
				out.println("<tr>");
				out.println("<td>"+p.getBrand()+"</td>");
				out.println("<td>"+p.getModel()+"</td>");
				out.println("<td><img src='"+p.getImg_Path()+"' style='width:400px; height:300px; margin-right: -15em;'></td>");
  				//out.println("<td>"+p.getQuantity()+"</td>");
  				out.println("<td>$"+p.getPrice()+"0</td>");

 								%> 
				
 				 				<td> 
 				 					<form action="UpdateProductsServlet"> 
 				 					<input type="text" style="width: 34px" name="quantity" value="<%=p.getQuantity() %>"/> 
 				 					<input type="hidden" name="productid" value="<%=productid %>">
 								<input class="btn btn-success" type="submit" value="Update"> 
 								</form>				
 							</td> 
 								
 				 				<% 
			
 				out.println("<td>$"+p.getTotalPrice()+"0</td>");
				
				%>
				
				<td>
					<form action="DeleteCartServlet">
					<input type="hidden" name="productid" value="<%=productid %>"/>
					<input class="btn btn-danger" type="submit" value="Delete">
					</form>		
				</td>
				
				<%

			}
					
					
					out.println("</tbody>");
					out.println("</table>");
					out.println("</div>");
					
// 					for(Products p : productList){
// 						totaltotalprice += (p.getPrice()*p.getQuantity());
// 						p.setOrderTotal(totaltotalprice);
// 					}
// 					out.println(totaltotalprice);
					
	 				out.println("<a href='checkout.jsp'><div id='checkout'>Check Out!</div></a>"); //here, customer will confirm their purchases and proceed to buy
	 				                                                   //products will be inserted into db here by first going to inserttodbservlet
			
				}				                                                   
	 		
				

%>
	

</body>
</html>