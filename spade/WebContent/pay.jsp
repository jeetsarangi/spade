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
   <table >
   
  <tr><td> Cardholder's Name:</td>
        <td><input type="text" id="cardholder" placeholder="eg:Jeet Sarangi" required/>
        </td></tr>
        
        <tr><td> Card Number:</td>
        <td><input type="text" id="cardholder" pattern="[\d]{16}" placeholder="eg:1234456767897890" required/>
        </td></tr>
        
        
        <tr><td>Valid thru:</td>
            <td><select name="month">
        <option value="">Jan</option>
        <option value="">Feb</option>
        <option value="">Mar</option>
        <option value="">Apr</option>
       <option value="">May</option>
       <option value="">Jun</option>
        <option value="">Jul</option>
       <option value="">Aug</option>
       <option value="">Sept</option>
       <option value="">Oct</option>
       <option value="">Nov</option>
       <option value="">Dec</option>
       
      </select>
      <select name="year">
        <option value="">2021</option>
        <option value="">2022</option>
        <option value="">2023</option>
        <option value="">2024</option>
       <option value="">2025</option>
       <option value="">2026</option>
        <option value="">2027</option>
       <option value="">2029</option>
       <option value="">2030</option>
       <option value="">2031</option>
       <option value="">2032</option>
       <option value="">2033</option>
       
      </select>
      
      
      
      
      </td></tr>
            
            <tr><td>CVV / CVC*</td>
            <td><input type="text"  name="cvv"
       pattern="[\d]{3}" placeholder="eg:123"
       required></td></tr>
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