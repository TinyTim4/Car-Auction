<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    if ((session.getAttribute("user") == null)) {
%>
You are not logged in<br/>
<a href="HelloWorld.jsp">Please Login</a>
<%} else {
%>
Welcome <%=session.getAttribute("user") %>  
<br>
<form align="right" method="get" action="HelloWorld.jsp">
			<input type="submit" value="Logout">
</form>
<form align="center" action="buy.jsp" method="GET">
    <input type="submit" value="Browse Cars" />
</form>
<form align="center" action="sell.jsp" method="GET">
    <input type="submit" value="Sell" />
</form>

<form align="center" method="get" action="notifs.jsp">
			<input type="submit" value="Notifications">
</form>
<form align="center" method="get" action="deleteAccount.jsp">
			<input type="hidden" name = "userid" value = <%=session.getAttribute("user") %> >
			<input type="submit" value="Delele Account">
</form>
<form align="center" method="get" action="questions.jsp">
			<input type="hidden" name = "userid" value = <%=session.getAttribute("user") %> >
			<input type="submit" value="Ask a Question">
</form>
<%
	if(session.getAttribute("user").equals("Usernames")) {
		%><form align="center" method="get" action="createCustRep.jsp">
			<input type="hidden" name = "userid" value = <%=session.getAttribute("user") %> >
			<input type="submit" value="Create Customer Representative account">
		</form>
		<form align="center" method="get" action="salesreport.jsp">
			<input type="hidden" name = "userid" value = <%=session.getAttribute("user") %> >
			<input type="submit" value="View Sales Report">
		</form>
	  <%}
    }
%>
</body>
</html>