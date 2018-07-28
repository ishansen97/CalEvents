/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Employee;

import Security.HashPassword;
import java.io.*;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

/**
 *
 * @author Uditha
 */
@MultipartConfig
@WebServlet(name = "Process_Employee", urlPatterns = {"/Administrator/Process_Employee"})
public class Process_Employee extends HttpServlet {

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

            InputStream inputStream = null;
            Employee employee = new Employee();
            HashPassword hashPassword = new HashPassword();

            String process = request.getParameter("action");
            String id = request.getParameter("id");
            
           
            try {

                if ("add_employee".equals(process)) {

                    String username = request.getParameter("username");
                    String nic = request.getParameter("nic");
                    String first_name = request.getParameter("first_name");
                    String last_name = request.getParameter("last_name");
                    String gender = request.getParameter("gender");
                    String address_line_01 = request.getParameter("address_line_01");
                    String address_line_02 = request.getParameter("address_line_02");
                    String city = request.getParameter("city");
                    String zip = request.getParameter("zip");
                    String country = request.getParameter("country");
                    String contact_number = request.getParameter("contact_number");
                    String department = request.getParameter("department");
                    String privilege_mode = request.getParameter("privilege_mode");
                    String password = hashPassword.generatePassword(nic);

                    // obtains the upload file part in this multipart request
                    Part filePart = request.getPart("avatar");
                    
                    // obtains input stream of the upload file
                    inputStream = filePart.getInputStream();

                    // Change the output path accordingly
                    OutputStream output = new FileOutputStream("C:/Users/Uditha/Documents/GitHub/CalEvents/web/User/Images/"+id+".png"); 
                    byte[] buffer = new byte[1024];
                    while (inputStream.read(buffer) > 0) {output.write(buffer);}  
                        
                        

                    Integer addEmployee = employee.addEmployee(id, username, nic, first_name, last_name, gender, address_line_01, address_line_02, city, zip, country, contact_number, inputStream, department, privilege_mode, password);

                    if (addEmployee > 0) {
                        response.sendRedirect("New_Employee");
                    }
                }
                
                
                
                
                
                
                    
                
                
                if ("update_employee".equals(process)) {

                    String username = request.getParameter("username");
                    String nic = request.getParameter("nic");
                    String first_name = request.getParameter("first_name");
                    String last_name = request.getParameter("last_name");
                    String gender = request.getParameter("gender");
                    String address_line_01 = request.getParameter("address_line_01");
                    String address_line_02 = request.getParameter("address_line_02");
                    String city = request.getParameter("city");
                    String zip = request.getParameter("zip");
                    String country = request.getParameter("country");
                    String contact_number = request.getParameter("contact_number");
                    String department = request.getParameter("department");
                    String privilege_mode = request.getParameter("privilege_mode");
                    
                    // obtains the upload file part in this multipart request
                    Part filePart = request.getPart("avatar");
                    
                    if(filePart.getSubmittedFileName() != ""){
                        
                        // obtains input stream of the upload file
                        inputStream = filePart.getInputStream();
                        
                         // Change the output path accordingly
                        OutputStream output = new FileOutputStream("C:/Users/Uditha/Documents/GitHub/CalEvents/web/User/Images/"+id+".png"); 
                        byte[] buffer = new byte[1024];
                        while (inputStream.read(buffer) > 0) {output.write(buffer);}  
                        
                    }else{
                        inputStream = null;
                    }

                    Integer updateEmployee = employee.updateEmployee(id, username, nic, first_name, last_name, gender, address_line_01, address_line_02, city, zip, country, contact_number, inputStream, department, privilege_mode);

                    if (updateEmployee > 0) {
                        response.sendRedirect("Employees");
                    }
                }
                
                
                
                
                
                
                
                
                
                
                
                
                
                 if ("delete_employee".equals(process)) {
                  
                    // out.print("<br>"+inputStream);
                    Integer removeEmployee = employee.deleteEmployee(id);

                    if (removeEmployee > 0) {
                        request.getSession().removeAttribute("id");
                        request.getSession().removeAttribute("username");
                        request.getSession().removeAttribute("nic");
                        request.getSession().removeAttribute("first_name");
                        request.getSession().removeAttribute("last_name");
                        request.getSession().removeAttribute("address_line_01");
                        request.getSession().removeAttribute("address_line_02");
                        request.getSession().removeAttribute("city");
                        request.getSession().removeAttribute("zip");
                        request.getSession().removeAttribute("contact_number");
                        request.getSession().removeAttribute("username");
                        request.getSession().removeAttribute("avatar");
                        
                        response.sendRedirect("Update_Employees");
                    }
                }
                
                
                
                
                
                
                
                
            } catch (Exception ex) {
                Logger.getLogger(Process_Employee.class.getName()).log(Level.SEVERE, null, ex);
            }
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
