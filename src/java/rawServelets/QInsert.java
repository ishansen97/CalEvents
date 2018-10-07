/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rawServelets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
public class QInsert extends HttpServlet {

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
            out.println("<title>Servlet QInsert</title>");
            out.println("</head>");
            out.println("<body>");
            String[] rawName = request.getParameterValues("rawName");
            String[] rawQuantity = request.getParameterValues("ingQuantity");
            String menuItemName = request.getParameter("menu_ID");
            String rawID = "";
            String menuID = "";

            

            boolean error = false;
            try {
                deterineAllocaio ins = new deterineAllocaio();
                fetch fetch = new fetch();
                menuID = fetch.getMenuID(menuItemName);

                out.print(rawName.length);
                for (int i = 0; i < rawName.length; i++) {
                    out.print("<br>Raw item Name : " + rawName[i]);

                    rawID = fetch.getItemID(rawName[i].trim());
                    double q = Double.parseDouble(rawQuantity[i].trim());
                    out.print("<br>Raw item id : " + fetch.getItemID(rawName[i].trim()));
                    if (!ins.insertDtermine(rawID, menuID, rawName[i].trim(), menuItemName, q)) {
                        error = true;
                        break;
                    }
                    out.println("<h1>" + rawQuantity[i] + "</h1>");

                }
                if (!error) {
                    HttpSession session = request.getSession();
                    session.setAttribute("message", "Data Inserted");
                    response.sendRedirect("Kitchen/determine.jsp");
                }
                out.print("<br>Menu item Name : " + menuItemName);
                out.print("<br>Menu item id : " + menuID);
                out.println("</body>");
                out.println("</html>");
            } catch (SQLException ex) {
                Logger.getLogger(QInsert.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(QInsert.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                ex.printStackTrace();
                out.println(ex);
            }
        } catch (Exception ex) {
            Logger.getLogger(QInsert.class.getName()).log(Level.SEVERE, null, ex);
        }

//        PreparedStatement pstmt = 
//                conn.prepareStatement("select * from employee where id in (?)");
//Array array = conn.createArrayOf("VARCHAR", new Object[]{"1", "2","3"});
//pstmt.setArray(1, array);
//ResultSet rs = pstmt.executeQuery();
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

        PrintWriter out = response.getWriter();

//        int item_id = Integer.parseInt(request.getParameter("item_id"));
//        String rawID = request.getParameter("rawID");
//        double ingQuantity = Double.parseDouble(request.getParameter("ingQuantity"));
//        
//        
//        Raw_Determine rawd = new Raw_Determine(item_id ,rawID , ingQuantity);
//        String message = rawd.detRaw();
//        
//        if(message.equalsIgnoreCase("new record inserted"))response.sendRedirect("Kitchen/adminOperations.jsp");
//        else if(message.equalsIgnoreCase("new record not inserted"))response.sendRedirect("Kitchen/errorInserting.jsp");
//        else if(message.equalsIgnoreCase("raw material already exist"))response.sendRedirect("Kitchen/wrong.jsp");
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
