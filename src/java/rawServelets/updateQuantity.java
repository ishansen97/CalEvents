/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rawServelets;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import test.Raw_Materials;

/**
 *
 * @author Lini Eisha
 */
@WebServlet(name = "updateQuantity", urlPatterns = {"/updateQuantity"})
public class updateQuantity extends HttpServlet {

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
            out.println("<title>Servlet updateQuantity</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updateQuantity at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        
        PrintWriter PrintWriterout = response.getWriter();
        
        String addremove = request.getParameter("addremove");
        if(addremove == null){
            out.println("Error");
        }
        
        if(addremove.equals("add")){
        String name = request.getParameter("name");
        double qty = Double.parseDouble(request.getParameter("qty"));
            
        Raw_Materials raw = new Raw_Materials(name,qty);
            try {
             
                String message = raw.incrementQuantity(name, qty);
                
                if(message.equalsIgnoreCase("record added!"))response.sendRedirect("Kitchen/qtyUpdated.jsp");
                else response.sendRedirect("Kitchen/errorUpdatingQty.jsp");
                
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(updateQuantity.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(updateQuantity.class.getName()).log(Level.SEVERE, null, ex);
            }
        
            }
            
            if(addremove.equals("remove")){
        String name = request.getParameter("name");
        double qty = Double.parseDouble(request.getParameter("qty"));
            
        Raw_Materials raw = new Raw_Materials(name,qty);
            try {
             
                String message = raw.incrementQuantity(name, qty);
                
                if(message.equalsIgnoreCase("record added!"))response.sendRedirect("Kitchen/qtyUpdated.jsp");
                else response.sendRedirect("Kitchen/errorUpdatingQty.jsp");
                
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(updateQuantity.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(updateQuantity.class.getName()).log(Level.SEVERE, null, ex);
            }
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    }    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
