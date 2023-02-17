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
	String vehicle = request.getParameter("vehicles");  
	String name = request.getParameter("aname");   
	String manu = request.getParameter("manufacturer");
	String year = request.getParameter("year");
	String mileage = request.getParameter("mileage");
	String color = request.getParameter("color");
	String price = request.getParameter("price");
	String end = request.getParameter("endtime");
	end = end.replace("T", " ");
	
	
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	Statement stmt = con.createStatement();
    
    ResultSet rs;
    int count = 1;
    rs = stmt.executeQuery("select * from numOfAuc ");
    while(rs.next()) {
    	count = Integer.parseInt(rs.getString("amount"))+1;
    } 
    int x = stmt.executeUpdate("insert into cars values('" +count+ "', '" +vehicle+ "','" +name+ "','" +session.getAttribute("user")+ "','" +manu+ "','" +year+ "','" +color+ "','" +mileage+ "','" +price+ "','" +end+ "')");
    int y = stmt.executeUpdate("insert into numOfAuc values('" +count+ "')");
    response.sendRedirect("buy.jsp");
    
%>

</body>
</html>