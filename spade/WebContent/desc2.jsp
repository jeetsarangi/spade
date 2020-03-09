<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Description</title>
</head>
<body>
<%@page import="java.sql.*" %>
<h3><p align="right"> <a href="logout">Logout</a> </p></h3>
<h3><p align="right"> <a href="stock.jsp">Stock details</a> </p></h3>
<%	
if (session.getAttribute("admin") == null) {
    response.sendRedirect("login.html"); 
} 		
else {
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
}
catch(ClassNotFoundException e){
	System.out.println(e);
} 

Connection conn=null;
PreparedStatement ps = null;






try{
	conn =  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott99","tiger");
	 ps = conn.prepareStatement("SELECT * FROM products WHERE pid=?");
	 

		 int car = Integer. parseInt(request. getParameter("car"));
	 ps.setInt(1,car);
	 ResultSet rs= ps.executeQuery();
	 rs.next();
		  
		  %>
		  
		   <h1 style="color:blue;"><center><%=rs.getString(2)%></center></h1>
		   <div align="center">
		   <img src="<%=rs.getString(4)%>" height="400" width="200">
		   <h3 style="color:blue"><%=rs.getString(3) %></h3>
		   <h2 style="color:green">Price = <%=rs.getString(6) %></h2>
		  <form action="pricechange" method="get">
		  <table><tr><td>
		  <h2 style="color:red">Change Price to:</h2>
		  </td>
		  <td>
		  <input type="text" name=price>
		  </td></tr>
		  <tr>
		  <td></td>
		  <td><button type="submit" name="id" value="<%=rs.getInt(1)%>" >Change</button>
		  </td></tr>
		  </form>
		   
		   </div>
		  
		  <%
	 
		 
	
		  
	 
	  
  
}
catch(SQLException e){
	 System.out.println(e);
}
finally
{
	 try
	 {
		 ps.close();
		 conn.close();
	 }
	 catch(Exception e){
		 System.out.println(e);
	 }
}
}%>



</body>
</html>