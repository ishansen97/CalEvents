/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Employee;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Uditha
 */
@WebServlet(name = "Update_Employee", urlPatterns = {"/E-Management/Update-Employee"})
public class Update_Employee extends HttpServlet {

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

            Object authenticate = request.getSession(false).getAttribute("authenticated");
            if (null != authenticate) {

                // Getting process type from employees.jsp
                String process = request.getParameter("action");

                try {
                    // if (process == read_employee) following will trigger else will be redirected back to Employees servelet
                    if ("read_Employee".equals(process)) {

                        // Read all the necessary fields specific to received employee id 
                        ResultSet res = Employee.readEmployee(request.getParameter("empId"));
                        while (res.next()) {

                            // Read table fields and set to session variables
                            request.getSession().setAttribute("id", res.getString("id"));
                            request.getSession().setAttribute("username", res.getString("username"));
                            request.getSession().setAttribute("nic", res.getString("nic"));
                            request.getSession().setAttribute("first_name", res.getString("first_name"));
                            request.getSession().setAttribute("last_name", res.getString("last_name"));
                            request.getSession().setAttribute("gender", res.getString("gender"));
                            request.getSession().setAttribute("address_line_01", res.getString("address_line_1"));
                            request.getSession().setAttribute("address_line_02", res.getString("address_line_2"));
                            request.getSession().setAttribute("city", res.getString("city"));
                            request.getSession().setAttribute("zip", res.getString("zip"));
                            request.getSession().setAttribute("country", res.getString("country"));
                            request.getSession().setAttribute("avatar", res.getString("avatar"));
                            request.getSession().setAttribute("privilege_mode", res.getString("privilege_mode"));
                            request.getSession().setAttribute("contact_number", res.getString("contact_number"));

                        }

                        // Setting active nav links
                        request.getSession().setAttribute("nav00", "w3-text-gray");
                        request.getSession().setAttribute("nav01", "");
                        request.getSession().setAttribute("nav02", "");
                        request.getSession().setAttribute("nav03", "");

                        request.getRequestDispatcher("/User/Update_Employee.jsp").forward(request, response);

                    } else {
                        // Clearing cache to avoid old avatar shown as the new avatar
                        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
                        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
                        response.setDateHeader("Expires", 0); // Proxies.
                        response.sendRedirect("Employees");
                    }

                } catch (Exception ex) {
                    Logger.getLogger(Process_Employee.class.getName()).log(Level.SEVERE, null, ex);
                }

            } else {
                response.sendRedirect("/CalEvents/Admin");
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
