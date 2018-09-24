/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Security;

import Employee.Business;
import Employee.Employee;
import Employee.Attendance;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Uditha
 */
@WebServlet(name = "Process_Admin", urlPatterns = {"/Process_Admin"})
public class Process_Admin extends HttpServlet {

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

            String username = request.getParameter("username");
            String password = request.getParameter("password");

            //Creating a instance of Business class(which contains opening and closing hours of the business)
            try {
                // Creating new date instance to add date and time to record login time and etc. 
                Date date = new Date();
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");

                //Current date and time are stored in below variables
                String currentDate = dateFormat.format(date);
                String currentTime = timeFormat.format(date);

                //Accessing Business class(which contains opening and closing hours of the business)
                if (Business.isOpenForBusiness() == true) {

                    //Hashing received password to check against database password
                    HashPassword hashPassword = new HashPassword(password);
                    String encrypt_password = hashPassword.generatePassword();

                    //Checking username and passsword against database records to check for record existance, if true will return integer 1
                    Authenticate authenticate = new Authenticate(username, encrypt_password);
                    String result = authenticate.validateAdmin();

                    Integer rowCount = Integer.parseInt(result);

                    if (rowCount == 1) {

                        String privilege_mode = authenticate.getPrivilegeMode();

                        String department = authenticate.getDepartment();

                        ResultSet res = Employee.readEmployeeProfile(username);
                        while (res.next()) {

                            // Read table fields and set to session variables
                            request.getSession().setAttribute("p_id", res.getString("id"));

                            Attendance attendance = new Attendance(res.getString("id"), currentDate);

                            boolean hasUserLoggedOut = attendance.isUserLoggedOut();

                            if (hasUserLoggedOut != true) {

                                String leaveStatus = attendance.checkForLeaves();

                                //Checking whether the time is before 2PM to log in for short leavers
                                String stringTime = currentTime.replace(":", "");
                                //2PM is the depature time for employees on short leave
                                int shortLeaveTime = 140000;
                                int newCurrentTime = Integer.parseInt(stringTime);
                                int loginTime = shortLeaveTime - newCurrentTime;

                                if (leaveStatus.equals("short") && loginTime > 0 || leaveStatus.equals("")) {

                                    if (leaveStatus.equals("short")) {
                                        request.getSession().setAttribute("ShortLeave", "ShortLeave");
                                    }

                                    request.getSession().setAttribute("privilege_mode", privilege_mode);
                                    request.getSession().setAttribute("authenticated", "user_authenticated");

                                    attendance.recordArrivalTime(currentTime);
                                    
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

                                    switch (department) {

                                        case "Event Department":
                                            response.sendRedirect("E-Management/Dashboard");
                                            break;
                                        case "Menu Department":
                                            response.sendRedirect("EManagement/Dashboard");
                                            break;
                                        case "Gallery Department":
                                            response.sendRedirect("Administrator/Dashboard");
                                            break;
                                        case "Facility Department":
                                            response.sendRedirect("Administrator/Dashboard");
                                            break;
                                        case "Kitchen Department":
                                            response.sendRedirect("Administrator/Dashboard");
                                            break;
                                        case "Customer Department":
                                            response.sendRedirect("Administrator/Dashboard");
                                            break;
                                        case "Employee Department":
                                            response.sendRedirect("E-Management/Dashboard");
                                            break;
                                    }

                                } else if (leaveStatus.equals("full")) {
                                    request.getSession().setAttribute("login_Message", "Your attendance has been confirmed as a full day leave");
                                    response.sendRedirect("Admin");
                                    //If the time has passed for employees on short leave to login, following will be displayed
                                } else {
                                    request.getSession().setAttribute("login_Message", "Your attendance has been confirmed as a short-day leave, login time has passed !");
                                    response.sendRedirect("Admin");
                                }
                            } else {
                                request.getSession().setAttribute("login_Message", "You have logged out of the system !");
                                response.sendRedirect("Admin");
                            }
                        }

                    } else {
                        request.getSession().setAttribute("login_Message", "Invalid credentials ! Please check your username and password");
                        response.sendRedirect("Admin");
                    }

                } else {
                    request.getSession().setAttribute("login_Message", "Operating hours are now closed !");
                    response.sendRedirect("Admin");
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
