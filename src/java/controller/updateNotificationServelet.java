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
@WebServlet(name = "updateNotificationServelet", urlPatterns = {"/updateNotificationServelet"})
public class updateNotificationServelet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        String nid = request.getParameter("nid");
        String notify = request.getParameter("notify");
        String userID = request.getParameter("userID");

        
        Notification n = new Notification();
        
        n.setNotify(notify);
        n.setUserID(userID);
        
        INotificationService iNotificationService = new NotificationImp();
        iNotificationService.updateNotification(nid, n);
        
        request.getRequestDispatcher("/updateNotification.jsp").forward(request, response);
              
        
        
    }

}
