<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Users Details</title>
<style>
table,th,td:not(#x){
padding:10px;
border:1px solid black;
border-collapse:collapse;

}
#x{
border:1px solid white;
}
</style>
</head>
<body>
<h1 style="color:blue" align="center">Users Detais</h1></br>
<%@page import="java.sql.*" %>
<h3><p align="right"> <a href="logout">Logout</a> </p></h3>

<% if (session.getAttribute("admin") == null) {
    response.sendRedirect("login.html"); 
} 		
else {
%>

<div style="float:left">
<form action="change" method="get">



<select name="change">
        <option value="User Details">Users Details</option>
        <option value="Stock Details">Stock Details</option>
        
        <option value="Product Entry">Product Entry</option>
        <option value="Order Details">Order Details</option>
        
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
	 ps = conn.prepareStatement("SELECT * FROM users");
	 ResultSet rs = ps.executeQuery();
	 if(!(rs.next())){
		 %>
		 <p align="center"><h1 style="color:red">nothing added in Users table </h1></p>
		 <%}else{
			 %>
			 
			 
			 
			 
			 
			 
			 
			
		<table style="width:2000">
  <tr>
    <th>Username</th>
    <th>Firstname</th>
    <th>Lastname</th>
    <th>Gender</th> 
  <th>Email</th>
<th>Contack No</th>
    <th>City</th>
  <th>State</th>
  <th>Address</th>
  </tr>
  <%do { %>
   
  
  <tr>
 
    
    <td> <%=rs.getString(2) %></td>
    <td><%=rs.getString(4) %></td>
    <td><%=rs.getString(5) %></td>
  <%   switch (rs.getString(6))
			{
			
			case "m": 
			    %> <td>male</td><% 
			    break; 
				
			
			case "f": 
				 %> <td>female</td><%  
			    break;
			case "o": 
				 %> <td>others</td><% 
			    break;    
		    
			}
    %>
    
    
    
    <td><%=rs.getString(7) %></td>   
   <td><%=rs.getLong(8) %></td>
   <td><%=rs.getString(9) %></td>
   <td><%=rs.getString(10) %></td>
   <td><%=rs.getString(11) %></td>
 <%if(!(rs.getString(2).equals("admin"))) {%>
 <form action="deleteuser" method="get">
  <td id="x"><button type="submit" name="del" value="<%=rs.getInt(1)%>">Delete</button></td>
    </form>
    <%} %>
 
  </tr>
  
 
			
			 
			 
			 
			 
			 
			 
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