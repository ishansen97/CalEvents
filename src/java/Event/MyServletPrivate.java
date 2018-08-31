/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Event;

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
@WebServlet(name = "MyServletPrivate", urlPatterns = {"/MyServletPrivate"})
public class MyServletPrivate extends HttpServlet {

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
        try{
            PrintWriter out = response.getWriter(); 
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet MyServletPrivate</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MyServletPrivate at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
            
            String event_name = request.getParameter("eventName");
            String Customer_Name = request.getParameter("CustomerName");
            String phoneNo = request.getParameter("phoneNo");
            String email = request.getParameter("email");
            Date start_date = Date.valueOf(request.getParameter("date"));
            out.println("middle");
            String start_time = request.getParameter("start_time") + ":00";
            String end_time = request.getParameter("end_time") + ":00";
            
            String location = request.getParameter("location");
            //out.println("between date and time");
            //out.println("Date: " + start_date);
            Time start = Time.valueOf(start_time);
            Time end = Time.valueOf(end_time);
            
            //out.println("start time : " + start_time + "\n");
            //out.println("end time : " + end_time + "\n");
            
            //out.println("before");
            
            Private_event pEvent = new Private_event(event_name,Customer_Name,phoneNo,email,start_date,start,end,location);
            //out.println("Working");
            
            if (pEvent.isInserted()) {
                out.println("row is inserted");
            }
            else {
                out.println("row is not inserted");
            }
        } catch (Exception ex) {
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
