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
	String vid = String.valueOf(session.getAttribute("vid"));
	String floor = String.valueOf(session.getAttribute("price"));
	String bid = request.getParameter("Bid");
	String inc = request.getParameter("inc");
	int incr = Integer.parseInt(inc);
	String ceiling = request.getParameter("ceil");
	if(bid == null) {
		bid = String.valueOf(session.getAttribute("bid"));
	}
	int bidding = Integer.parseInt(bid);
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	Statement stmt = con.createStatement();
	Statement stmt2 = con.createStatement();
	Statement stmt3 = con.createStatement();
	Statement stmt4 = con.createStatement();
    ResultSet rs;
   
    rs = stmt.executeQuery("select * from bids ");
    int count = 1;
    while(rs.next()) {
    	count = Integer.parseInt(rs.getString("bidid"))+1;
    } 
    int n = count;
    int count1 = 2;
    if(bidding <= Integer.parseInt(floor)) {
    	out.println("You must bid higher than the requested amount <a href= 'buy.jsp'>Please try again.</a>");
    }
    else {
    	int x = stmt.executeUpdate("insert into bids values('" +count+ "','" +vid+ "', '" +session.getAttribute("user1")+ "','" +bid+ "','" +inc+ "','" +ceiling+ "')");
    	String space = "";
    	ResultSet rs2 = stmt2.executeQuery("select distinct user, bidid, id, amount, inc, ceil from bids where not ceil = '" +space+ "' order by ceil asc");
    	while(rs2.next()) {
    		if(rs2.getString("user").equals(session.getAttribute("user1"))) {
    			break;
    		}
    		if(ceiling.equals("")) {
    			int sum = Integer.parseInt(rs2.getString("inc"))+ bidding;
    			if(bidding <= Integer.parseInt(rs2.getString("ceil"))) {
    				if(sum <= Integer.parseInt(rs2.getString("ceil"))) {
    					bid = String.valueOf(sum);
    					n++;
            			int y = stmt.executeUpdate("insert into bids values('" +n+ "','" +vid+ "', '" +rs2.getString("user")+ "','" +bid+ "','" +inc+ "','" +ceiling+ "')");
    				}
    				else {
    					sum = Integer.parseInt(rs2.getString("inc"))+ bidding;
    					n++;
    					int y = stmt.executeUpdate("insert into bids values('" +n+ "','" +vid+ "', '" +rs2.getString("user")+ "','" +bid+ "','" +inc+ "','" +ceiling+ "')");
    				}
    			}
    			else {
    				int y = stmt.executeUpdate("UPDATE bids SET ceil = REPLACE(ceil, '"+rs2.getString("ceil")+"', '"+space+"')");
    			}
    		}
    		else {
    			int ceil = Integer.parseInt(ceiling);
    			if(ceil <=  Integer.parseInt(rs2.getString("ceil"))) {
    				int sum = Integer.parseInt(rs2.getString("inc"))+ ceil;
    				if(sum <= Integer.parseInt(rs2.getString("ceil"))) {
    					bid = String.valueOf(sum);
    					n++;
        				int y = stmt.executeUpdate("insert into bids values('" +n+ "','" +vid+ "', '" +rs2.getString("user")+ "','" +bid+ "','" +inc+ "','" +ceil+ "')");
        				int z = stmt.executeUpdate("UPDATE bids SET ceil = REPLACE(ceil, '"+ceil+"', '"+space+"')");
    				}
    				else {
    					bid = rs2.getString("ceil");
    					n++;
    					int y = stmt.executeUpdate("insert into bids values('" +n+ "','" +vid+ "', '" +rs2.getString("user")+ "','" +bid+ "','" +inc+ "','" +ceil+ "')");
    				}
    				int y = stmt.executeUpdate("UPDATE bids SET ceil = REPLACE(ceil, '"+ceil+"', '"+space+"')");
    			}
    			else {
    				int sum = incr + Integer.parseInt(rs2.getString("ceil"));
    				bid = String.valueOf(sum);
    				n++;
    				int y = stmt.executeUpdate("insert into bids values('" +n+ "','" +vid+ "', '" +rs2.getString("user")+ "','" +rs2.getString("ceil")+ "','" +inc+ "','" +ceil+ "')");
    				n++;
    				y = stmt.executeUpdate("insert into bids values('" +n+ "','" +vid+ "', '" +session.getAttribute("user1")+ "','" +bid+ "','" +inc+ "','" +ceil+ "')");
    				int z = stmt.executeUpdate("UPDATE bids SET ceil = REPLACE(ceil, '"+rs2.getString("ceil")+"', '"+space+"')");
    			}
    			
    		}
    	}
    	int y = stmt.executeUpdate("UPDATE cars SET price = REPLACE(price, '"+floor+"', '"+bid+"')");
    	ResultSet rs3 = stmt3.executeQuery("select distinct bids.user, bids.bidid, cars.id, cars.name, cars.type, cars.user, cars.date, bids.amount, bids.inc, bids.ceil from bids inner join cars on bids.id = cars.id where cars.id='" +vid+ "' order by bids.amount desc");
    	rs3.next();
    	String person = rs3.getString("bids.user");
    	while(rs3.next()) {
    		if(!rs3.getString("bids.user").equals(person)) {
    			int z = stmt.executeUpdate("insert into archive values('"+rs3.getString("bids.user")+ "','" +rs3.getString("cars.user")+ "','" +rs3.getString("cars.name")+ "','" +rs3.getString("bids.bidid")+ "','" +rs3.getString("cars.id")+ "','" 
                		+rs3.getString("cars.type")+ "', '" +rs3.getString("cars.date")+ "','" 
                		+Integer.parseInt(bid)+ "', '" +count1+ "')");

    		}
    	}
    	out.println("<a href= 'buy.jsp'>Success.</a>");
    }
    
    
    
%>

</body>
</html>