/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rawServelets;

import java.io.IOException;
import java.io.PrintWriter;
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
import test.Raw_Determine;
import test.fetch;
import testpackage.deterineAllocaio;

/**
 *
 * @author Lini Eisha
 */
public class AllocateRawMaterials extends HttpServlet {

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
            out.println("<title>Servlet AllocateRawMaterials</title>");
            out.println("</head>");
            out.println("<body>");

            String foodName = request.getParameter("nameM");
            String foodID = "";
            String rawID = "";
            String event_ID = "";
            String crowdExpected = request.getParameter("crowdExpected");
            ResultSet rawresult = null;
            fetch f = new fetch();
            event_ID = request.getParameter("eventID");

//            
            Raw_Determine det = new Raw_Determine();
            deterineAllocaio alloc = new deterineAllocaio();

            ArrayList<String> rawName = new ArrayList();
            ArrayList<Double> rawQ = new ArrayList();
            ArrayList<Double> total_Q = new ArrayList();
            ArrayList<Double> avalQ = new ArrayList();
//            

            int expected = Integer.parseInt(crowdExpected);
            boolean error = false;
            try {
                foodID = f.getMenuID(foodName.trim());
                rawresult = alloc.fetchNeededQuantity(foodID.trim());

                out.println("rawreseult");
                while (rawresult.next()) {
//                    rawName.add(rawresult.getString("rawID"));
//                    rawQ.add(rawresult.getDouble("quantity"));
                    String rn = rawresult.getString("rawID");
                    double qt = rawresult.getDouble("quantity");
                    double tl = qt * expected;
                    out.println(rn + " " + qt + " " + tl);
                    if (!alloc.insertToAllocate(event_ID, foodID, rawID, qt, expected, tl, det.getQuantity(rn))) {
                        error = true;
                        break;
                    }
                    out.println("sfafsf");

                }
//
                if (!error) {
                    out.println("AAAAAAAAAAAa");
                } else {
                    out.println("sdfsdsdgsdfgsdf");
                }
//                out.println("for loop");
//                for (int i = 0; i < rawName.size(); i++) {
//
////                out.print("<br> " + rawName.get(i));
////                out.print("<br> " + rawQ.get(i));
//                    total_Q.add(rawQ.get(i) * Integer.parseInt(crowdExpected));
////                out.print(event_ID+ foodID+ rawID+ rawQ.get(i)+ Integer.parseInt(crowdExpected)+ total_Q.get(i));
//                    avalQ.add(det.getQuantity(rawName.get(i)));
//
//                }
//                out.println("FOR LOOP 2");
//
//                for (int j = 0; j < rawName.size(); j++) {
//
//                    if (alloc.insertToAllocate(event_ID, foodID, rawID, rawQ.get(j), Integer.parseInt(crowdExpected), total_Q.get(j), avalQ.get(j))) {
//                        out.print("<br> done");
//                    } else {
//                        out.print("not done");
//                    }
//
//                }

                out.print("<br> " + event_ID);
                out.print("<br> " + foodName);
                out.print("<br> " + crowdExpected);
                out.print("<br> " + foodID);

                out.println("<h1>Servlet AllocateRawMaterials at " + request.getContextPath() + "</h1>");
                out.println("</body>");
                out.println("</html>");

            } catch (Exception ex) {
                out.print(ex);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AllocateRawMaterials.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AllocateRawMaterials.class.getName()).log(Level.SEVERE, null, ex);
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
