/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package menu;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sohan
 */
@WebServlet(name = "RefreshmentsServlet", urlPatterns = {"/RefreshmentsServlet"})
public class RefreshmentsServlet extends HttpServlet {

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
            out.println("<title>Servlet RefreshmentsServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RefreshmentsServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
            
          String ref = request.getParameter("refresh_name");
          String ingredients = request.getParameter("refresh_Ingredients_name");
          double price = Double.parseDouble(request.getParameter("deserts_Price"));
          out.println("After geting the name");
            
          Refreshments refresh = new Refreshments(ref, ingredients, price);
          out.println("After creating the object");
          
          if(refresh.isInserted()) {
          
              response.sendRedirect(request.getContextPath()+ "/Menu/index.jsp");
          }
          else
              out.println("not Inserted ");
              
              
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RefreshmentsServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            PrintWriter out = response.getWriter();
            out.println(ex.getMessage());
            Logger.getLogger(RefreshmentsServlet.class.getName()).log(Level.SEVERE, null, ex);
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