<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.util.Timer, java.time.LocalDateTime"%>
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
<% try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();
			Statement stmt2 = con.createStatement();
			Statement stmt3 = con.createStatement();
			//Get the selected radio button from the index.jsp
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			//Run the query against the database.
			String id = request.getParameter("vid");
			String floor = request.getParameter("price");
			String u = request.getParameter("user");
			String type = request.getParameter("type");
			ResultSet result = stmt.executeQuery("select * from bids where id = ('" + id + "')");
			ResultSet result2 = stmt2.executeQuery("select * from cars where type = ('" + type + "') and not id = ('" + id + "') ");
			
		%>
			
		<!--  Make an HTML table to show the results in: -->
	<table>
		<tr>    
			<td>Id</td>
			<td>Vid</td>
			<td>User</td>
			<td> Amount</td>
		</tr>
			<%
			//parse out the results
			while (result.next()) { %>
				<tr>    
					<td><%= result.getString("bidid")%></td>
					<td><%= result.getString("id")%></td>
					<td><form method="post" action="profile.jsp" class="inline">
  							<input type="hidden" name = "userid" value = <%=result.getString("user") %> >
  							<button type="submit" name="submit_param" value="submit_value" class="link-button">
    						<%out.println(result.getString("user"));%>
    						</button>
							</form></td>
					<td><%= result.getString("amount")%></td>
				</tr>
				

			<% } %>
			</table> <% 
			 if(!u.equals(session.getAttribute("user"))) {
				%> <form method="get" action="bid.jsp"> 
					<input type="hidden" name = "price" value = <%=floor %>>
					<input type="hidden" name = "vid" value = <%=id %>>
					<input type="submit" value="Place A Bid">
					</form>
			 
			<% }
			
			%> <h1>Similar Bids</h1>
			<table>
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
			while (result2.next()) { 
				String vid = result2.getString("id");
				String name = result2.getString("user");
				String price = result2.getString("price");
				LocalDateTime dateTime = LocalDateTime.parse(result2.getString("date").replace(" ", "T"));
				LocalDateTime myObj = LocalDateTime.now();
				if (dateTime.isBefore(myObj)) {
					session.setAttribute("cid", result2.getString("id")); 
					response.sendRedirect("deleteCar.jsp");
				}
				%>
				<tr>    
					<td><%= result2.getString("id")%></td>
					<td><%= result2.getString("name")%></td>
					<td><%= result2.getString("type")%></td>
					<td> <form method="post" action="profile.jsp" class="inline">
  							<input type="hidden" name = "userid" value = <%=result2.getString("user") %> >
  							<button type="submit" name="submit_param" value="submit_value" class="link-button">
    						<%out.println(result2.getString("user"));%>
    						</button>
							</form> </td>
					<td><%= result2.getString("manufact") %></td>
					<td><%= result2.getString("year") %></td>
					<td><%= result2.getString("color") %></td>
					<td><%= result2.getString("mileage") %></td>
					<td><%= result2.getString("price") %></td>
					<td><%= result2.getString("date") %></td>
					<td><form method="get" action="bidding.jsp">
							<input type="hidden" name = "vid" value = <%=id %>>
							<input type="hidden" name = "price" value = <%=price %>>
							<input type="hidden" name = "user" value = <%=name %>>
							<input type="submit" value="Bids">
						</form><td>
				</tr>
				

			<% }
			%>
		</table>
		<a href="success.jsp">Go back to Home Page</a>
		<% 
		 } catch (Exception e) {
			out.print(e);
		}%>
	

	</body>
</html>