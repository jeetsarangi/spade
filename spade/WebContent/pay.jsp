<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment Gateway</title>
</head>
<body background="b3.jpg" >
<div align="center">
    <h1 style="color:Blue">Payment</h1>
<%@page import="java.sql.*" %>
<h3><p align="right"> <a href="cart.jsp">Cart</a> </p></h3>
<%	int Total=0;
if(session.getAttribute("total")==null)
{
response.sendRedirect("cart.jsp");
}
else{
int sum;
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
}
catch(ClassNotFoundException e){
	System.out.println(e);
} 

Connection conn=null;
PreparedStatement ps = null;
PreparedStatement sp = null;
PreparedStatement stmt = null;
if(session.getAttribute("id")==null)
{
	response.sendRedirect("login.html");
}


Integer userid = (Integer)session.getAttribute("id");


try{
	conn =  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott99","tiger");
	 
    ps = conn.prepareStatement("SELECT * FROM cart WHERE userid=?");
    
    stmt = conn.prepareStatement("Select *from users where userid=?");
    stmt.setInt(1,userid.intValue());
    

    ResultSet us = stmt.executeQuery();
    us.next();
	 

    ps.setInt(1,userid.intValue());
    sp = conn.prepareStatement("Select *from products where pid=?");
    ResultSet rs = ps.executeQuery();
    ResultSet sr;
    while(rs.next()){ 
   sum=0;
    	sp.setInt(1,rs.getInt(2));
    	sr=sp.executeQuery();
  	    sr.next();
    %>
    <%=sr.getString(2)%>-<%=rs.getInt(3)%>=
    
    <% for(int i=0;i<rs.getInt(3);i++){
    	sum=sum+sr.getInt(6);
    }%>
    <%=sum %></br>
    
    
     
<% Total=Total+sum;
  } 
   %>
    
   </br>Delivery Charges=100</br>
   <% int amount=Total+100;%>
   Total Amount=<%=amount%>
   
   <form action="order" method="get">
   <table>
   
  <tr><td> <label for="cardholder">Cardholder's Name:</label>
        <input type="text" id="cardholder" />
        </td></tr>
        
        <tr><td>Valid thru:</td>
            <td><input type="text" id="date" placeholder="MM / YY" /></td></tr>
            
            <tr><td>CVV / CVC*</td>
            <td><input type="password" id="verification"/></td></tr>
   </br>
   </table>
 <button type="submit" name="amt" value="<%=amount%>">pay</button>
   
   </form>
   <% 
}catch(SQLException e){
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
  }}%>
</div>
</body>
</html>