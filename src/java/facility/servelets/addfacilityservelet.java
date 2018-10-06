/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facility.servelets;

import facilities.event.Chairs;
import facilities.event.Facility;
import facilities.event.KitchenUtensils;
import facilities.event.Lights;
import facilities.event.Sounds;
import facilities.event.Tables;
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
        String buttonTents = request.getParameter("tentss");
        String buttonSounds = request.getParameter("soundss");
        String buttonKitchen = request.getParameter("kitchens");
        String buttonChairs = request.getParameter("chairss");
        String buttonLights = request.getParameter("lightss");
        String buttonTables = request.getParameter("tabless");
        
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
                response.sendRedirect("Facility/facilityActivities.jsp");
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
                response.sendRedirect("Facility/facilityActivities.jsp");
            
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
                response.sendRedirect("Facility/facilityActivities.jsp");
        }
        else if(buttonChairs!=null){
            
            String name = request.getParameter("name").toString();
            
            String quantityStr = request.getParameter("quantity").toString();
            int quantity = Integer.parseInt(quantityStr);
            
            String condition = request.getParameter("condition").toString();
            String material = request.getParameter("material").toString();
            
                Facility chairs = new Chairs(name,quantity,condition,material);
                String message = chairs.add_Facility();
                
                
                HttpSession session = request.getSession();
                session.setAttribute("FacilityErrorMessage", message);
                response.sendRedirect("Facility/facilityActivities.jsp");                  
        }
        else if(buttonLights!=null){
            
            String name = request.getParameter("name").toString();
            
            String quantityStr = request.getParameter("quantity").toString();
            int quantity = Integer.parseInt(quantityStr);
            
            String condition = request.getParameter("condition").toString();
            
                Facility lights = new Lights(name,quantity,condition);
                String message = lights.add_Facility();
                
                
                HttpSession session = request.getSession();
                session.setAttribute("FacilityErrorMessage", message);
                response.sendRedirect("Facility/facilityActivities.jsp");    
            
            
        }
        else if(buttonTables!=null){
            String name = request.getParameter("name").toString();
            
            String quantityStr = request.getParameter("quantity").toString();
            int quantity = Integer.parseInt(quantityStr);
            
            String condition = request.getParameter("condition").toString();
            String size = request.getParameter("tSize").toString();
            String noOfC = request.getParameter("chairs").toString();
            String shape = request.getParameter("shape").toString();
                   
                Facility tables = new Tables(name,quantity,condition,size,noOfC,shape);
                String message = tables.add_Facility();
                
                HttpSession session = request.getSession();
                session.setAttribute("FacilityErrorMessage", message);
                response.sendRedirect("Facility/facilityActivities.jsp");
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
