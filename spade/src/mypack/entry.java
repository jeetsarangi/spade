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

public class entry extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public entry() {
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
		
		Connection conn=null;
		PreparedStatement ps = null;
		HttpSession session = request.getSession();
       
		
		
		
		if (session.getAttribute("admin") == null) {
		    response.sendRedirect("login.html"); 
		} 
		else {
			String pname = request.getParameter("pname");
			String desc = request.getParameter("desc");
			String img = request.getParameter("img");
			String img2 = "images/"+img;
			int stock = Integer.parseInt(request.getParameter("stock"));
			int price = Integer.parseInt(request.getParameter("price"));
			String type = request.getParameter("type");

			
			
			try{
				conn =  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott99","tiger");
				 
			    ps = conn.prepareStatement("insert into products values(pid.nextval,?,?,?,?,?,?)");
			    ps.setString(1,pname);
			    ps.setString(2,desc);
			    ps.setString(3,img2);
			    ps.setInt(4,stock);
			    ps.setInt(5,price);
			    ps.setString(6,type);
			    
			    
			    ps.executeQuery();

 
			    response.sendRedirect("options.jsp");

			    
			   
			
		
			
			
			
			
			
			
			
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
