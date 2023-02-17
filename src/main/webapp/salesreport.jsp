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
			Statement stmt2 = con.createStatement();
			String str = "SELECT distinct vid, amount, type FROM archive where win = 1 ORDER BY amount";
			ResultSet result = stmt.executeQuery(str);
			ResultSet rs2 = stmt2.executeQuery("SELECT seller, aname from archive where win = 1 order by seller desc ");
			String u = "";
			String n = "";
			if(rs2.next()) {
				u = rs2.getString("seller");
				u = rs2.getString("aname");
			}

			int sum = 0;
			int num = 1;
			int cars = 1;
			int trucks = 1;
			int motor = 1;
			int carsum = 0;
			int trucksum = 0;
			int motorsum = 0;
			while(result.next()) {
				num++;
				sum += result.getInt("amount");
				if(result.getString("type").equals("car")) {
					cars++;
					carsum += result.getInt("amount");
				}
				else if(result.getString("type").equals("truck")) {
					trucks++;
					trucksum += result.getInt("amount");
				}
				else if(result.getString("type").equals("motorcycle")) {
					motor++;
					motorsum += result.getInt("amount");
				}
			}
			carsum = carsum/cars;
			trucksum = trucksum/trucks;
			motorsum = motorsum/motor;
			int per = sum/num;
			
		%>
		<center>Total earnings: <%out.println(sum); %> </center>
		<center>Earning per item: <%out.println(per); %> </center>
		<center>Earning per car: <%out.println(carsum); %> </center>
		<center>Earning per truck: <%out.println(trucksum); %> </center>
		<center>Earning per motorcycle: <%out.println(motorsum); %> </center>
		<center>Best seller: <%out.println(u); %> </center>
		<center>Best selling item: <%out.println(n); %> </center>
		
			<% 
	%>
		
		<a href="success.jsp">Go back to Home Page</a>

			
	

	</body>
</html>