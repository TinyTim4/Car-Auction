<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
</style>

<body>
<%@ page import ="java.sql.*" %>
<% try {
	
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			Statement stmt = con.createStatement();
			Statement stmt2 = con.createStatement();
			Statement stmt3 = con.createStatement();
			Statement stmt4 = con.createStatement();
			String u = request.getParameter("userid");
			ResultSet result = stmt.executeQuery("select * from cars where user = ('" + u + "')");
			ResultSet result2 = stmt2.executeQuery("select cars.name, cars.user, bids.amount from bids inner join cars on bids.id = cars.id where bids.user=('" + u + "')");
			ResultSet result3 = stmt3.executeQuery("select * from archive where user = ('" + u + "')");
			ResultSet result4 = stmt4.executeQuery("select * from archive where archive.seller = ('" + u + "') and archive.win = 1");
		%>
			
		<!--  Make an HTML table to show the results in: -->
		<h1><%out.println(u);%>'s profile</h1>
		<center>Current Auctions</center>
	<table style="width:100%">
		<tr>    
			<td>ID</td>
			<td>name</td>
			<td> Type</td>
			<td> Manufacturer</td>
			<td> Year Produced</td>
			<td> Color</td>
			<td> Mileage</td>
			<td> Price</td>
			<td> End Time</td>
		</tr>
			<%
			//parse out the results
			while (result.next()) { %>
				<tr>    
					<td><%= result.getString("id")%></td>
					<td><%= result.getString("name")%></td>
					<td><%= result.getString("type")%></td>
					<td><%= result.getString("manufact") %></td>
					<td><%= result.getString("year") %></td>
					<td><%= result.getString("color") %></td>
					<td><%= result.getString("mileage") %></td>
					<td><%= result.getString("price") %></td>
					<td><%= result.getString("date") %></td>
				</tr>
				

			<% } %>
			</table> 
			<center>Current Bids</center>
			<table style="width:50%">
		<tr>    
			<td>Auction Name</td>
			<td>Seller</td>
			<td> Amount</td>
		</tr>
			<%
			//parse out the results
			while (result2.next()) { %>
				<tr>    
					<td><%= result2.getString("cars.name")%></td>
					<td><%= result2.getString("cars.user")%></td>
					<td><%= result2.getString("bids.amount")%></td>
				</tr>
				

			<% } %>
			</table> 
			<center>Past Bids</center>
			<table style="width:50%">
		<tr>    
			<td>Auction Name</td>
			<td>Seller</td>
			<td> Amount</td>
			<td> End Date</td>
		</tr>
			<%
			//parse out the results
			while (result3.next()) { %>
				<tr>    
					<td><%= result3.getString("aname")%></td>
					<td><%= result3.getString("seller")%></td>
					<td><%= result3.getString("amount")%></td>
					<td><%= result3.getString("date")%></td>
				</tr>			
			<% } %>
			</table> 
			<center>Past Auctions</center>
			<table style="width:50%">
		<tr>    
			<td>name</td>
			<td> Type</td>
			<td> Highest Bid</td>
			<td>Winner</td>
			<td> End Time</td>
		</tr>
			<%
			//parse out the results
			while (result4.next()) { %>
				<tr>    
					<td><%= result4.getString("aname")%></td>
					<td><%= result4.getString("type")%></td>
					<td><%= result4.getString("amount") %></td>
					<td><%= result4.getString("user")%></td>
					<td><%= result4.getString("date") %></td>
				</tr>		
			<% } %>
			</table> <% 
		 }catch (Exception e) {
			out.print(e);
		}%>
	

	</body>
</html>