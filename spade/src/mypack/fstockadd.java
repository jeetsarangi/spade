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
import java.sql.*;

public class fstockadd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public fstockadd() {
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
			PreparedStatement sp = null;
			
			 
			 int add =Integer.parseInt( request.getParameter("add"));
			int id = Integer.parseInt( request.getParameter("id"));
			 
			 try{
				 conn =  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SCOTT99","tiger");
				 ps = conn.prepareStatement("update products SET pstock=pstock+? where pid=?");
			     sp = conn.prepareStatement("select * from products where pid=?");
				 ps.setInt(1,add);
			     ps.setInt(2, id);
			     sp.setInt(1, id);
			     ResultSet rs = sp.executeQuery();
			     ps.executeQuery();
			     rs.next();
			     response.sendRedirect("filter.jsp?type="+rs.getString(7));
			     
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
	}

}
