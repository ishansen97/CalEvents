/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package reservation;

import com.payment.CreditCardValidator;
import com.payment.Payment;
import com.payment.exception.CreditCardExpiredException;
import com.payment.exception.CreditCardNumberInvalidException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
@WebServlet(name = "ReservationServelet1", urlPatterns = {"/ReservationServelet1"})
public class ReservationServelet1 extends HttpServlet {

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
            out.println("<title>Servlet ReservationServelet1</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ReservationServelet1 at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
            
            //creating a session object an acquiring values
            HttpSession session = request.getSession();
            String customer = session.getAttribute("customer_id").toString();
            
            //getting payment details
            String amount = request.getParameter("paymentAmount");
            String cardName = request.getParameter("cardName");
            String expMonth = request.getParameter("expiryMonth");
            String expYear = request.getParameter("expiryYear");
            String cardNum = request.getParameter("cardNumber");
            String CCV = request.getParameter("cardCCV");
            
            cardNum = cardNum.replaceAll(" ", "");
            cardNum = cardNum.replaceAll("-", "");
            
            SimpleDateFormat format = new SimpleDateFormat("yy-MM");
            String expiryString = expYear + "-" + expMonth;
            Date expiry = format.parse(expiryString);
            
            CreditCardValidator ccValidator = new CreditCardValidator(cardNum, cardName, CCV, expiry);
            //ccValidator.validate();
            
            
            SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
            java.util.Date d = new java.util.Date();
            String sdate = sdf.format(d);
            
            //getting reservation details
            String event = request.getParameter("event");
            String cus_id = customer;
            String seat_arr = request.getParameter("seat_num");
            java.sql.Date date = java.sql.Date.valueOf(sdate);
            
            Reservation res = new Reservation(event,seat_arr,cus_id,date);


            if (res.isInserted()) {
                String reservation = res.getRes_id();
                Payment payment = new Payment(reservation, amount, "Credit Card");
                if (payment.insertPayment())
                    response.sendRedirect(request.getContextPath() + "/Calendar/calendar.jsp");
                else
                    out.println("payment cannot be made");
            }
            else
                out.println("cannot be inserted");
         
            
        } 
        catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ReservationServelet.class.getName()).log(Level.SEVERE, null, ex);
            ErrorHandling.setMessage(ex.getMessage());
            response.sendRedirect(request.getContextPath() + "/Calendar/error.jsp");
        
        }
//        catch (CreditCardExpiredException ex) {
//            Logger.getLogger(ReservationServelet.class.getName()).log(Level.SEVERE, null, ex);
//            PrintWriter out = response.getWriter();
//            out.println(ex.getMessage());
//        }
//        catch (CreditCardNumberInvalidException ex) {
//            Logger.getLogger(ReservationServelet.class.getName()).log(Level.SEVERE, null, ex);
//            PrintWriter out = response.getWriter();
//            out.println(ex.getMessage());
//        }
        catch (Exception ex) {
            Logger.getLogger(ReservationServelet.class.getName()).log(Level.SEVERE, null, ex);
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
