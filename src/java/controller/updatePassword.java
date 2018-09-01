package controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
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
 *
 * @author Shashi Perera
 */
@WebServlet(urlPatterns = {"/updatePassword"})
public class updatePassword extends HttpServlet {

    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("text/html");
		
		Customer c = new Customer();	
		
		String user = request.getParameter("user");
		String password = request.getParameter("password");
		
		
		c.setPassword(password);
		
		ICustomerService cs = new CustomerServiceImp();
		cs.updateRegister(user,c);
		
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/login.jsp");
		dispatcher.forward(request, response);
		
    }

   
}
