<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Details</title>
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico" />
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>

<style>
h3 {
	font-size: 3.7em;
	margin
	=0;
}

#img {
	max-width: 20px;
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
			<a class="navbar-brand" href="AdminPage.jsp">SP IT</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="CatProduct.jsp">Back</a></li>

			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>
	<div class="row">
		<div class="container">
			<div class="text-left">
				<h3 class="col-md-5 col-md-offset-1"
					style="margin-left: 0; padding-top: 100px;">Product
					Details!!!</h3>
			</div>
		</div>
	</div>


	<%
		try {
			// Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver");

			// Step 2: Define Connection URL
			String connURL = "jdbc:mysql://localhost/sp_it?user=root&password=root";

			// Step 3: Establish connection to URL
			Connection conn = DriverManager.getConnection(connURL);

			String SelectCat = "Select * from category";
			PreparedStatement Category = conn.prepareStatement(SelectCat);
			ResultSet CatDis = Category.executeQuery();

			List<String> CategoryName = new ArrayList<String>();
			List<String> CategoryId = new ArrayList<String>();

			int CatNum = 0;

			while (CatDis.next()) {
				CategoryName.add(CatDis.getString("CategoryName"));
				CategoryId.add(CatDis.getString("CategoryName"));
				CatNum++;
			}
	%>
	<div class="row">
		<div class="container">
			<form action='Create.jsp' method='get' class='inline-form'>
				<input type='submit' value='CREATE' name='create'
					class='col-md-3 btn-lg  btn btn-info'> <input
					type='hidden' name='hiddenTable' value='it_product' />
			</form>
			<div class='container'>

				<table class='table table-hover'>
					<thead>
						<tr>
							<th class='col-md-1'>Product ID</th>

							<th class='col-md-1'>
								<div class='dropdown'>
									<button class="dropdown-toggle btn btn-default btn-lg"
										id="filterMenu" data-toggle="dropdown" aria-expanded="true">
										Categories<span class="caret"></span>
									</button>
									<ul class="dropdown-menu" role="menu"
										aria-labelledby="filterMenu">
										<li role="presentation"><a href="CatFilter.jsp?filterSelect=All">All</a></li>
										<%
											for (int i = 0; i < CatNum; i++) {
													out.println("<li role ='presentation'><a href = 'CatFilter.jsp?filterSelect="
															+ CategoryId.get(i)
															+ "'>"
															+ CategoryName.get(i)
															+ "</a></li>");

												}
										%>

									</ul>
								</div>
							</th>
							</div>
							</div>



							<th class='col-md-1'>Brand</th>
							<th class='col-md-1'>Model/ Name</th>
							<th class='col-md-3'>Description</th>
							<th class='col-md-2'>Specification</th>
							<th class='col-md-1'>Price</th>
							<th class='col-md-1'>ImgLocation</th>
							<th class='col-md-1'></th>");
						</tr>
					</thead>
					<tbody>
						");


						<%
						String filterSelect = request.getParameter("filterSelect");
						if(filterSelect == null){ filterSelect = "All"; }
						
							String sql;
							PreparedStatement pstmt;

							if (filterSelect.equals("All")) {
								sql = "Select * from it_product JOIN category ON it_product.CategoryID=category.CategoryID;";
								pstmt = conn.prepareStatement(sql);

							} else {

								sql = "Select * from it_product JOIN category ON it_product.CategoryID=category.CategoryID  where category.CategoryName=?;";
								pstmt = conn.prepareStatement(sql);
								pstmt.setString(1, filterSelect);
							}

							ResultSet rs = pstmt.executeQuery();

							while (rs.next()) {

								int ProductID = rs.getInt("ProductID");
								int CategoryID = rs.getInt("CategoryID");
								String CategoryName2 = rs.getString("CategoryName");
								String brand = rs.getString("Brand");
								String Description = rs.getString("Short_Description");
								String Spec = rs.getString("Specification_Info");
								Double price = rs.getDouble("Price");
								String model = rs.getString("model");

								out.println("<tr>");
								out.println("<td class='col-md-1'>" + ProductID + "</td>");
								out.println("<td class='col-md-1'>" + CategoryName2
										+ "</td>");
								out.println("<td class='col-md-1'>" + brand + "</td>");
								out.println("<td class='col-md-1'>" + model + "</td>");
								out.println("<td class='col-md-3'>" + Description + "</td>");
								out.println("<td class='col-md-2'>" + Spec + "</td>");
								out.println("<td class='col-md-1'>S$" + price + "</td>");

								out.println("<td class='col-md-1'>");
								out.println("<form action='delete.jsp' method='get'>");
								out.println("<input type='hidden' name='hiddenID' value='"
										+ ProductID + "'/>");
								out.println("<input type='hidden' name='hiddenTable' value='it_product'/>");
								out.println("<input type='hidden' name='IDName' value='ProductID'/>");
								out.println("<input type='hidden' name='CatId' value='"
										+ CategoryID + "'/>");
								out.println("<input type='submit' value='Delete' name='deleteBtn' class='btn btn-danger btn-lg'/>");
								out.println("</form>");
								out.println("</td>");
								out.println("<td class='col-md-1'>");
								out.println("<form action='update.jsp' method='get'>");
								out.println("<input type='hidden' name='hiddenID' value='"
										+ ProductID + "'/>");
								out.println("<input type='hidden' name='hiddenTable' value='it_product'/>");
								out.println("<input type='submit' value='update' name='updateBtn' class='btn btn-warning btn-lg'/>");
								out.println("</form>");
								out.println("</td>");

								out.println("</tr></div>");
							}

							out.println("</tbody></table>");
							conn.close();

						} catch (Exception e) {

							out.println(e);

						}
					%>


						<!-- jQuery Version 1.11.1 -->
						<script src="js/jquery.js"></script>

						<!-- Bootstrap Core JavaScript -->
						<script src="js/bootstrap.min.js"></script>
</body>
</html>