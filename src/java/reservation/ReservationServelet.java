/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package reservation;

import com.payment.exception.CreditCardExpiredException;
import com.payment.exception.CreditCardNumberInvalidException;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.payment.*;
import customer.Customer;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
@WebServlet(name = "ReservationServelet", urlPatterns = {"/ReservationServelet"})
public class ReservationServelet extends HttpServlet {

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
            out.println("<title>Servlet ReservationServelet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ReservationServelet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
            
            //creating a session object
            HttpSession session = request.getSession();
            
            
            String cus_name = request.getParameter("fname");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            
            Customer customer = new Customer(cus_name, address, phone, email);
            
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
            ccValidator.validate();
            
            
            SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
            java.util.Date d = new java.util.Date();
            String sdate = sdf.format(d);
            
            //getting reservation details
            String event = request.getParameter("event");
            String cus_id = customer.generateCustomerId();
            String seat_arr = request.getParameter("seat_num");
            java.sql.Date date = java.sql.Date.valueOf(sdate);
            session.setAttribute("event_id", event);
            
            if (!customer.isEmailAvailable()) {
                if (customer.isInserted()) {
                    Reservation res = new Reservation(event,seat_arr,cus_id,date);

                    if (res.isInserted()) {
                        String reservation = res.getRes_id();
                        Payment payment = new Payment(reservation, amount, "Credit Card");
                        if (payment.insertPayment()) {
                            session.setAttribute("reservation", reservation);
                            session.setAttribute("customer_id", customer.getCus_id());
                            session.setAttribute("customer_name", customer.getFullName());
                            session.setAttribute("reservationObj", res);
                            session.setAttribute("customerObj", customer);
                            response.sendRedirect(request.getContextPath() + "/Calendar/successfulReservation.jsp");
                        }
                        else
                            response.sendRedirect(request.getContextPath() + "Calendar/paymentError.jsp");
                    }
                    else
                        response.sendRedirect(request.getContextPath() + "Calendar/reservationError.jsp");
                }
                else
                    response.sendRedirect(request.getContextPath() + "Calendar/customerError.jsp");
            }
            else {
                session.setAttribute("email", email);
                response.sendRedirect(request.getContextPath() + "/Calendar/insertCustomerDetails.jsp");
            }
            
        } 
        catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ReservationServelet.class.getName()).log(Level.SEVERE, null, ex);
            ErrorHandling.setMessage(ex.getMessage());
            PrintWriter out = response.getWriter();
            out.println(ex.getMessage());
            //response.sendRedirect(request.getContextPath() + "/Calendar/404.jsp");
        
        }
        catch (CreditCardExpiredException ex) {
            Logger.getLogger(ReservationServelet.class.getName()).log(Level.SEVERE, null, ex);
            PrintWriter out = response.getWriter();
            out.println(ex.getMessage());
            //response.sendRedirect(request.getContextPath() + "/Calendar/404.jsp");
        }
        catch (CreditCardNumberInvalidException ex) {
            Logger.getLogger(ReservationServelet.class.getName()).log(Level.SEVERE, null, ex);
            PrintWriter out = response.getWriter();
            out.println(ex.getMessage());
            //response.sendRedirect(request.getContextPath() + "/Calendar/404.jsp");
        }
        catch (Exception ex) {
            Logger.getLogger(ReservationServelet.class.getName()).log(Level.SEVERE, null, ex);
            PrintWriter out = response.getWriter();
            out.println(ex.getMessage());
            //response.sendRedirect(request.getContextPath() + "/Calendar/404.jsp");
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
