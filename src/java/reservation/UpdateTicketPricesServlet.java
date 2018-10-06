/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package reservation;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DELL
 */
@WebServlet(name = "UpdateTicketPricesServlet", urlPatterns = {"/UpdateTicketPricesServlet"})
public class UpdateTicketPricesServlet extends HttpServlet {

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
            out.println("<title>Servlet UpdateTicketPricesServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateTicketPricesServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
            
            double[] price_arr = new double[3];
            
            String event_id = request.getParameter("event_id");
            double first_price = Double.parseDouble(request.getParameter("first_price"));
            double second_price = Double.parseDouble(request.getParameter("second_price"));
            double third_price = Double.parseDouble(request.getParameter("third_price"));
            
            price_arr[0] = first_price;
            price_arr[1] = second_price;
            price_arr[2] = third_price;
            
            if (ReservationManagement.isTicketPricesUpdated(event_id, price_arr)) {
//                RequestDispatcher dispatcher = request.getRequestDispatcher("/Calendar/reservation_details.jsp?event_id=" +event_id);
//                dispatcher.forward(request, response);
                  response.sendRedirect(request.getContextPath() + "/Calendar/reservation_details.jsp?event_id=" +event_id);
            }
            else
                out.println("cannot be updated");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UpdateTicketPricesServlet.class.getName()).log(Level.SEVERE, null, ex);
            PrintWriter out = response.getWriter();
            out.println(ex.getMessage());
        } catch (SQLException ex) {
            Logger.getLogger(UpdateTicketPricesServlet.class.getName()).log(Level.SEVERE, null, ex);
            PrintWriter out = response.getWriter();
            out.println(ex.getMessage());
        } catch (Exception ex) {
            Logger.getLogger(UpdateTicketPricesServlet.class.getName()).log(Level.SEVERE, null, ex);
            PrintWriter out = response.getWriter();
            out.println(ex.getMessage());
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
