package mypack;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
public class Registerservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Registerservlet() {
        super();
        // TODO Auto-generated constructor stub
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
		
		String usern = request.getParameter("uname");
		String email=request.getParameter("email");
	    String address=request.getParameter("address");
		String pass=request.getParameter("password");
		String cpass=request.getParameter("cpassword");
		long phone = Long.valueOf(request.getParameter("phone"));
		String gen=request.getParameter("gender");
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String city=request.getParameter("city");
		String state=request.getParameter("state");

		
		if(!(pass.equals(cpass)))
		{
			response.sendRedirect("register.html");	
		}
		try{
			conn =  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott99","tiger");
			ps = conn.prepareStatement("insert into users values(userid.nextval,?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1,usern);
			ps.setString(2,pass);
			ps.setString(3,fname);
			ps.setString(4,lname);
			ps.setString(5,gen);
			ps.setString(6,email);
			ps.setLong(7,phone);
			ps.setString(8,city);
			ps.setString(9,state);
			ps.setString(10,address);

			
			
			ps.executeUpdate(); 
			response.sendRedirect("login.html");   
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

	
	

}}}
