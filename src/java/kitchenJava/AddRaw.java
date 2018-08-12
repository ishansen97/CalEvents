/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kitchenJava;

import Connection.ServerConnection;
import static Connection.ServerConnection.con;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
 * @author Lini Eisha
 */
@WebServlet(name = "AddRaw", urlPatterns = {"/AddRaw"})
public class AddRaw extends HttpServlet {

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
            out.println("<title>Servlet AddRaw</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddRaw at " + request.getContextPath() + "</h1>");
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
        
        
        
        String raw_material = request.getParameter("raw_material");
        int raw=0;
        
        try {
           
             ServerConnection db = ServerConnection.getInstance();
            Connection con = db.getConnection();
            
            raw = rs.getInt("r_ID");
            }
            if(raw>0)
            {
                response.sendRedirect("AddRawL.jsp");
            
            }
            else 
            {PreparedStatement ps = null;
            try {
                ps = con.prepareStatement("insert into raw_materials (name) values (?) AND (quantity) values (?) and (unitPrice) values(?)");
            } catch (SQLException ex) {
                Logger.getLogger(AddRaw.class.getName()).log(Level.SEVERE, null, ex);
            }
            ps.setString(1, raw);
            int c;
            try {
                ra = ps.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(AddRaw.class.getName()).log(Level.SEVERE, null, ex);
            }
            
                if(ra <=0){response.sendRedirect("AddRawS.jsp");}
                
                else {response.sendRedirect("AddRawF.jsp");}}
                
        } 

            catch (SQLException ex) {
            ex.printStackTrace();
        }

    public ResultSet fetch() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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
