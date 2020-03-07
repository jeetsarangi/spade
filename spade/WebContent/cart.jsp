<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Your cart</title>
</head>
<body>
<h1 style="color:blue" align="center">CART</h1></br>
<%@page import="java.sql.*" %>
<h3><p align="right"> <a href="logout">Logout</a> </p></h3>
<h3><p align="right"> <a href=" ">Search</a> </p></h3>
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
PreparedStatement sp = null;

if (session.getAttribute("id") == null) {
    response.sendRedirect("login.html"); // Not logged in, redirect to login page.
} 		
else {


Integer userid = (Integer)session.getAttribute("id");

try{
	conn =  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott99","tiger");
	 ps = conn.prepareStatement("SELECT * FROM cart WHERE userid=?");
         sp = conn.prepareStatement("Select *from products where pid=?");


    ps.setInt(1,userid.intValue());
    ResultSet rs = ps.executeQuery();
    
    
    ResultSet sr;
    int p_id;
    int total=0;
    %>
    <div align="center">
    <% 
    if(!(rs.next())){
    	%>  <h1 style="color:red" align="center">Nothing added till now to add goto<a href="products.jsp">search</a></h1></br> <%
    }
    do{
  	
    	sp.setInt(1,rs.getInt(2));
    	sr=sp.executeQuery();
  	    sr.next();
  	  %>
  	   

	  <form action="desc.jsp" method="get">
	  <table>
	  <tr>
	  <%=rs.getString(3) %>number of-<%=sr.getString(2)%>
	  
	  </br>
	  <button type="submit" name="del" value="<%=sr.getString(1)%>" >delete</button>
	  <button type="submit" name="car" value="<%=sr.getString(1)%>" ><img src="<%=sr.getString(4) %>" height="150" width="120"></button>
	  </tr>
	 </br>
	 </table>
	  </form>
	 <%
  	 
	 
	 for(int i=0;i<rs.getInt(3);i++) 
	 total=total+sr.getInt(6);
  	    }while(rs.next());
    session.setAttribute("total",total);

%>
</div>
</br>
<div align="center">
<form action="pay.jsp" method="get">
<button type="submit" name="total" value="<%=total %>">Checkout</button>
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
}

  %>
  </body>
  </html>