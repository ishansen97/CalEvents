/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package customer;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DELL
 */
public class CheckEmailAvailability extends HttpServlet {

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
        //response.setContentType("text/html;charset=UTF-8");
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet CheckEmailAvailability</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet CheckEmailAvailability at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
            
            String email = request.getParameter("email");
            Customer customer = new Customer(email);
            
            if (email == "") {
                out.write("<span><font color=red>Please enter your email</font></span>");
            }
            
            if (customer.isEmailAvailable()) {
                out.write("<span><font color=red>this email already exists</font></span>");
            }
            else {
                out.write("<span><font color=green>This email is okay</font></span>");
            }
        } catch (ClassNotFoundException ex) {
            PrintWriter out = response.getWriter();
            Logger.getLogger(CheckEmailAvailability.class.getName()).log(Level.SEVERE, null, ex);
            out.write(ex.getMessage());
        } catch (SQLException ex) {
            PrintWriter out = response.getWriter();
            Logger.getLogger(CheckEmailAvailability.class.getName()).log(Level.SEVERE, null, ex);
            out.write(ex.getMessage());
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
