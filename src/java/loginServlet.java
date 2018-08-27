package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.CustomerServiceImp;
import service.ICustomerService;




@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
     
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
		String uname = request.getParameter("uname");
		String pass = request.getParameter("pass");
		String utype = request.getParameter("utype");
				
		ICustomerService iCustomerService = new CustomerServiceImp();
		
		iCustomerService.loginCheck(uname, pass, utype);		
		iCustomerService.GetID(uname, pass, utype);
		
		String id = iCustomerService.GetID(uname, pass, utype);

		
		if(iCustomerService.loginCheck(uname,pass,utype)) {
			
			if(utype.equals("admin")) {
				
				HttpSession session = request.getSession();
				session.setAttribute("username", uname);
				session.setAttribute("id", id);
				RequestDispatcher dispatcher = request.getRequestDispatcher("homePageCus.jsp");	
				dispatcher.forward(request, response);
				
			}
			else if(utype.equals("customer")) {
				
				HttpSession session = request.getSession();
				session.setAttribute("username", uname);
				session.setAttribute("id", id);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("homePageCus.jsp");
				dispatcher.forward(request, response);
			}
		}
		
		else {
			
			
			
			response.sendRedirect("login.jsp");
			
		}
		
	
	}

}


