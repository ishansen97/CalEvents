package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.FeedbackServiceImp;
import service.IFeedbackService;

/**
 * Servlet implementation class DeleteFeedback
 */
@WebServlet("/DeleteFeedback")
public class DeleteFeedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteFeedback() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fid = request.getParameter("fid");			
		
		IFeedbackService ifeedback = new FeedbackServiceImp();
		ifeedback.deleteFeedback(fid);

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Feedback.jsp");
		dispatcher.forward(request, response);
	}

}
