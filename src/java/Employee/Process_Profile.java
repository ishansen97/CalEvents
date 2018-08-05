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

@MultipartConfig

/**
 *
 * @author Uditha
 */
@WebServlet(name = "Process_Profile", urlPatterns = {"/E-Management/Process-Profile"})
public class Process_Profile extends HttpServlet {

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

            InputStream inputStream = null;
            Employee employee = new Employee();

            String process = request.getParameter("action");
            String id = request.getParameter("id");
            String password = null;
            String oldPassword = null;
            String oldAvatar = null;
            String avatar = null;

            try {
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
                    String newPassword = request.getParameter("password");
                    
                    ResultSet res1 = Employee.readEmployeeProfile(username);
                    while (res1.next()) {
                        oldPassword = res1.getString("password");
                        oldAvatar = res1.getString("avatar");
                    }

                    // obtains the upload file part in this multipart request
                    Part filePart = request.getPart("avatar");

                    if (filePart.getSubmittedFileName() != "") {

                        // obtains input stream of the upload file
                        inputStream = filePart.getInputStream();

                        // Change the output path accordingly
                        OutputStream output = new FileOutputStream("C:/Users/Uditha/Documents/GitHub/CalEvents/web/User/Images/" + id + ".png");
                        byte[] buffer = new byte[1024];
                        while (inputStream.read(buffer) > 0) {
                            output.write(buffer);
                        }
                        
                        avatar = "../User/Images/" + id + ".png";

                    } else {
                        avatar = oldAvatar;
                    }

                    // If the password is null, old password will be new password
                    if ("".equals(oldPassword)) {
                        password = oldPassword;
                    } else {
                        HashPassword hashPassword = new HashPassword(newPassword);
                        password = hashPassword.generatePassword();
                    }
                    
                    if ("".equals(oldPassword)) {
                        password = oldPassword;
                    } else {
                        HashPassword hashPassword = new HashPassword(newPassword);
                        password = hashPassword.generatePassword();
                    }

                    Integer updateEmployee = employee.updateEmployee(id, username, nic, first_name, last_name, gender, address_line_01, address_line_02, city, zip, country, contact_number, avatar, department, privilege_mode, password);

                    if (updateEmployee > 0) {

                        ResultSet res = Employee.readEmployeeProfile(username);
                        while (res.next()) {

                            // Read table fields and set to session variables
                            request.getSession().setAttribute("p_id", res.getString("id"));
                            request.getSession().setAttribute("p_username", res.getString("username"));
                            request.getSession().setAttribute("p_nic", res.getString("nic"));
                            request.getSession().setAttribute("p_first_name", res.getString("first_name"));
                            request.getSession().setAttribute("p_last_name", res.getString("last_name"));
                            request.getSession().setAttribute("p_id", res.getString("id"));
                            request.getSession().setAttribute("p_address_line_1", res.getString("address_line_1"));
                            request.getSession().setAttribute("p_address_line_2", res.getString("address_line_2"));
                            request.getSession().setAttribute("p_city", res.getString("city"));
                            request.getSession().setAttribute("p_zip", res.getString("zip"));
                            request.getSession().setAttribute("p_country", res.getString("country"));
                            request.getSession().setAttribute("p_contact_number", res.getString("contact_number"));
                            request.getSession().setAttribute("p_avatar", res.getString("avatar"));
                            request.getSession().setAttribute("p_gender", res.getString("gender"));
                            request.getSession().setAttribute("p_department", res.getString("department"));
                            request.getSession().setAttribute("p_privilege_mode", res.getString("privilege_mode"));

                        }

                        // Clearing cache to avoid old avatar shown as the new avatar
                        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
                        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
                        response.setDateHeader("Expires", 0); // Proxies.
                        request.getSession().setAttribute("message", "Profile successfully updated");
                        response.sendRedirect("Dashboard");
                    }
                }

            } catch (Exception e) {
                out.print(e);
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
