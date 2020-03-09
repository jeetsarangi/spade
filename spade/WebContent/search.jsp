<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Products</title>
</head>
<body >
<%@page import="java.sql.*" %>
<h3><p align="right"> <a href=" cart.jsp">Cart</a> </p></h3>
<h2 style="color:blue;"><center>Select Product</center></h2>
 <h3><p align="right"> <a href="logout">Logout</a> </p></h3>
 <div align="center">
<%	
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
}
catch(ClassNotFoundException e){
	System.out.println(e);
} 


Connection conn=null;
PreparedStatement ps = null;

String key = request.getParameter("key");
String key2 = "%"+key+"%";

try{
	conn =  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott99","tiger");
	 ps = conn.prepareStatement("Select * FROM products WHERE pname LIKE ? ");
	 ps.setString(1,key2);
	 
	 
	 ResultSet rs= ps.executeQuery();
  
	 
	 
	 if(!(rs.next())){
	  %> <h1>no result</h1><%
  }
  else{ 
	 %>
	   <form action="" method="" >
	  <input type="text" name="key" placeholder="search here">
	  <input type="submit" value="search"> 
	  
	  
	  
	  </form></br></br>
	 
	 
	 
	 
	 
	 <%
	  
	  
	  
	  
	  
	  do{
	  
	  %>
	
	  
	 
	  <form action="desc.jsp " method="get">
	  
	 
	  <button type="submit" name="car" value="<%=rs.getInt(1)%>" ><img src="<%=rs.getString(4) %>" height="150" width="120"></button>
	  <h3 style="color:blue"><%=rs.getString(2)%></h3>
	  </br>
	  
	  
	  </form>
	  
	  
	  <%
	  
	  }while(rs.next());
}}
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
%>
 </div>