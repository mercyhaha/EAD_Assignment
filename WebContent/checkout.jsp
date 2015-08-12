<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="Model.*, java.util.*" %>  
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sp IT!</title>
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="form/pure-release-0.6.0/pure-min.css">
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
	

}
#position{
	padding-top: 10em;
}
#move{
	margin-top: 7em;
	margin-left: -9em;
	

}
#size1{
	font-size: 3em;

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
                   <%  }else{}}else {%>
                   <li>
                        <a class="page-scroll" href="Login.jsp">Login</a>
                    </li>
                   <%} %>
			</ul>
		</div>
	</div>
	</nav>
	
	<div id="position">
	<form action ="CheckOutServlet" method="post" class="pure-form pure-form-aligned">
    <fieldset>
        <div class="pure-control-group">
            <label for="name">Name: </label>
            <%          
            out.println(usr.getNickname());
            %>
        </div>

        <div class="pure-control-group">
            <label for="password">Mailing Address</label>
            <%          
            out.println(usr.getMaillingaddress());
            %>
        </div>

        <div class="pure-control-group">
            <label for="email">Email Address</label>
            <%          
            out.println(usr.getEmail());
            %>
        </div>

        <div class="pure-control-group">
            <label for="foo">Contact Number</label>
            <%          
            out.println(usr.getContact());
            %>
        </div>
        
        <div class="pure-control-group">
            <label for="foo">Card Type</label>
            <select id="state" name="type">
            <option>-Choose Card Type-</option>
            <option value="visa">Visa Card</option>
            <option  value="master">Master Card</option>
            
        </select>
        </div>
        
        <div class="pure-control-group">
            <label for="foo">Credit Card Number</label>
            <input id="foo" type="text" placeholder="Credit Card Number" name="creditcard">
        </div>
        
        <div class="pure-control-group">
            <label for="foo">CVC</label>
            <input id="foo" type="text" placeholder="cvc" name="cvc">
        </div>

        <div class="pure-controls">
            <label for="cb" class="pure-checkbox">
                <input id="cb" type="checkbox"> I've read the terms and conditions
            </label>
<%
out.println("<div class='table-responsive'>");
		out.println("<table class='table'>");
		out.println("<caption>Confirm Products!</caption>");
		out.println("<thead>");
		out.println("<tr>");
		out.println("<th>Brand</th>");
		out.println("<th>Model</th>");
		out.println("<th>Image</th>");
		out.println("<th>Quantity</th>");
		out.println("</tr>");
		out.println("</thead>");
		out.println("<tbody>");	
			
	    ArrayList<Products> productList = (ArrayList<Products>)session.getAttribute("productCart");
				
	    double totaltotalprice = 0.0;
	    
		if(productList != null){	
			for (Products p : productList) 
			{
		
//				out.println("You have " + productList.size()+ " items in your cart");
		
				out.println("<tr>");
				out.println("<td>"+p.getBrand()+"</td>");
				out.println("<td>"+p.getModel()+"</td>");
				out.println("<td><img src='"+p.getImg_Path()+"' style='width:400px; height:300px; margin-right: -15em;'></td>");
				out.println("<td>"+p.getQuantity()+"</td>");					
			
			%>
			
<%-- 			<input type="hidden" name="productid" value="<%=p.getProductid() %>"/> --%>
<%-- 			<input type="hidden" name="totalamount" value="<%=p.getQuantity() %>"/> --%>
			
			<%
			
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
	}
%>
			<input type="hidden" name="totalamount" value="<%=totaltotalprice %>"/>
            <button id="move" type="submit" class="pure-button pure-button-primary">Confirm</button>
        </div>
    </fieldset>
</form>
</div>

	
		
		
		
		
		

</body>
</html>