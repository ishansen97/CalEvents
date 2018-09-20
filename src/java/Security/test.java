/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Security;

import Employee.Attendance;
import java.util.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
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
@WebServlet(name = "test", urlPatterns = {"/E-Management/test"})
public class test extends HttpServlet {

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

//            String date = request.getParameter("bday");
//            out.print(date);
//            HashPassword hashPassword = new HashPassword("960563506V");
//            try {
//              /  out.print(hashPassword.generatePassword());
//            } catch (Exception ex) {
//                Logger.getLogger(test.class.getName()).log(Level.SEVERE, null, ex);
//            }
//                     try{
//                    Date date = new Date();
//                    SimpleDateFormat dateFormat = new SimpleDateFormat ("yyyy:MM:dd");
//                    SimpleDateFormat timeFormat = new SimpleDateFormat ("H:m:s");
//                    
//                    String currentDate = dateFormat.format(date);
//                    String currentTime = timeFormat.format(date);
//
//                    Attendance attendence = new Attendance("1000", currentDate);
//                    
//                    int sql = attendence.recordArrivalTime(currentTime);
//                    if (sql > 0) {out.print("Inserted");}
//
//                    }catch(Exception e){}
                    
//                    Attendance attendence = new Attendance("1000", currentDate);
//            try {
//                int sql = attendence.recordArrivalTime(currentTime);
////            out.print("");
//            } catch (ClassNotFoundException ex) {
//                Logger.getLogger(test.class.getName()).log(Level.SEVERE, null, ex);
//            } catch (SQLException ex) {
//                Logger.getLogger(test.class.getName()).log(Level.SEVERE, null, ex);
//            }
//                    request.getRequestDispatcher("../User/test.jsp").include(request, response);
//                    response.sendRedirect("/CalEvents/Home.jsp"); 

                Attendance att = new Attendance("1000", "2018-09-17");
                try{
                    String leave = att.checkForLeaves();
                out.print(leave);
                if(leave.equals(null)){
                out.print("Hello");}
                }catch(Exception e){
                    out.print(e);
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
