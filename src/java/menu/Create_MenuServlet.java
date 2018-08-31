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
@WebServlet(name = "Create_Menu", urlPatterns = {"/Create_Menu"})
public class Create_MenuServlet extends HttpServlet {

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
            out.println("<title>Servlet Create_Menu</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Create_Menu at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
            
            String appertizers = request.getParameter("app_menu");
            String main_dishes = request.getParameter("main_menu");
            String deserts = request.getParameter("desert_menu");
            String refreshments = request.getParameter("refresh_menu");
            
//            out.println("Appertizers : " + appertizers + "\n");
//            out.println("main dishes : " + main_dishes + "\n");
//            out.println("deserts : " + deserts + "\n");
//            out.println("refreshments : " + refreshments + "\n");

            EventMenu eventMenu = new EventMenu(appertizers, main_dishes, deserts, refreshments);
            
            if (eventMenu.isInserted()) {
                out.println("Inserted");
            }
            else {
                out.println("not inserted");
            }
            
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Create_MenuServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Create_MenuServlet.class.getName()).log(Level.SEVERE, null, ex);
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
