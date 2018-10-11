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
@WebServlet(name = "AddMenuItem", urlPatterns = {"/AddMenuItem"})
public class AddMenuItem extends HttpServlet {

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
        try  {
            /* TODO output your page here. You may use following sample code. */
            PrintWriter out = response.getWriter();
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddMenuItem</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddMenuItem at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
            
            String itemName = request.getParameter("item_name");
            String category = request.getParameter("item_category");
            String ingredients = request.getParameter("item_ingredients");
            double price = Double.parseDouble(request.getParameter("item_price"));
            out.println("Affter getting the name");
            
            MenuItems item = new MenuItems(itemName, category, ingredients, price);
            out.println("After creating the object");
            
            if (item.isInserted()) {
                //out.println("Successfully inserted");
                response.sendRedirect(request.getContextPath()+ "/Menu/menu.jsp");
            }
            else
                out.println("not inserted");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AddMenuItem.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            PrintWriter out = response.getWriter();
            out.println(ex.getMessage());
            Logger.getLogger(AddMenuItem.class.getName()).log(Level.SEVERE, null, ex);
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
