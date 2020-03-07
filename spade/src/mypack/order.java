package mypack;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;

public class order extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public order() {
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
		PreparedStatement cart = null;
		PreparedStatement sp = null;
		PreparedStatement order = null;
		PreparedStatement user = null;
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("id")==null)
		{
			response.sendRedirect("login.html");
		}
		else {
		Integer userid = (Integer)session.getAttribute("id");
		
		try{
			conn =  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott99","tiger");
			 
		    ps = conn.prepareStatement("SELECT * FROM cart WHERE userid=?");
		    sp = conn.prepareStatement("update products SET pstock=pstock-? where pid=?");
		    cart = conn.prepareStatement("Delete from cart where userid=?");
		    order=  conn.prepareStatement("insert into orders values(orderno.nextval,?,?,?,?,?,?)");
		    user =  conn.prepareStatement("Select * from users where userid=?");
		    
		    user.setInt(1,userid.intValue());
		    ResultSet u=user.executeQuery();
		    u.next();
		    
		    order.setString(1,u.getString(2));
		    order.setString(2,u.getString(9));
		    order.setString(3,u.getString(10));
		    order.setString(4,u.getString(11));
		    
		    ps.setInt(1,userid.intValue());
		    ResultSet rs= ps.executeQuery();
		  
		    
		    while( rs.next()) {
			   sp.setInt(1, rs.getInt(3));
			   sp.setInt(2, rs.getInt(2));
			   sp.executeQuery();
			   
			   order.setInt(5,rs.getInt(2));
			   order.setInt(6,rs.getInt(3));
			   order.executeQuery();
			    }
		    
		  cart.setInt(1, userid.intValue());
		  cart.executeQuery();
		
		  response.sendRedirect("done.html");
		
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
