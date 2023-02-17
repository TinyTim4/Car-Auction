<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.moviebay.pkg.*" import="com.moviebay.pkg.servlets.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register page</title>
</head>

<body>
	<h1>Create your account</h1>
	<form action="insertCarData.jsp" method="post">
		 <label for="cars">Choose a vehicle:</label>
  		<select name="vehicles" id="vehicle">
    	<option value="car">cars</option>
    	<option value="motorcycle">motorcycle</option>
    	<option value="truck">truck</option>
  		</select>
  		<br></br>
  		Name <input type="text" name="aname"/>
  		<br></br>
		Manufacturer <input type="text" name="manufacturer"/>
		<br></br>
		Year Produced <input type="text" name="year"/>
		<br></br>
		Mileage <input type="text" name="mileage"/>
		<br></br>
		Color <input type="text" name="color"/>
		<br></br>
		Starting Price <input type="text" name="price"/>
		<br></br>
  		<label for="endtime">Choose the ending time for your auction:</label>
			<input type="datetime-local" name="endtime" />
  		<br></br>
  		<input type="submit" value="Register"/>
	<br></br>
	</form>
</body>
</html>