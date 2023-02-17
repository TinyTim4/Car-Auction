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
.inline {
  display: inline;
}

.link-button {
  background: none;
  border: none;
  color: blue;
  text-decoration: underline;
  cursor: pointer;
  font-size: 1em;
  font-family: serif;
}
.link-button:focus {
  outline: none;
}
.link-button:active {
  color:red;
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
			//Get the selected radio button from the index.jsp
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			//Run the query against the database.
			
			String q = request.getParameter("question");
			String s = request.getParameter("search");
			ResultSet result;
			if(q != null) {
				int x = stmt.executeUpdate("insert into questions values('" +session.getAttribute("user")+ "', '" +q+ "', ' ', ' ')");
			}
		
			if(s != null) {
				result = stmt.executeQuery("select * from questions where question like '%" +s+ "%'");
			}
			else {
				result = stmt.executeQuery("select * from questions ");
			}
			ResultSet result2 = stmt2.executeQuery("select * from users where username = '" +session.getAttribute("user")+"'");
			result2.next();
		%>
		<form method="get" action="">
				Search <input type="text" name = "search" ">
				<input type="submit" value="Submit">
		</form>	
		<!--  Make an HTML table to show the results in: -->
	<table>
		<tr>    
			<td>User</td>
			<td>Question</td>
			<td>Answer</td>
			<td> Answered By</td>
		</tr>
			<%
			//parse out the results
			while (result.next()) { 
				String qu = result.getString("question");%>
				<tr>    
					<td><form method="post" action="profile.jsp" class="inline">
  							<input type="hidden" name = "userid" value = <%=result.getString("username") %> >
  							<button type="submit" name="submit_param" value="submit_value" class="link-button">
    						<%out.println(result.getString("username"));%>
    						</button>
							</form></td>
					<td><%= result.getString("question")%></td>
					<td><%= result.getString("answer")%></td>
					<td><form method="post" action="profile.jsp" class="inline">
  							<input type="hidden" name = "userid" value = <%=result.getString("uanswer") %> >
  							<button type="submit" name="submit_param" value="submit_value" class="link-button">
    						<%out.println(result.getString("uanswer"));%>
    						</button>
							</form></td>
					<%
					if(result2.getInt("custrep") == 1) { %>
						<td><form method="get" action="answer.jsp">
								<input type="hidden" name = "quest" value="<%=qu%>">
								<input type="hidden" name = "user" value="<%result.getString("username");%>">
								<input type="submit" value="Answer">
							</form></td> <% 
					}
					%>
				</tr>
			<% } %>
			</table> 
			<br></br>
			<% if(result2.getInt("custrep")==0) {
				%><form action="" method="post">
					Ask a question <input type="text" name="question"/>
					<input type="hidden" name="user" value = <%=session.getAttribute("user") %>/>
					<input type="submit" value="Submit"/>
				</form>
				<br></br>
				<% } %>
			<a href= 'success.jsp'>Go back to home page</a>
			<% 
			
		 } catch (Exception e) {
			out.print(e);
		}%>
	

	</body>
</html>