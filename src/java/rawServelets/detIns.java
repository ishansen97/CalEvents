/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rawServelets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import test.Raw_Determine;
import test.Raw_Materials;

/**
 *
 * @author Lini Eisha
 */
public class detIns extends HttpServlet {

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
        
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet detIns</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet detIns at " + request.getContextPath() + "</h1>");
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
        try {
            processRequest(request, response);
            
            response.setContentType("text/html;charset=UTF-8");
            
            PrintWriter out = response.getWriter();
            
            
            String foodID = getIDs("item_id" , "nameitems");
            String rawID = getIDs("rawID" , "name");
            double qty = Double.parseDouble(request.getParameter("qty"));
            
            
            
            Raw_Determine raw = new Raw_Determine(foodID,rawID,qty);
            
            String message;
            
            message = raw.detRaw();
            if(message.equalsIgnoreCase("new record inserted"))response.sendRedirect("Kitchen/adminOperations.jsp");
            else if(message.equalsIgnoreCase("new record not inserted"))response.sendRedirect("Kitchen/errorInserting.jsp");
            else if(message.equalsIgnoreCase("raw material already exist"))response.sendRedirect("Kitchen/wrong.jsp");
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(detIns.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(detIns.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private String getIDs(String item_id, String nameitems) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
