package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Customer;
import service.CustomerServiceImp;
import service.ICustomerService;


/**
 * Servlet implementation class registerServlet
 */
@WebServlet("/registerServlet")
public class registerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public registerServlet() {

    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String contactNo = request.getParameter("contactNo");
		String email = request.getParameter("email");
		String userType = request.getParameter("userType");
		//String userName = request.getParameter("username");
		//String password = request.getParameter("password");
		
		Customer register = new Customer();
		
		register.setFullName(name);
		register.setAddress(address);
		register.setContactNumber(contactNo);
		register.setEmail(email);
		register.setUserType(userType);
		//register.setUserName(userName);
		//register.setPassword(password);
		
		
		
		ICustomerService iCustomerService = new CustomerServiceImp();
		iCustomerService.customerRegister(register);
		
		request.setAttribute("register", register);
		
		request.getRequestDispatcher("password.jsp").forward(request, response);
		
		
	
		
	/*	registerService registerServicee = new registerService();
		
		String registeredServicee = registerServicee.register(register);
		
		if(registeredServicee.equals("SUCCESS"))
		{
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		else
		{
			request.setAttribute("errMessage", registeredServicee);
			request.getRequestDispatcher("/Register.jsp").forward(request, response);
		}*/
		}
	
	}

