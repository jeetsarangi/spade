package mypack;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;

public class add extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public add() {
       
    }
    public void init(){
    	try
    	{
    		Class.forName("oracle.jdbc.driver.OracleDriver");
    	}
    	catch(ClassNotFoundException e){
    		System.out.println(e);
    	}
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn=null;
		PreparedStatement ps = null;
   	 
		HttpSession session = request.getSession();
		if (session.getAttribute("id") == null) {
		    response.sendRedirect("login.html"); // Not logged in, redirect to login page.
		} else {
		    
		
		
		
		
		Integer userid = (Integer)session.getAttribute("id");
		
		
		
		int pid = Integer.parseInt(request.getParameter("carid"));
		int qty = Integer.parseInt(request.getParameter("qty"));
		
		 try{
			 conn =  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SCOTT99","tiger");
			 ps = conn.prepareStatement("insert into cart values(?,?,?)");
			 ps.setInt(1,userid.intValue());
			 ps.setInt(2,pid);
			 ps.setInt(3,qty);
			 
			 ps.executeQuery();
			 response.sendRedirect("cart.jsp");
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

}}