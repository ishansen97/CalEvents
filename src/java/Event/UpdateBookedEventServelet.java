/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Event;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author hp
 */
@WebServlet(name = "UpdateBookedEventServelet", urlPatterns = {"/UpdateBookedEventServelet"})
public class UpdateBookedEventServelet extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateBookedEventServelet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateBookedEventServelet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
            
            String event_id = request.getParameter("B_event_ID");
            String event_name = request.getParameter("B_event_name");
            String Category = request.getParameter("B_category");
            String Description = request.getParameter("B_description");
            String newDate = request.getParameter("B_newDate");
            String start_time = request.getParameter("new_B_start_time")+":00";
            String end_time = request.getParameter("new_B_end_time")+":00";
            String location = request.getParameter("B_location");
            String no_seats = request.getParameter("B_seats");
            
            out.println("start time:"+start_time);
            
            Time start = Time.valueOf(start_time);
            Time end = Time.valueOf(end_time);
            Date date = Date.valueOf(newDate);
            Integer seats = Integer.valueOf(no_seats);
             
            out.println("start time2:"+start_time);
            
            Booked_Event updateEvent = new Booked_Event(event_name,Category,Description,date,start,end,location,seats);
            out.println("object is created");
            
            if(updateEvent.isUpdated(event_id)){
                out.println("updated");
            }
            else{
                out.println("not updated");
            }
            
        }catch (ClassNotFoundException ex) {
            Logger.getLogger(UpdateEventServelet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateEventServelet.class.getName()).log(Level.SEVERE, null, ex);
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
