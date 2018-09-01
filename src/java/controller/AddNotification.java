/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Notification;
import service.INotificationService;
import service.NotificationImp;

/**
 *
 * @author Shashi Perera
 */
@WebServlet(name = "AddNotification", urlPatterns = {"/AddNotification"})
public class AddNotification extends HttpServlet {

    public AddNotification() {
      
    }
    

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
                        PrintWriter out = response.getWriter();
        
        
			
			String notify = request.getParameter("notify");
			String userID = request.getParameter("userID");
                        out.println("working");
			
			
			Notification n = new Notification();
			
			
			n.setNotify(notify);
			
			n.setUserID(userID);
			
			
			INotificationService iNotificationService = new NotificationImp();
			if (iNotificationService.insertNotification(n)) {
                            request.setAttribute("n", n);
	
			request.getRequestDispatcher("NotificationAd.jsp").forward(request, response);
                        }
                        else
                            out.println("error");
			
			//request.setAttribute("f", f);
	
			//request.getRequestDispatcher("Feedback.jsp").forward(request, response);
		
	
    }
}
