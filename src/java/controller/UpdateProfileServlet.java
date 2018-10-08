package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Customer;
import service.CustomerServiceImp;
import service.ICustomerService;

/**
 * Servlet implementation class UpdateProfileServlet
 */
@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UpdateProfileServlet() {
        super();

    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		
		Customer c = new Customer();	
		
		String user = request.getParameter("user");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String contact_number = request.getParameter("contact_number");
		String email = request.getParameter("email");
		
		c.setFullName(name);
		c.setAddress(address);
		c.setContactNumber(contact_number);
		c.setEmail(email);
		
		ICustomerService cs = new CustomerServiceImp();
		cs.updateProfile(user, c);
		
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CusProfile.jsp");
		dispatcher.forward(request, response);
		
		
	}

}
