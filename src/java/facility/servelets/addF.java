/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facility.servelets;

import facilities.event.Facility;
import facilities.event.KitchenUtensils;
import facilities.event.Sounds;
import facilities.event.Tents;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author User
 */
public class addF extends HttpServlet {

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
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet addfacilityservelet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet addfacilityservelet at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("Inside");
        String buttonTents = request.getParameter("tents");
        String buttonSounds = request.getParameter("sounds");
        String buttonKitchen = request.getParameter("kitchen");
        String buttonChairs = request.getParameter("chairs");
        String buttonLights = request.getParameter("lights");
        String buttonTables = request.getParameter("tables");
        
        if(buttonTents!=null){
            String type = "tents";
            String name = request.getParameter("name").toString();
            
            String quantityStr = request.getParameter("quantity").toString();
            int quantity = Integer.parseInt(quantityStr);
            String condition = request.getParameter("condition").toString();
            String color = request.getParameter("color").toString();
            String size = request.getParameter("size").toString();
                   
                Facility tents = new Tents(name,quantity,condition,color,size);
                String message = tents.add_Facility();
                
                HttpSession session = request.getSession();
                session.setAttribute("FacilityErrorMessage", message);
                response.sendRedirect("Facility/facility_admin.jsp");
//                request.setAttribute("errorMessage", message);
//                RequestDispatcher rd = request.getRequestDispatcher("Facility/facility_admin.jsp");
//                rd.forward(request, response);       
                
        }
        else if(buttonSounds!=null){
            String name = request.getParameter("name").toString();
            
            String quantityStr = request.getParameter("quantity").toString();
            int quantity = Integer.parseInt(quantityStr);
            String condition = request.getParameter("condition").toString();
            String brand = request.getParameter("brand").toString();
            
                Facility sounds = new Sounds(name,brand,quantity,condition);
                String message = sounds.add_Facility();
                
                HttpSession session = request.getSession();
                session.setAttribute("FacilityErrorMessage", message);
                response.sendRedirect("Facility/facility_admin.jsp");
            
        }
        else if(buttonKitchen!=null){
            String name = request.getParameter("name").toString();
            
            String quantityStr = request.getParameter("quantity").toString();
            int quantity = Integer.parseInt(quantityStr);
            String condition = request.getParameter("condition").toString();
            String type = request.getParameter("type").toString();
            
                Facility kitchen = new KitchenUtensils(name,quantity,condition,type);
                String message = kitchen.add_Facility();
                
                HttpSession session = request.getSession();
                session.setAttribute("FacilityErrorMessage", message);
                response.sendRedirect("Facility/facility_admin.jsp");
        }
        else if(buttonChairs!=null){
            String type = "chairs";
            out.println(type);
        }
        else if(buttonLights!=null){
            String type = "lights";
            out.println(type);
        }
        else if(buttonTables!=null){
            String type = "tables";
            out.println(type);
        }
        else{
            String error = "error";
            out.println(error);
        }
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
