package mypack;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class change extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public change() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		if (session.getAttribute("admin") == null) {
		    response.sendRedirect("login.html"); 
		} 		
		else {
			String change = request.getParameter("change");
			
			switch (change)
			{
			
			case "Product Entry": 
			    response.sendRedirect("options.jsp"); 
			    break; 
				
			
			case "Stock Details": 
			    response.sendRedirect("stock.jsp"); 
			    break;
			case "Order Details": 
			    response.sendRedirect("orders.jsp"); 
			    break;
			case "User Details": 
			    response.sendRedirect("usersdetails.jsp"); 
			    break;
		    
			}
			
			
			
			
		}
	}

}
