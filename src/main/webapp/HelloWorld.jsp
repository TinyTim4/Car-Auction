<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Hi Beer World</title>
	</head>
	
	<body>
	<br>
	<br>
	<br>
	<br>						  
	<center>Please login</center>
		<form align="center" method="get" action="sellsNewBeer.jsp">
			<table align="center">
				<tr>    
					<td align="center">Username</td><td><input type="text" name="Username"></td>
				</tr>
				<tr>
					<td>Password</td><td><input type="password" name="Password"></td>
				</tr>
			</table>
			<input type="submit" value="Submit">
		</form>
		<form align="center" method="get" action="register.jsp">
			<input type="submit" value="Create Account">
		</form>
	<br>
	
	

	
	

</body>
</html>