package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Feedback;
import service.FeedbackServiceImp;
import service.IFeedbackService;


/**
 * Servlet implementation class updateFeedbackServlet
 */
@WebServlet("/updateFeedbackServlet")
public class updateFeedbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateFeedbackServlet() {
       }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
response.setContentType("text/html");
		
		response.setContentType("text/html");
		
		Feedback f = new Feedback();
		
		String fid = request.getParameter("fid");
		String username = request.getParameter("uernames");
		String email = request.getParameter("email");
		String subject = request.getParameter("subject");
		String comments = request.getParameter("comments");
		String userID = request.getParameter("userID");
	
		
		
		f.setFid(fid);
		f.setEmail(email);
		f.setUsername(username);
		f.setSubject(subject);
		f.setComments(comments);
		f.setUserID(userID);
		
		
		
		IFeedbackService iFeedbackService = new FeedbackServiceImp();
		iFeedbackService.updateFeedback(fid,f);
		
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Feedback.jsp");
		dispatcher.forward(request, response);
	
		
		
        }	
}
