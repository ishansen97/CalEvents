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
import test.fetch;

/**
 *
 * @author Lini Eisha
 */
public class QInsert extends HttpServlet {

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
            out.println("<title>Servlet QInsert</title>");            
            out.println("</head>");
            out.println("<body>");
            String[] rawName = request.getParameterValues("rawName");
            String[] rawQuantity = request.getParameterValues("ingQuantity");
            String menuItemName = request.getParameter("menu_ID");
            String rawID = "";
            out.print("<br>"+menuItemName);
            
            for(int i = 0 ; i < rawName.length ; i++){
            out.println("<h1>" + rawName[i] + "</h1>");
            
                
                out.print("<br>"+rawID);
           
            out.println("<h1>" + rawQuantity[i] + "</h1>");
            }
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
        
        PrintWriter out = response.getWriter();
        
//        int item_id = Integer.parseInt(request.getParameter("item_id"));
//        String rawID = request.getParameter("rawID");
//        double ingQuantity = Double.parseDouble(request.getParameter("ingQuantity"));
//        
//        
//        Raw_Determine rawd = new Raw_Determine(item_id ,rawID , ingQuantity);
//        String message = rawd.detRaw();
//        
//        if(message.equalsIgnoreCase("new record inserted"))response.sendRedirect("Kitchen/adminOperations.jsp");
//        else if(message.equalsIgnoreCase("new record not inserted"))response.sendRedirect("Kitchen/errorInserting.jsp");
//        else if(message.equalsIgnoreCase("raw material already exist"))response.sendRedirect("Kitchen/wrong.jsp");
        
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
