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
	String question = request.getParameter("quest");  
	String user= request.getParameter("user");  
	
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	Statement stmt = con.createStatement();
    
    ResultSet rs;
    rs = stmt.executeQuery("select * from questions where username='" + user + "' and question = '" + question + "'");
    String answer = request.getParameter("ans");  
	String auser= request.getParameter("username"); 
	if(answer != null) {
		int y = stmt.executeUpdate("UPDATE questions SET answer = REPLACE(answer, ' ', '"+answer+"')");
		int z = stmt.executeUpdate("UPDATE questions SET uanswer = REPLACE(uanswer, ' ', '"+auser+"')");
		response.sendRedirect("questions.jsp");
	}
    %>
    <h1><%out.println(question);%></h1>
    <br></br>
    <form action="" method="post">
				Answer <input type="text" name="ans"/>
				<input type="hidden" name="username" value = <%=session.getAttribute("user") %>/>
				<input type="submit" value="Submit"/>
			</form>
			<br></br>
    


</body>
</html>