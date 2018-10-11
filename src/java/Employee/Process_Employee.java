/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Employee;

import Log.Activity;
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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Uditha
 */
@MultipartConfig
@WebServlet(name = "Process_Employee", urlPatterns = {"/E-Management/Process-Employee"})
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

            String empImgPath = request.getSession(false).getAttribute("empImgPath").toString();
            InputStream inputStream = null;
            Employee employee = new Employee();

            Activity activity = new Activity();

            String process = request.getParameter("action");
            String id = request.getParameter("id");

            HttpSession session = request.getSession();
            String actor = session.getAttribute("p_id").toString();

            String password = null;
            String oldPassword = null;
            String oldAvatar = null;
            String avatar = null;

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
		    String doe = request.getParameter("doe");
                    String privilege_mode = request.getParameter("privilege_mode");
                    avatar = "../User/Images/" + id + ".png";

                    HashPassword hashPassword = new HashPassword(nic);
                    password = hashPassword.generatePassword();

                    // obtains the upload file part in this multipart request
                    Part filePart = request.getPart("avatar");

                    // obtains input stream of the upload file
                    inputStream = filePart.getInputStream();

                    // Change the output path accordingly
                    OutputStream output = new FileOutputStream(empImgPath+id+".png");
                    byte[] buffer = new byte[1024];
                    while (inputStream.read(buffer) > 0) {
                        output.write(buffer);
                    }

                    Integer addEmployee = employee.addEmployee(id, username, nic, first_name, last_name, gender, address_line_01, address_line_02, city, zip, country, contact_number, avatar, department, doe, privilege_mode, password);

                    if (addEmployee > 0) {
                        request.getSession().setAttribute("message", "Employee successfully added");

                        activity.recordActivity(actor, "Employee "+id+" was added to the system", "New employee " + id + " was added to the system under " + department);

                        response.sendRedirect("New-Employee");
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

                    ResultSet res1 = Employee.readEmployeeProfile(username);
                    while (res1.next()) {
                        oldPassword = res1.getString("password");
                        oldAvatar = res1.getString("avatar");
                        password = oldPassword;
                    }

                    // obtains the upload file part in this multipart request
                    Part filePart = request.getPart("avatar");

                    if (filePart.getSubmittedFileName() != "") {

                        // obtains input stream of the upload file
                        inputStream = filePart.getInputStream();

                        // Change the output path accordingly
                        OutputStream output = new FileOutputStream(empImgPath+id+".png");
                        byte[] buffer = new byte[1024];
                        while (inputStream.read(buffer) > 0) {
                            output.write(buffer);
                        }

                        avatar = "../User/Images/" + id + ".png";

                    } else {
                        avatar = oldAvatar;
                    }

                    Integer updateEmployee = employee.updateEmployee(id, username, nic, first_name, last_name, gender, address_line_01, address_line_02, city, zip, country, contact_number, avatar, department, privilege_mode, password);

                    if (updateEmployee > 0) {
                        request.getSession().setAttribute("message", "Employee successfully updated");

                        activity.recordActivity(actor,"Employee " + id + " details were updated", "Employee " + id + " details were updated");

                        response.sendRedirect("Employees");
                    }
                }
                
                
                
                
                
                
                
                
                if("reset_password".equals(process)){
                    
                    String nic = request.getParameter("nic");
                    
                    HashPassword hashPassword = new HashPassword(nic);
                    password = hashPassword.generatePassword();
                    
                    Integer resetPassword = employee.resetPassword(id, password);
                    
                    if (resetPassword > 0) {
                        request.getSession().setAttribute("message", "Employee successfully updated");

                        activity.recordActivity(actor, "Employee " + id + " password was resetted", "Employee " + id + " password was resetted");

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

                        request.getSession().setAttribute("message", "Employee successfully removed");

                        activity.recordActivity(actor,"Employee " + id + " was removed from the system", "Employee " + id + " was removed from the system");

                        response.sendRedirect("Employees");
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
