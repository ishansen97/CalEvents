/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package event.facility.servelets;

import event.facilities.Facility;
import event.facilities.Sounds;
import event.facilities.Tents;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
public class delete extends HttpServlet {

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
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet delete</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet delete at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }                                                                           
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
//        processRequest(request, response);        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String name = request.getParameter("idT");
        String view = request.getParameter("view");
//        out.println(name);
        out.println(view);

        if(view.equals("facilitytent")){
        Facility facility = new Tents();
        try {
            
            String id = facility.getItemID(view, name);
            String message = "failed!";
            if(facility.remove_Facility(id)){
                message = "Deleted!! ";
            }
            
                HttpSession session = request.getSession();
                session.setAttribute("FacilityErrorMessage", message);
                response.sendRedirect("Facility/facility_admin.jsp");
            
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(delete.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(delete.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        }
        
        else if(view.equals("facilitysound")){
            Facility facility = new Sounds();
            
            try {
                
                String id = facility.getItemID(view, name);
                out.println(id);
//                facility.remove_Facility(id);
//            
//                String message = "failed!";
//            
//                if(facility.remove_Facility(id)){
//                message = "Deleted!! ";
//                }   
//            
//                HttpSession session = request.getSession();
//                session.setAttribute("FacilityErrorMessage", message);
//                response.sendRedirect("Facility/facility_admin.jsp");
            
                
                
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(delete.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(delete.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
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
