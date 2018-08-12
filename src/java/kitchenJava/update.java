/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kitchenJava;

import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Lini Eisha
 */
@WebServlet(name = "update", urlPatterns = {"/update"})
public class update extends HttpServlet {

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
            out.println("<title>Servlet update</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet update at " + request.getContextPath() + "</h1>");
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
    
    
    response.setContentType("text/html;charset=UTF-8");
         
         PrintWriter out = response.getWriter();
         
             String Accept = request.getParameter("Accept");
            if (Accept == null) {
                 out.println("No Button selected...!");
         
          } 
            
            else if (Accept.equals("ACCEPT")) { 
    
                String o = request.getParameter("o_id");
                String m= request.getParameter("Menu");
                String d = request.getParameter("Date");
                
                           Accept con = new Accept();
                           con.update(o, m,d);
                           
                           
             RequestDispatcher dispatcher = request.getRequestDispatcher("viewOders.jsp");
             dispatcher.forward(request, response);
          }
                           
            
            /*else if (UpdateDelete.equals("REQUEST")) {

                
                String e = request.getParameter("oId");
                String d = request.getParameter("Menu");
                String f = request.getParameter("Date");
                
                           Accept con = new Accept();
                           con.update(e,d,f);
                           
                         RequestDispatcher dispatcher = request.getRequestDispatcher("viewOders.jsp");
                         dispatcher.forward(request, response);
                    }*/
                
                }
            
            
            
            
    }
