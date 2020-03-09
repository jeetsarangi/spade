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


public class stockadd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public stockadd() {
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
			
			 
			 int add =Integer.parseInt( request.getParameter("add"));
			int id = Integer.parseInt( request.getParameter("id"));
			 
			 try{
				 conn =  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SCOTT99","tiger");
				 ps = conn.prepareStatement("update products SET pstock=pstock+? where pid=?");
			     ps.setInt(1,add);
			     ps.setInt(2, id);
			     ps.executeQuery();
			     response.sendRedirect("stock.jsp");
			     
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
