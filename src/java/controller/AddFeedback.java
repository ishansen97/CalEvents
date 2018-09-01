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
import model.Feedback;
import service.FeedbackServiceImp;
import service.IFeedbackService;

/**
 *
 * @author Shashi Perera
 */
@WebServlet("/AddFeedback")
public class AddFeedback extends HttpServlet {

    public AddFeedback() {
      
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
                        PrintWriter out = response.getWriter();
        
        
			
			//String username = request.getParameter("username");
			String email = request.getParameter("email");
			String subject = request.getParameter("subject");
			String comments = request.getParameter("comments");
			String userID = request.getParameter("userID");
                        out.println("working");
			
			
			Feedback f = new Feedback();
			
			
			//f.setUsername(username);
			f.setEmail(email);
			f.setSubject(subject);
			f.setComments(comments);
			f.setUserID(userID);
			
			
			IFeedbackService iFeedbackService = new FeedbackServiceImp();
			if (iFeedbackService.insertFeedback(f)) {
                            request.setAttribute("f", f);
	
			request.getRequestDispatcher("Feedback.jsp").forward(request, response);
                        }
                        else
                            out.println("error");
			
			//request.setAttribute("f", f);
	
			//request.getRequestDispatcher("Feedback.jsp").forward(request, response);
		
	
    }

    

}
