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

<body>
<%@ page import ="java.sql.*" %>
<%
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the selected radio button from the index.jsp
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str = "SELECT * FROM archive";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
		%>
			
		<!--  Make an HTML table to show the results in: -->
	<table>
		<tr> 
			<%
			while (result.next()) { 
				if(result.getInt("win") == 0 && result.getString("user").equals(session.getAttribute("user"))) {
					%>
					<tr>    
						<td><%out.println(result.getString("seller"));%>'s auction for a <%out.println(result.getString("type"));%> has ended. Your bid was not high enough.</td>
					</tr>
					<%
				}
				else if(result.getInt("win") == 1 && result.getString("user").equals(session.getAttribute("user"))){
					%>
					<tr>    
						<td>You have won <%out.println(result.getString("seller"));%>'s auction  <%out.println(result.getString("aname"));%> for $<%out.println(result.getInt("amount"));%></td>
					</tr>
					<%
				}
				else if(result.getInt("win") == 2 && result.getString("user").equals(session.getAttribute("user"))){
					%>
					<tr>    
						<td>You have been out-bid in <%out.println(result.getString("seller"));%>'s auction  <%out.println(result.getString("aname"));%></td>
					</tr>
					<%
				}
				else if(result.getInt("win") == 1 && result.getString("seller").equals(session.getAttribute("user"))){
					%>
					<tr>    
						<td>Your auction for <%out.println(result.getString("aname"));%> has been sold to <%out.println(result.getString("user"));%> for <%out.println(result.getString("amount"));%></td>
					</tr>
					<%
				}
			 }
			%>
		</tr>
		</table>
		<a href="success.jsp">Go back to Home Page</a>

			
	

	</body>
</html>