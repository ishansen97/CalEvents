/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facilities.allocation;

import facilities.event.DBConnect;
import facilities.event.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author User
 */
public class determinefacilities extends HttpServlet {

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
            out.println("<title>Servlet determinefacilities</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<center>");
            
            //initializing
            Facility t;
            Facility c;
            Facility s;
            String tentID = "";
            String[] tentname;
            int packIQ = 0;
            int available = 0;
            int allocatedTentQ = 0;
            int allocatedChairsQ = 0;
            
            String availableChairQuantity = "";
            String availableTentQuantity = "";
            String tname= "";
            ArrayList<String> itemIds = new ArrayList();
            ArrayList<Integer> availableitemQ = new ArrayList();
            int chairFMessage = 0;
            int tentSMessage = 0;
            int tentFMessage = 0;
            String[] itemSMessage ;
            String[] itemFSMessage ; 
            String eventsId = request.getParameter("eventsID");
            
            //chairs
            String chair_quantity = request.getParameter("quantityforallocat");
            c = new Chairs();
            int caq = c.getAvailableQuantity("C005");
            availableChairQuantity = Integer.toString(caq);
            
            //tents
            String tentwithsize = request.getParameter("tents");
            tentname = tentwithsize.split("\\(",2);
            tname = tentname[0];
            try {
            t = new Tents();
                
                tentID = t.getItemID(tentname[0]);
                availableTentQuantity = Integer.toString(t.getAvailableQuantity(tentID));
                
            } catch (Exception ex) {
                Logger.getLogger(determinefacilities.class.getName()).log(Level.SEVERE, null, ex);
            } 
            
            //package
            String[] package_items_quantities = request.getParameterValues("Facquantityforallocation");
            String[] package_item_names = request.getParameterValues("packageFacility");
            s = new Sounds();
            for(int i = 0 ; i < package_item_names.length; i++){
                try {
                    
                    itemIds.add(s.getItemID(package_item_names[i]));
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(determinefacilities.class.getName()).log(Level.SEVERE, null, ex);
                } catch (SQLException ex) {
                    Logger.getLogger(determinefacilities.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            
            String[] ids = itemIds.toArray(new String[itemIds.size()]);
            
            for(int j=0; j<ids.length;j++){
                availableitemQ.add(s.getAvailableQuantity(ids[j]));
            }
            
            Integer[] itaq = availableitemQ.toArray(new Integer[availableitemQ.size()]);
            String[] itemQuantity = new String[itaq.length];
            
            for(int k=0;k<itaq.length;k++)
                itemQuantity[k] = String.valueOf(itaq[k]);
            
            
            HttpSession session = request.getSession();
            session.setAttribute("requestedChairQuantity",chair_quantity);
            session.setAttribute("availableChairQuantity",availableChairQuantity);
            session.setAttribute("tentwithsize",tentwithsize);
            session.setAttribute("eventsId",eventsId);
            session.setAttribute("availableTentQuantity",availableTentQuantity);
            session.setAttribute("tentID",tentID);
            session.setAttribute("package_item_names",package_item_names);
            session.setAttribute("package_items_quantities",package_items_quantities);
            session.setAttribute("ids",itemQuantity);
            session.setAttribute("itemids",ids);
            response.sendRedirect("Facility/allocated.jsp");
            
            
            
            
            
           

            out.println("</center>");
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
