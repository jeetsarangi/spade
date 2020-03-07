package mypack;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;

public class Loginservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    
    public Loginservlet() {
       
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
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn=null;
		PreparedStatement ps = null;
		
		 
		 String tuserid = request.getParameter("userid");
		 String tpassword = request.getParameter("password");
		 
		 try{
			 conn =  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SCOTT99","tiger");
			 ps = conn.prepareStatement("SELECT * FROM users WHERE uname=? AND pass=?");
			 
			 ps.setString(1,tuserid);
			 ps.setString(2,tpassword);
			 
			 ResultSet rs= ps.executeQuery();
		     boolean found = rs.next();
		     
		     if (found)
		     {
		    	if(tuserid.equals("admin")) {
		    		HttpSession session = request.getSession();
		    		session.setAttribute("admin",rs.getInt(1));
		    		response.sendRedirect("done.html ");
		    	}
		    	else {
		    		HttpSession session = request.getSession();
		    	 session.setAttribute("id",rs.getInt(1));
		    	 response.sendRedirect("products.jsp");
		    	}   
		    }
		     else
		     {
		    	 response.sendRedirect("login.html");
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

}}

