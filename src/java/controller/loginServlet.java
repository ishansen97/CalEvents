package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Customer;

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
		
	
		//String uname = request.getParameter("uname");
                String user = request.getParameter("user");
		String pass = request.getParameter("pass");
		String email = request.getParameter("email");
                
                	Customer c = new Customer();	
		
		
		
		c.setEmail(pass);
		ICustomerService iCustomerService = new CustomerServiceImp();
		
		iCustomerService.updateRegister(user, c);
				
		
		
		iCustomerService.loginCheck(pass, email);		
		iCustomerService.GetID(pass, email);
		
		String id = iCustomerService.GetID( pass, email);

		
                
		if(iCustomerService.loginCheck(pass,email)) {
			
			/*if(utype.equals("admin")) {
				
				HttpSession session = request.getSession();
				//session.setAttribute("username", uname);
				session.setAttribute("id", id);
				RequestDispatcher dispatcher = request.getRequestDispatcher("AdminProfile.jsp");	
				dispatcher.forward(request, response);
				
			}*/
			//else if(utype.equals("customer")) {
				
				HttpSession session = request.getSession();
				//session.setAttribute("username", uname);
				session.setAttribute("id", id);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("CusProfile.jsp");
				dispatcher.forward(request, response);
			//}
		}
		
		else {
			
			
			
			response.sendRedirect("login.jsp");
			
		}
		

		
	}

}


