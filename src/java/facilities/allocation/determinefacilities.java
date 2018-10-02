/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facilities.allocation;

import facilities.event.DBConnect;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author User
 */
public class determinefacilities extends HttpServlet {

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
            out.println("<title>Servlet determinefacilities</title>");
            out.println("</head>");
            out.println("<body>");
            String packageName = request.getParameter("privatePackageName");

            PreparedStatement getfacilitiesforpackage = null;
            DBConnect dbconnect = DBConnect.getInstance();
            ResultSet facilitiesforpackage = null;
            ArrayList<String> facilitiestoallocate = new ArrayList();

            try {
                if (dbconnect.isConnected()) {
                    Connection con = dbconnect.getCon();
                    getfacilitiesforpackage = con.prepareStatement("SELECT `facilitiyName` FROM `packagesview` WHERE `packageName` = ?");
                    getfacilitiesforpackage.setString(1, packageName);

                    facilitiesforpackage = getfacilitiesforpackage.executeQuery();

                    while (facilitiesforpackage.next()) {

                        facilitiestoallocate.add(facilitiesforpackage.getString("facilitiyName"));

                    }

                    HttpSession session = request.getSession();
                    session.setAttribute("requirede", facilitiestoallocate);
                    response.sendRedirect("Facility/requiredfacilities.jsp");

                    out.println("</body>");
                    out.println("</html>");
                }
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(determinefacilities.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(determinefacilities.class.getName()).log(Level.SEVERE, null, ex);
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
