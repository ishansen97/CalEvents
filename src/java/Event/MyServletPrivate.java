/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Event;

import Connection.ServerConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Time;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import menu.PrivateMenu;

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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        try {
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
            out.println("time" + start_time);
            String end_time = request.getParameter("end_time") + ":00";
            String tent = "0";

            String location = request.getParameter("location");
            int Crowd_Expected = Integer.parseInt(request.getParameter("crowdE"));
            //out.println("between date and time");
            //out.println("Date: " + start_date);
            Time start = Time.valueOf(start_time);
            Time end = Time.valueOf(end_time);

            //out.println("start time : " + start_time + "\n");
            //out.println("end time : " + end_time + "\n");
            //out.println("before");
            Private_event pEvent = new Private_event(event_name, Customer_Name, phoneNo, email, start_date, start, end, location, Crowd_Expected);
            //out.println("Working");

            String[] items = request.getParameterValues("menuItem");
            for (String s : items) {
                out.println(s + "<br>");
            }

            String venue, entPackage, chairs, noOfChairs, tents;

            venue = request.getParameter("inout");
            entPackage = request.getParameter("packageselected");
            chairs = request.getParameter("chairs");
            noOfChairs = request.getParameter("requiredChairs");
            tents = request.getParameter("tents");

            out.println(venue);
            out.println(entPackage);
            out.println(chairs);
            out.println(noOfChairs);
            out.println(tents);

            String insert_string
                    = "INSERT INTO `requiredfacilities`(`package`, `chairs`, `type`, `eventID`, `tent`) "
                    + "VALUES (?, ?, ?, ?, ?)";

            if (pEvent.isInserted()) {
                out.println("row is inserted");

                if (items.length > 0) {
                    PrivateMenu pvtMenu = new PrivateMenu(pEvent.getPEventId(), items);
                    if (pvtMenu.isInserted()) {
                        out.println("Inserted menu");
                    } else {
                        out.println("inserting menu failed");
                    }

                    try {
                        ServerConnection.setConnection();

                        String query = null;
                        if (ServerConnection.getConnectionStatus()) {
                            Connection con = ServerConnection.getConnection();
                            query = "INSERT INTO `requiredfacilities`(`package`, `chairs`, `type`, `eventID`, `tent`) "
                                    + "VALUES (?, ?, ?, ?, ?)";
                            PreparedStatement ps = con.prepareStatement(query);
                            ps.setString(1, entPackage);
                            ps.setString(2, chairs.equalsIgnoreCase("on") ? noOfChairs : null);
                            ps.setString(3, venue);
                            ps.setString(4, pEvent.getPEventId());
                            ps.setInt(5, tents.equalsIgnoreCase("ON") ? 1 : 0);

                            if (ps.executeUpdate() > 0) {
                                out.println("required facilities Success!");
                            }
                        } else {
                            out.println("required facilities Failed");
                        }
                    } catch (Exception ex) {
                        Logger.getLogger(MyServletPrivate.class.getName()).log(Level.SEVERE, null, ex);
                        out.println("Failed " + ex);
                    }
                }
            } else {
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
