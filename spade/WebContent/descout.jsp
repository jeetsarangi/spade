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
<h3><p align="right"> <a href="Home.html">Homepage</a> </p></h3>
<h3><p align="right"> <a href="login.html">Login</a> </p></h3>
<%	
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
}
catch(ClassNotFoundException e){
	System.out.println(e);
} 
if (session.getAttribute("id")!= null) {
    
	response.sendRedirect("desc.jsp?car="+Integer.parseInt(request.getParameter("car"))); 
} 	
else{
Connection conn=null;
PreparedStatement ps = null;
PreparedStatement sp = null;


int  delete = (request.getParameter("del") == null) ? 0 : Integer.parseInt(request.getParameter("del"));


try{
	conn =  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott99","tiger");
	 ps = conn.prepareStatement("SELECT * FROM products WHERE pid=?");
	 sp = conn.prepareStatement("delete FROM cart WHERE userid=? and pid=?");
	 if(delete==0){
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
		   <form action="add" method="get">
		       </br>
		       <select name="qty">
  <option value="1">1</option>
  <option value="2">2</option>
  <option value="3">3</option>
  <option value="4">4</option>
               </select></br>
		       <button type="submit"  name="carid" value="<%=rs.getInt(1)%>"><h3>Add to Cart!!!!</h3></button>
		   
		   </form>
		   
		   </div>
		  
		  <%}
	 else{
		 Integer userid = (Integer)session.getAttribute("id");
		 sp.setInt(1,userid.intValue());
		 sp.setInt(2,delete);
		 sp.executeQuery();
		 response.sendRedirect("cart.jsp");
	 }
		  
	 
	  
  
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
}}
%>



</body>
</html>