<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product entry</title>
</head>
<body>
<h1 style="color:blue" align="center">Products Entry</h1></br>
<%@page import="java.sql.*" %>
<h3><p align="right"> <a href="logout">Logout</a> </p></h3>
<h3 style="color:red" align="center">Product has been entered</h3></br>
<% 


if (session.getAttribute("admin") == null) {
    response.sendRedirect("login.html"); 
} 		
else {
	if(request.getParameter("x")==null)
	{
		response.sendRedirect("options.jsp");
	}
	else{


%>
<div style="float:left">
<form action="change" method="get">



<select name="change">
        <option value="Product Entry">Product Entry</option>
       
        <option value="Stock Details">Stock Details</option>
        <option value="Order Details">Order Details</option>
        <option value="User Details">Users Details</option>
      </select>
<input type="submit" value="change">





</form>

</div>






<div align="center">
<form action="entry" method="get">
<table width="400">
<tr>
<td>Product Name:</td>
<td><Input type="text" name="pname" size="20"></td>
</tr>
<tr>
<td>Product Description</td>
<td><textarea name="desc" cols="100" rows="6"></textarea></textarea></td>
</tr>
<tr>
<td>Product Image Name</td>
<td><Input type="text" name="img"></td>
<tr>
<td>Stock</td>
<td><Input type="number" name="stock"></td>
</tr>
</tr>
<td>Price</td>
<td><Input type="number" name="price"></td>
</tr>
<tr>
<td>Type</td>
<td><select name="type">
        <option value="sedan">sedan</option>
        <option value="SUV">SUV</option>
        <option value="Sports">Sports</option>
        <option value="parts">parts</option>
        
      </select>
</td></tr>
<tr>
<td></td>
<td>
<input type="submit" >
</td></tr>
</table>
</form>
</div>












<% 
}}
%>


</body>
 </html>