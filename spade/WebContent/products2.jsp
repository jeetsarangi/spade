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
<h3><p align="right"> <a href="Home.html">Homepage</a> </p></h3>
<h2 style="color:blue;"><center>Select Product</center></h2>
 <h3><p align="right"> <a href="login.html">Login</a> </p></h3>


<div align="left">
 <form action="productfilter2.jsp" method="get">



<tr>
<td>Add Filter</td>
<td><select name="type">
         <option value="no">No Filter</option>
        <option value="sedan">sedan</option>
        <option value="SUV">SUV</option>
        <option value="Sports">Sports</option>
        <option value="parts">parts</option>
        
      </select>
</td></tr>
<tr><td><input type="submit" value="add"></td></tr>



</form>

</div>













 <div align="center">
<%	
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
}
catch(ClassNotFoundException e){
	System.out.println(e);
} 
if (session.getAttribute("id") != null) {
    response.sendRedirect("products.jsp"); 
} 	else{

Connection conn=null;
PreparedStatement ps = null;

String branch = request.getParameter("input");
try{
	conn =  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott99","tiger");
	 ps = conn.prepareStatement("SELECT * FROM products");
	 
	 
	 
	 ResultSet rs= ps.executeQuery();
  
	 
	 
	 if(!(rs.next())){
	  out.println("NOT AVAILABLE");
  }
  else{ 
	 %>
	   <form action="searchout.jsp" method="get" >
	  <input type="text" name="key" placeholder="search here">
	  <input type="submit" value="search"> 
	  
	  
	  
	  </form></br></br>
	 
	 
	 
	 
	 
	 <%
	  
	  
	  
	  
	  
	 int count=0;
	 do{
	  
	  %>
	
	  
	 
	  <form action="desc.jsp " method="get">
	  
	 
	  <button type="submit" name="car" value="<%=rs.getInt(1)%>" ><img src="<%=rs.getString(4) %>" height="150" width="120"></button>
	  <h3 style="color:blue"><%=rs.getString(2)%></h3>
	  
	  
	  
	  </br> 
	  
	  
	  </form>
	  
	  
	  <%
	  count++;
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
}}
%>
 </div>