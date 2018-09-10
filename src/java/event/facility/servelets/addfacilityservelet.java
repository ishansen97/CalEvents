/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package event.facility.servelets;

import event.facilities.Chairs;
import event.facilities.Facility;
import event.facilities.KitchenUtensils;
import event.facilities.Sounds;
import event.facilities.Tents;
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
public class addfacilityservelet extends HttpServlet {

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
        
        
            String name = request.getParameter("name").toString();
            
            String quantityStr = request.getParameter("quantity").toString();
            int quantity = Integer.parseInt(quantityStr);
            String condition = request.getParameter("condition").toString();
        
        if(buttonTents!=null){
            out.print("tents");
//            String type = "tents";
//            String color = request.getParameter("color").toString();
//            String size = request.getParameter("size").toString();
//                   
//                Facility facility = new Tents(name,quantity,condition,color,size);
//                String addMessage = facility.add_Facility();
//                
//                HttpSession session = request.getSession();
//                session.setAttribute("FacilityErrorMessage", addMessage);
//                response.sendRedirect("Facility/facility_admin.jsp");
//                request.setAttribute("errorMessage", message);
//                RequestDispatcher rd = request.getRequestDispatcher("Facility/facility_admin.jsp");
//                rd.forward(request, response);       
                
        }
        if(buttonSounds!=null){
            
            String brand = request.getParameter("brand").toString();
            Facility sounds = new Sounds(name,brand,quantity,condition);
            
            String addMessage = sounds.add_Facility();
                
                HttpSession session = request.getSession();
                session.setAttribute("FacilityErrorMessage", addMessage);
                response.sendRedirect("Facility/facility_admin.jsp");
        }
        else if(buttonKitchen!=null){
            
            String type = request.getParameter("type").toString();
            
            Facility kitchen = new KitchenUtensils(name,quantity,condition,type);
            
            String addMessage = kitchen.add_Facility();
                
                HttpSession session = request.getSession();
                session.setAttribute("FacilityErrorMessage", addMessage);
                response.sendRedirect("Facility/facility_admin.jsp");
        }
        else if(buttonChairs!=null){
            
            String material = request.getParameter("material").toString();
            
            Facility chairs = new Chairs(name,quantity,condition,material);
            
            String addMessage = chairs.add_Facility();
                
                HttpSession session = request.getSession();
                session.setAttribute("FacilityErrorMessage", addMessage);
                response.sendRedirect("Facility/facility_admin.jsp");
        }
        else if(buttonLights!=null){
            
            String type = request.getParameter("type").toString();
            
            Facility kitchen = new KitchenUtensils(name,quantity,condition,type);
            
            String addMessage = kitchen.add_Facility();
                
                HttpSession session = request.getSession();
                session.setAttribute("FacilityErrorMessage", addMessage);
                response.sendRedirect("Facility/facility_admin.jsp");
        }
        else if(buttonTables!=null){
            
            String type = request.getParameter("type").toString();
            
            Facility kitchen = new KitchenUtensils(name,quantity,condition,type);
            
            String addMessage = kitchen.add_Facility();
                
                HttpSession session = request.getSession();
                session.setAttribute("FacilityErrorMessage", addMessage);
                response.sendRedirect("Facility/facility_admin.jsp");   out.println(type);
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
