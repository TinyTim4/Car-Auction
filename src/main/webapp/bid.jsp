<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>BuyMe</title>
	</head>
	<%
	String vid = request.getParameter("vid");
	String floor = request.getParameter("price");
	session.setAttribute("price", floor); 
	session.setAttribute("vid", vid); 
	session.setAttribute("user1", session.getAttribute("user")); 
	%>
	<body>
	<br>
	<br>
	<br>
	<br>						  
	<center>Bid Amount</center>
		<form align="center" method="get" action="insertBid.jsp">
			<table align="center">
				<tr>    
					<td align="center"></td><td><input type="text" name="Bid"></td>
				</tr>
			</table>
			<input type="hidden" name = "price" value = <%=floor %>>
			<input type="hidden" name = "vid" value = <%=vid %>>
			<label for="cars">AutoBid increment</label>
  		<select name="inc" id="on">
    	<option value="100">100</option>
    	<option value="500">500</option>
    	<option value="1000">1000</option>
  		</select>
  		AutoBid Ceiling <input type="text" name="ceil"/>
  		<input type="submit" value="Submit"/>
		</form>
		
	
	

	
	

</body>
</html>