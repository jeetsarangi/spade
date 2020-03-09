<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Stock details</title>
<style>
table,th,td{
padding:10px;
border:1px solid black;
border-collapse:collapse;

}

</style>
</head>
<body>
<h1 style="color:blue" align="center">Stock Update</h1></br>
<%@page import="java.sql.*" %>
<h3><p align="right"> <a href="logout">Logout</a> </p></h3>

<% if (session.getAttribute("admin") == null) {
    response.sendRedirect("login.html"); 
} 		
else {
%>
<div style="float:right">
<form action="filter.jsp" method="get">



<tr>
<td>Add Filter</td>
<td><select name="type">
        <option value="sedan">sedan</option>
        <option value="SUV">SUV</option>
        <option value="Sports">Sports</option>
        <option value="parts">parts</option>
        
      </select>
</td></tr>
<tr><td><input type="submit" value="add"></td></tr>



</form>

</div>
<div style="float:left">
<form action="change" method="get">



<select name="change">
        <option value="Stock Details">Stock Details</option>
        
        <option value="Product Entry">Product Entry</option>
        <option value="Order Details">Order Details</option>
        <option value="User Details">Users Details</option>
      </select>
<input type="submit" value="change">





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
Connection conn=null;
PreparedStatement ps = null;
try{
	conn =  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott99","tiger");
	 ps = conn.prepareStatement("SELECT * FROM products");
	 ResultSet rs = ps.executeQuery();
	 if(!(rs.next())){
		 %>
		 <p align="center"><h1 style="color:red">nothing added in product table please add at <a href="options.jsp">Product Entry</a></h1></h1></p>
		 <%}else{
			 %>
			  <form action="search2.jsp" method="get" >
	  <input type="text" name="key" placeholder="search here">
	  <input type="submit" value="search"> 
	  
	  
	  
	  </form></br></br>
			 
			 
			 
			 
			 
			 
			
		<table style="width:2000">
  <tr>
    <th>Product Name</th>
    <th>Image</th>
    <th>Stock</th>
    <th>Add to stock</th> 
  </tr>
  <%do { %>
   
  
  <tr>
   <form action="desc2.jsp" method="get">
    <td> <%=rs.getString(2) %></td>
    <td><button type="submit" name="car" value="<%=rs.getInt(1)%>"><img src=<%=rs.getString(4) %> alt="Smiley face" height="42" width="50"></button></td>
    <td><%=rs.getInt(5) %></td>
   </form>
   <form action="stockadd" method="get">
    <td>
    <input type="text" name=add size="20">
     <button type="submit" name="id" value="<%=rs.getInt(1)%>" >Add</button>
 </form> 
  </td></tr>
  
 
			
			 
			 
			 
			 
			 
			 
		 <%
			}while(rs.next());
  %>
  </table>
 
  
  <% 
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
 }

%>





<%}%>

</body>
</html>