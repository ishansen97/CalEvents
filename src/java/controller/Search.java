package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Search
 */
@WebServlet("/Search")
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String name = request.getParameter("name");
			String cus_id = request.getParameter("cus_id");
	        	        
	        request.setAttribute("name", name);
	        request.setAttribute("cus_id", cus_id);
	        
	       request.getRequestDispatcher("/CusSearch.jsp").forward(request, response); 
	      
	        
	        
	}

}
