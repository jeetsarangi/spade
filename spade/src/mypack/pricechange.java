package mypack;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class pricechange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public pricechange() {
        super();
        
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
		HttpSession session = request.getSession();

		if (session.getAttribute("admin") == null) {
		    response.sendRedirect("login.html"); 
		} 		
		else {
		
		
		Connection conn=null;
		PreparedStatement ps = null;
		
		 
		  int id = Integer.parseInt(request.getParameter("id"));
		 int price = Integer.parseInt(request.getParameter("price"));
		
		 try{
			 conn =  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SCOTT99","tiger");
			 ps = conn.prepareStatement("update products SET pprice=? where pid=?");
			 
			 ps.setInt(1,price);
			 ps.setInt(2,id);
		     ps.executeQuery();
		     response.sendRedirect("desc2.jsp?car="+id);
		
		
		
		
		
		
		
		 }  catch(SQLException e){
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
