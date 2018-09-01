/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.INotificationService;
import service.NotificationImp;

/**
 *
 * @author Shashi Perera
 */
@WebServlet(name = "DeleteNotification", urlPatterns = {"/DeleteNotification"})
public class DeleteNotification extends HttpServlet {

    public DeleteNotification() {
        super();
        // TODO Auto-generated constructor stub
    }
    

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nid = request.getParameter("nid");			
		
		INotificationService iNotificationService = new NotificationImp();
		iNotificationService.deleteNotification(nid);

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/NotificationAd.jsp");
		dispatcher.forward(request, response);
        
    }

}
