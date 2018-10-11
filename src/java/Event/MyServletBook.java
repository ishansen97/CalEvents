package Event;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author hp
 */
@WebServlet(urlPatterns = {"/MyServletBook"})
public class MyServletBook extends HttpServlet {

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
        try {
            PrintWriter out = response.getWriter();
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet MyServletBook</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MyServletBook at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
            
            String B_event_name = request.getParameter("B_eventName");
            String B_category = request.getParameter("B_category");
            String B_event_discription = request.getParameter("B_description");
            Date B_date = Date.valueOf(request.getParameter("B_start"));
            String B_start_time = request.getParameter("B_start_time")+":00";
            String B_end_time = request.getParameter("B_end_time")+":00";
            String location = request.getParameter("B_location");
            int seats = Integer.parseInt(request.getParameter("seats"));
            
            Time start = Time.valueOf(B_start_time);
            Time end = Time.valueOf(B_end_time);
            
            out.println("start time : " + B_start_time + "\n");
            out.println("end time : " + B_end_time + "\n");
            
            out.println("before");
            
            Booked_Event b_event = new Booked_Event( B_event_name,B_category, B_event_discription,B_date,start,end,location,seats);
            out.println("Object is created");
            
            out.println("New ID : " + b_event.generateBookEventId());
            
            if (b_event.isInserted()){
                out.println("row is inserted");response.sendRedirect(request.getContextPath()+"/Event/eventListB.jsp");
                
            }
            else{
                out.println("row not inserted");
            }
        }catch (Exception ex){
              PrintWriter out = response.getWriter();
                       ex.printStackTrace();
                    out.println("inside catch block");
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
