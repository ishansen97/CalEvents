/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Employee;

import Log.Activity;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dell
 */
@WebServlet(name = "Process_Leave", urlPatterns = {"/E-Management/Process-Leave"})
public class Process_Leave extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            String actor = request.getSession().getAttribute("p_id").toString();

            String action = request.getParameter("action");
            String empId = request.getParameter("empId");
            String date = request.getParameter("date");
            String leaveType = request.getParameter("type");
            
            Activity activity = new Activity();

            try {
                

                if (action.equals("requestLeave")) {

                    String department = request.getParameter("department");

                    int result = Attendance.scheduleLeaveRequest(empId, date, leaveType);
                    
                    if (result > 0) {
//                        activity.recordActivity(actor, empId + " has submitted leave for " + date, "Employee " + empId + " has submitted a scheduled " + leaveType + " leave request for approval on " + date);
                        request.getSession().setAttribute("message", "Request to schedule leave successfully submitted");
                    } else {
                        request.getSession().setAttribute("message", "Error in confirming leave request");
                    }

                    switch (department) {

                        case "Event Department":
                            response.sendRedirect("/CalEvents/E-Management/Dashboard");
                            break;
                        case "Menu Department":
                            response.sendRedirect("/CalEvents/EManagement/Dashboard");
                            break;
                        case "Gallery Department":
                            response.sendRedirect("/CalEvents/Administrator/Dashboard");
                            break;
                        case "Facility Department":
                            response.sendRedirect("/CalEvents/Administrator/Dashboard");
                            break;
                        case "Kitchen Department":
                            response.sendRedirect("/CalEvents/Administrator/Dashboard");
                            break;
                        case "Customer Department":
                            response.sendRedirect("/CalEvents/Administrator/Dashboard");
                            break;
                        case "Employee Department":
                            response.sendRedirect("/CalEvents/E-Management/Dashboard");
                            break;
                    }

                }
                if (action.equals("confirmRequest")) {

                    int result01 = Attendance.confirmLeaveRequest(empId, date, leaveType);

                    if (result01 > 0) {
//                        activity.recordActivity(actor, empId + " has been approved for leave on " + date, "Employee " + empId + " has been approved for a " + leaveType + " leave on " + date);
                        request.getSession().setAttribute("message", "Request to schedule leave successfully confirmed");
                    } else {
                        request.getSession().setAttribute("message", "Error in confirming leave request");
                    }
                    response.sendRedirect("Schedule-Leaves"); 

                }

            } catch (Exception e) {
//                out.print(e);
                request.getSession().setAttribute("message", e);
                response.sendRedirect("Schedule-Leaves");
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
