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
<body>
	<%@ page import ="java.sql.*" %>
<%
    String user = request.getParameter("Username");   
    String pass = request.getParameter("Password");
    
    ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	Statement stmt = con.createStatement();
    ResultSet result = stmt.executeQuery("select * from users where username =  BINARY('" + user + "')");
    if (result.next()){
    	 ResultSet result2 = stmt.executeQuery("select * from users where username=('" + user + "') and password = BINARY('" + pass + "')");
    	    if (result2.next()) {
    	    	session.setAttribute("user", user); 
    	    	response.sendRedirect("success.jsp");
    	    } else {
    	        out.println("Invalid password");
    	    }
    }
    else{
    	out.println("Username doesn't exist");
    }
%>

</body>
</html>
