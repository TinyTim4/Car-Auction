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
    String user = request.getParameter("userid");   
    
    ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	Statement stmt = con.createStatement();
	Statement stmt2 = con.createStatement();
	Statement stmt3 = con.createStatement();
	int check = 1;
	ResultSet rs = stmt2.executeQuery("select bids.user, bids.amount from bids inner join cars on bids.id = cars.id where cars.id='" + session.getAttribute("cid") + "'");
	String s = "";
	while(rs.next()) {
    	s = rs.getString("bids.user");
    } 
    ResultSet result2 = stmt3.executeQuery("select bids.bidid, bids.user,cars.id, cars.type, cars.name, cars.user, cars.date, bids.amount from bids inner join cars on bids.id = cars.id where cars.id='" + session.getAttribute("cid") + "'");
    while(result2.next()) {
    	int count = 0;
    	int count1 = 1;
    	if(s.equals(result2.getString("user"))) {
    		int y = stmt.executeUpdate("insert into archive values('"+result2.getString("bids.user")+ "','" +result2.getString("cars.user")+ "','" +result2.getString("cars.name")+ "','" +result2.getString("bids.bidid")+ "','" +result2.getString("cars.id")+ "','" 
    	    		+result2.getString("cars.type")+ "', '" +result2.getString("cars.date")+ "','" 
    	    		+Integer.parseInt(result2.getString("bids.amount"))+ "', '" +count1+ "')");
    		}
    	else {
    		int y = stmt.executeUpdate("insert into archive values('"+result2.getString("bids.user")+ "','" +result2.getString("cars.user")+ "','" +result2.getString("cars.name")+ "','" +result2.getString("bids.bidid")+ "','" +result2.getString("cars.id")+ "','" 
    	    		+result2.getString("cars.type")+ "', '" +result2.getString("cars.date")+ "','" 
    	    		+Integer.parseInt(result2.getString("bids.amount"))+ "', '" +count+ "')");
    	}
    	int z = stmt.executeUpdate("SET FOREIGN_KEY_CHECKS=0");
        z = stmt.executeUpdate("delete from bids where id='" + session.getAttribute("cid") + "' AND bidid = '" +result2.getString("bids.bidid")+ "'");
        z = stmt.executeUpdate("SET FOREIGN_KEY_CHECKS=1");
    }
    int x = stmt.executeUpdate("SET FOREIGN_KEY_CHECKS=0");
    x = stmt.executeUpdate("delete from cars where id='" + session.getAttribute("cid") + "'");
    x = stmt.executeUpdate("SET FOREIGN_KEY_CHECKS=1");
    response.sendRedirect("buy.jsp");
    
    
%>

</body>
</html>