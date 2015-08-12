<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="Model.*, java.util.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

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

#size1{
	font-size: 3em;

}
</style>

<body>
<%
out.println("<div class='table-responsive'>");
out.println("<table class='table'>");
out.println("<caption>Your Shopping Cart!</caption>");
out.println("<thead>");
out.println("<tr>");
out.println("<th>Brand</th>");
out.println("<th>Model</th>");
out.println("<th>Image</th>");
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
	out.println("<td>"+p.getQuantity()+"</td>");

					

	out.println("<td>"+p.getTotalPrice()+"</td>");



}
	
	
	out.println("</tbody>");
	out.println("</table>");
	out.println("</div>");

	for(Products p : productList){
		totaltotalprice += (p.getPrice()*p.getQuantity());
		p.setOrderTotal(totaltotalprice);
	}
	out.println("<div id='size1'>");
	out.println("Total Price: $" +totaltotalprice+"0");
	out.println("</div>");
		
	 	request.getSession().invalidate();
		out.println("<a href='homePageEdit.jsp'><div id='checkout'>Return and Log Out!</div></a>");
		
}

%>
</body>
</html>