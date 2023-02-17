<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.util.Date, java.util.Timer, java.time.LocalDateTime"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
th, td {
  border: 1px solid white;
  border-collapse: collapse;
}
th, td {
  background-color: #bbd9ba;
}
</style>
<body>
<%@ page import ="java.sql.*" %>
<%
	
			//Get the database connection		

			//Create a SQL statement
		%>
		<form action="buy.jsp" method="post">
		 <label for="sort">Sort by:</label>
  		<select name="sort" id="sort">
  			<option value="type">type</option>
    		<option value="user">user</option>
    		<option value="manufact">manufacturer</option>
    		<option value="color">color</option>
    		<option value="year">year produced</option>
    		<option value="mileage">mileage</option>
    		<option value="price">bid amount</option>
    		<option value="date">end time</option>
  		</select>
  		<select name="order" id="order">
  			<option value="asc">ascend</option>
    		<option value="desc">descend</option>
  		</select>
  		<input type="submit" value="Submit" class="update_button"//>
  		</form> <%
  		String sort = request.getParameter("sort");
  		String order = request.getParameter("order");
  		ApplicationDB db = new ApplicationDB();	
  		Connection con = db.getConnection();
  		Statement stmt = con.createStatement();
  		ResultSet result = stmt.executeQuery("SELECT * FROM cars ");
  		if(order != null) {
  			result = stmt.executeQuery("SELECT * FROM cars ORDER BY " +sort+ " " +order+ " ");
  		}
  		
  		%>
  		
		<!--  Make an HTML table to show the results in: -->
	<table style="width:100%">
		<tr>    
			<td>ID</td>
			<td> Name</td>
			<td> Type</td>
			<td> User</td>
			<td> Manufacturer</td>
			<td> Year Produced</td>
			<td> Color</td>
			<td> Mileage</td>
			<td> Price</td>
			<td> End Time</td>
		</tr>
			<%
			while (result.next()) { 
				String id = result.getString("id");
				String name = result.getString("user");
				String price = result.getString("price");
				String type = result.getString("type");
				LocalDateTime dateTime = LocalDateTime.parse(result.getString("date").replace(" ", "T"));
				LocalDateTime myObj = LocalDateTime.now();
				if (dateTime.isBefore(myObj)) {
					session.setAttribute("cid", result.getString("id")); 
					response.sendRedirect("deleteCar.jsp");
				}
				%>
				<tr>    
					<td><%= result.getString("id")%></td>
					<td><%= result.getString("name")%></td>
					<td><%= result.getString("type")%></td>
					<td> <form method="post" action="profile.jsp" class="inline">
  							<input type="hidden" name = "userid" value = <%=result.getString("user") %> >
  							<button type="submit" name="submit_param" value="submit_value" class="link-button">
    						<%out.println(result.getString("user"));%>
    						</button>
							</form> </td>
					<td><%= result.getString("manufact") %></td>
					<td><%= result.getString("year") %></td>
					<td><%= result.getString("color") %></td>
					<td><%= result.getString("mileage") %></td>
					<td><%= result.getString("price") %></td>
					<td><%= result.getString("date") %></td>
					<td><form method="get" action="bidding.jsp">
							<input type="hidden" name = "vid" value = <%=id %>>
							<input type="hidden" name = "price" value = <%=price %>>
							<input type="hidden" name = "type" value = <%=type %>>
							<input type="hidden" name = "user" value = <%=name %>>
							<input type="submit" value="Bids">
						</form><td>
				</tr>
				

			<% }
			%>
		</table>
		<a href="success.jsp">Go back to Home Page</a>
			
	
	

	</body>
</html>