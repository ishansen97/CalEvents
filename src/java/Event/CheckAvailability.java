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
import java.time.LocalTime;
import java.time.temporal.ChronoUnit;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author hp
 */
@WebServlet(name = "CheckAvailability", urlPatterns = {"/CheckAvailability"})
public class CheckAvailability extends HttpServlet {

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
            DBConnect connect = DBConnect.getInstance();
            String query = null;
//        ResultSet result = null;
//            String location = "H001";
//            LocalTime startTime = LocalTime.parse("01:00:00");
//            LocalTime endTime = LocalTime.parse("04:00:00");
//            String date = "2018-09-09";
            
            String location = request.getParameter("loc");
            String date = request.getParameter("date");
            LocalTime startTime = LocalTime.parse(request.getParameter("start"));
            LocalTime endTime = LocalTime.parse(request.getParameter("end"));

            if (location == null || date == null || startTime == null || endTime == null){
                out.println("{ error: true, msg:\"incomplete request\" }");
            }
            else if (connect.isConnected()) { 
                Connection con = connect.getCon();

                query = "SELECT * FROM `public_events` "
                        + "WHERE location_ID = ? "
                        + "AND date=? ";

                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, location);
                ps.setString(2, date);
//                out.println(ps.toString());
//                out.println("<br>");
                ResultSet rs = ps.executeQuery();

                Boolean dateValid = true;
//                out.println("<h1>" + startTime + " - " + endTime + "</h1>");
                while (rs.next()) {
//                    out.println(rs.getString("start_time") + " to " + rs.getString("end_time"));
//                    out.println("::");
                    LocalTime st = LocalTime.parse(rs.getString("start_time")).minus(2, ChronoUnit.HOURS);
                    LocalTime et = LocalTime.parse(rs.getString("end_time")).plus(2, ChronoUnit.HOURS);

//                    out.println("RANGE: " + st + " to " + et + " === ");
                    if (startTime.compareTo(et) > 0) {
//                        out.println("new_start after end = true");
                        dateValid = true;
                    } else if (endTime.isBefore(st)) {
//                        out.println("new_end before start = true");
                        dateValid = true;
                    } else {
                        dateValid = false;
//                        out.println("<br>");
                        break;
                    }
//                    out.println("<br>");
                }
                out.println("{ valid: " + dateValid + " }");
//                out.println("valid: " + dateValid);
            }
        } catch (Exception ex) {
            Logger.getLogger(CheckAvailability.class.getName()).log(Level.SEVERE, null, ex);
            PrintWriter out = response.getWriter();
//            out.println(ex.getMessage());
            out.println("{ error: true, msg:\""+ex+"\" }");
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
