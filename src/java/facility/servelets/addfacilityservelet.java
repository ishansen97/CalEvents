/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facility.servelets;

import com.payment.FacilityExpense;
import com.payment.utils.Fmt;
import facilities.event.Chairs;
import facilities.event.Facility;
import facilities.event.KitchenUtensils;
import facilities.event.Lights;
import facilities.event.Sounds;
import facilities.event.Tables;
import facilities.event.Tents;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
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
        
        boolean error = false;
        String message;
        
        String facilityType = null;
        String name = request.getParameter("name");
        String quantityStr = request.getParameter("quantity");
        String condition = request.getParameter("condition");
        String unitPrice = request.getParameter("price");
        double price = Double.parseDouble(unitPrice);
        int quantity = Integer.parseInt(quantityStr);
        
        HashMap<String, String> extra = new HashMap<String, String>();

        if (buttonTents != null) {
            facilityType = "Tents";
            String color = request.getParameter("color").toString();
            String size = request.getParameter("size").toString();
            
            extra.put("Color", color);
            extra.put("Size", size);
            
            Facility tents = new Tents(name, quantity, condition, color, size);
            message = tents.add_Facility();    
            
        } else if (buttonSounds != null) {
            facilityType = "Sounds";
            String brand = request.getParameter("brand").toString();

            Facility sounds = new Sounds(name, brand, quantity, condition);
            message = sounds.add_Facility();
            
        } else if (buttonKitchen != null) {
            facilityType = "Kitchen";
            String type = request.getParameter("type").toString();
            
            extra.put("Utensil Type", type);

            Facility kitchen = new KitchenUtensils(name, quantity, condition, type);
            message = kitchen.add_Facility();
        } else if (buttonChairs != null) {
            facilityType = "Chair";
            String material = request.getParameter("material").toString();
            
            extra.put("Material", material);

            Facility chairs = new Chairs(name, quantity, condition, material);
            message = chairs.add_Facility();

//            HttpSession session = request.getSession();
//            session.setAttribute("FacilityErrorMessage", message);
//            response.sendRedirect("Facility/facilityActivities.jsp");
        } else if (buttonLights != null) {
            facilityType = "Lights";

            Facility lights = new Lights(name, quantity, condition);
            message = lights.add_Facility();
//
//            HttpSession session = request.getSession();
//            session.setAttribute("FacilityErrorMessage", message);
//            response.sendRedirect("Facility/facilityActivities.jsp");

        } else if (buttonTables != null) {
            facilityType = "Tables";
            String size = request.getParameter("tSize").toString();
            String noOfC = request.getParameter("chairs").toString();
            String shape = request.getParameter("shape").toString();
            
            extra.put("Tent Size", size);
            extra.put("Number of chairs", noOfC);
            extra.put("Shape", shape);

            Facility tables = new Tables(name, quantity, condition, size, noOfC, shape);
            message = tables.add_Facility();
        } else {
            message = "error";
            error = true;
            out.println(message);
        }
        
        if (!error) {
            out.println("<pre>");
            
//            String facilityType = null;
//        String name = request.getParameter("name");
//        String quantityStr = request.getParameter("quantity");
//        String condition = request.getParameter("condition");
//        String unitPrice = request.getParameter("price");
//        double price = Double.parseDouble(unitPrice);
//        int quantity = Integer.parseInt(quantityStr);

            FacilityExpense expense = new FacilityExpense(facilityType, name, condition, quantity, price, extra);
            
            out.println("category: " + expense.getType());
            out.println("desc: " + expense.getDescription());
            out.println("notes: " + expense.getExtra());
            out.println("amount: " + expense.getTotalAmount());
            out.println("</pre>");
            
            request.setAttribute("type", expense.getType());
            request.setAttribute("desc", expense.getDescription());
            request.setAttribute("notes", expense.getExtra());
            request.setAttribute("amount", expense.getTotalAmount());
            
            RequestDispatcher rd = request.getRequestDispatcher("/Facility/facility_payment.jsp");
            rd.forward(request, response);
            
//            HttpSession session = request.getSession();
//            session.setAttribute("FacilityErrorMessage", message);
//            response.sendRedirect("Facility/facilityActivities.jsp");
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
