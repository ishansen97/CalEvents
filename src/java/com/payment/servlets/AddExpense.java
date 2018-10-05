/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.payment.servlets;

import com.payment.Expense;
import com.payment.ExpenseDao;
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
 * @author admin
 */
@WebServlet(name = "AddExpense", urlPatterns = {"/Payment/add_expense"})
public class AddExpense extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddExpense</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddExpense at " + request.getContextPath() + "</h1>");

            String dept = request.getParameter("dept");
            String desc = request.getParameter("desc");
            String method = request.getParameter("method");
            double amount = Double.parseDouble(request.getParameter("amount"));

            out.println(dept);
            out.println("<br>");
            out.println(desc);
            out.println("<br>");
            out.println(method);
            out.println("<br>");
            out.println(amount);

            Expense expense = new Expense(dept, desc, method, amount);
            try {
                ExpenseDao.createExpense(expense);
                response.sendRedirect("expenses.jsp");
            } catch (SQLException e) {
                out.println(e);
            } catch (Exception e) {
                out.println(e);
            }

            out.println("ID: " + expense.getId());
            out.println("<br>DATE" + expense.getDate().toString());

            out.println("</body>");
            out.println("</html>");

        } catch (Exception ex) {
            Logger.getLogger(AddExpense.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     *
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
