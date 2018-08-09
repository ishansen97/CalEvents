/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.payment;

import com.payment.exception.CreditCardExpiredException;
import com.payment.exception.CreditCardNumberInvalidException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author muammar
 */
@WebServlet(name = "ProcessPayment", urlPatterns = {"/ProcessPayment"})
public class ProcessPayment extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     *
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String resId = request.getParameter("reservationId");
        String amount = request.getParameter("paymentAmount");

        String ccNo = request.getParameter("cardNumber");
        String ccName = request.getParameter("cardName");
        String ccCCV = request.getParameter("cardCCV");
        String expMM = request.getParameter("expiryMonth");
        String expYY = request.getParameter("expiryYear");

        ccNo = ccNo.replaceAll(" ", "");
        ccNo = ccNo.replaceAll("-", "");

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Payment</title>");
            out.println("</head>");
            out.println("<body>");

            out.println("<pre>");
            out.println("Card Number: " + ccNo);
            out.println("  Card Name: " + ccName);
            out.println("        CCV: " + ccCCV);
            out.println("     Expiry: " + expMM + "/" + expYY);
            out.println("</pre>");

            try {
                SimpleDateFormat format = new SimpleDateFormat("yy-MM");
                String expiryString = expYY + "-" + expMM;
                Date expiry = format.parse(expiryString);

                CreditCardValidator ccValidator = new CreditCardValidator(ccNo, ccName, ccCCV, expiry);
                ccValidator.validate();

                Payment payment = new Payment(resId, amount, "Credit Card");
                payment.insertPayment();
            } catch (CreditCardExpiredException ex) {
                out.println("<h1><b>Error!</b> Credit Card has expired!</h1>");
                Logger.getLogger(ProcessPayment.class.getName()).log(Level.WARNING, null, ex);
            } catch (CreditCardNumberInvalidException ex) {
                out.println("<h1><b>Error!</b> Credit Card number is invalid!</h1>");
                Logger.getLogger(ProcessPayment.class.getName()).log(Level.WARNING, null, ex);
            } catch (java.sql.SQLIntegrityConstraintViolationException ex) {
                out.println("<h1><b>Error!</b> Reservation has already been paied for!</h1>");
                Logger.getLogger(ProcessPayment.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                out.println("<h1><b>Error!</b> Failed to process payment!</h1>");
                Logger.getLogger(ProcessPayment.class.getName()).log(Level.SEVERE, null, ex);
            }

            out.println("</body>");
            out.println("</html>");
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     *
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
