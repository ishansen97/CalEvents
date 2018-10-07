/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Employee;

import Connection.ServerConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 *
 * @author RED HAWK
 */
public class Attendance {

    PreparedStatement ps;
    private String sql;
    private String employee_id;
    private String current_date;
    private ResultSet res;

    public Attendance(String empid, String date) {
        this.employee_id = empid;
        this.current_date = date;
    }

    // Reset employee password 
    public Integer recordArrivalTime(String arrivalTime) throws ClassNotFoundException, SQLException {

        // Setting server connection
        ServerConnection.setConnection();

        // Checking for server status
        if (ServerConnection.getConnectionStatus()) {

            // If connection successfully established
            Connection con = ServerConnection.getConnection();

            try {

                sql = "INSERT INTO employee_attendance(employee_id, date, arrival_time) VALUES (?,?,?)";
                ps = con.prepareStatement(sql);
                ps.setString(1, employee_id);
                ps.setString(2, current_date);
                ps.setString(3, arrivalTime);
                int querry = ps.executeUpdate();

                return querry;
            } catch (Exception e) {
            }
        }

        // If error in establishing Connection 
        return 404;
    }

    public Integer recordDepartureTime(String departureTime) throws ClassNotFoundException, SQLException {

        // Setting server connection
        ServerConnection.setConnection();

        // Checking for server status
        if (ServerConnection.getConnectionStatus()) {

            // If connection successfully established
            Connection con = ServerConnection.getConnection();

            try {
                sql = "UPDATE employee_attendance SET departure_time=? WHERE employee_id = '" + employee_id + "'AND date = '" + current_date + "'";
                ps = con.prepareStatement(sql);
                ps.setString(1, departureTime);
                int querry = ps.executeUpdate();

                return querry;
            } catch (Exception e) {
            }
        }

        // If error in establishing Connection 
        return 404;
    }

    public String checkForLeaves() throws ClassNotFoundException, SQLException {

        // Setting server connection
        ServerConnection.setConnection();
        String leaveType = "";

        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();

            Statement st = con.createStatement();

            sql = "SELECT leave_type FROM employee_leave_schedule WHERE employee_id = '" + employee_id + "' AND date = '" + current_date + "'";
            res = st.executeQuery(sql);
            while (res.next()) {
                leaveType = res.getString("leave_type");
            }
            return leaveType;
        }
        return "Error";
    }

    public boolean isUserLoggedOut() throws ClassNotFoundException, SQLException {

        // Setting server connection
        ServerConnection.setConnection();
        String sql01;
        ResultSet res01;
        String departureTime = "";
        int noOfRows = 0;

        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();

            Statement st = con.createStatement();

            sql = "SELECT COUNT(*) FROM employee_attendance WHERE employee_id = '" + employee_id + "' AND date = '" + current_date + "'";
            res = st.executeQuery(sql);
            while (res.next()) {
                noOfRows = res.getInt(1);
            }

            sql01 = "SELECT departure_time FROM employee_attendance WHERE employee_id = '" + employee_id + "' AND date = '" + current_date + "'";
            res01 = st.executeQuery(sql01);
            while (res01.next()) {
                departureTime = res01.getString("departure_time");
            }

        }

        if (noOfRows == 1) {

            if (departureTime != null) {
                return true;
            } else {
                return false;
            }

        } else {

            if (departureTime != "") {
                return true;
            } else {
                return false;
            }

        }
    }

    public int recordAbsentees() throws ClassNotFoundException, SQLException {

        // Setting server connection
        ServerConnection.setConnection();

        int query = 0;

        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();

            Statement st = con.createStatement();

            sql = "SELECT id, first_name FROM employees WHERE id NOT IN (SELECT employee_id FROM employee_attendance WHERE date = '" + current_date + "') AND id NOT IN (SELECT employee_id FROM employee_leave_schedule WHERE date = '" + current_date + "')";
            res = st.executeQuery(sql);

            while (res.next()) {
                String absenteeId = res.getString("id");

                sql = "INSERT INTO employee_attendance(employee_id, date, arrival_time,departure_time) VALUES (?,?,?,?)";
                ps = con.prepareStatement(sql);
                ps.setString(1, absenteeId);
                ps.setString(2, current_date);
                ps.setString(3, "00:00:00");
                ps.setString(4, "00:00:00");
                query = ps.executeUpdate();
            }

            return query;

        }
        return 404;
    }

    // View all employees
    public static ResultSet viewUnconfirmedLeaveRequests() throws ClassNotFoundException, SQLException {

        ServerConnection.setConnection();
        String query = null;
        ResultSet res = null;

        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();

            query = "SELECT * FROM employee_leave_request WHERE status='unconfirmed'";

            res = st.executeQuery(query);
        }
        return res;

    }

    // View all employees
    public static ResultSet viewConfirmedLeaveRequests() throws ClassNotFoundException, SQLException {

        ServerConnection.setConnection();
        String query = null;
        ResultSet res = null;

        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();

            query = "SELECT * FROM employee_leave_request WHERE status='confirmed'";

            res = st.executeQuery(query);
        }
        return res;

    }

    // View all employees
    public static int confirmLeaveRequest(String employeeId, String date, String leaveType) throws ClassNotFoundException, SQLException {

        ServerConnection.setConnection();
        int query03 = 0;

        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();

            Statement st = con.createStatement();

            String sql = "INSERT INTO employee_leave_schedule (employee_id, date, leave_type) VALUES (?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, employeeId);
            ps.setString(2, date);
            ps.setString(3, leaveType);
            ps.executeUpdate();

            if (leaveType.equalsIgnoreCase("full")) {

                String sql01 = "INSERT INTO employee_attendance (employee_id, date, arrival_time, departure_time) VALUES (?,?,?,?)";
                PreparedStatement ps01 = con.prepareStatement(sql01);
                ps01.setString(1, employeeId);
                ps01.setString(2, date);
                ps01.setString(3, "00:00:00");
                ps01.setString(4, null);
                ps01.executeUpdate();
            }

            String sql03 = "UPDATE employee_leave_request SET status =? WHERE employee_leave_request.employee_id = '" + employeeId + "' AND employee_leave_request.date = '" + date + "'";
            PreparedStatement ps02 = con.prepareStatement(sql03);
            ps02.setString(1, "confirmed");
            query03 = ps02.executeUpdate();

        }
        return query03;
    }

    // View all employees
    public static int scheduleLeaveRequest(String employeeId, String date, String leaveType) throws ClassNotFoundException, SQLException {

        ServerConnection.setConnection();
        int query = 0;
        PreparedStatement ps = null;

        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();

            Statement st = con.createStatement();

            String sql = "INSERT INTO employee_leave_request (employee_id, date, leave_type) VALUES (?,?,?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, employeeId);
            ps.setString(2, date);
            ps.setString(3, leaveType);
            query = ps.executeUpdate();

        }
        return query;
    }

    public static boolean isTimeForShortLeave() {

        Date date = new Date();
        SimpleDateFormat timeFormat = new SimpleDateFormat("HHmmss");

        //Current time are stored in below variables
        String currentTime = timeFormat.format(date);
        int replacedTime = Integer.parseInt(currentTime);

        int shortLeaveTime = 140000;

        int isTimeToLogOut = shortLeaveTime - replacedTime;

        return isTimeToLogOut < 0;
    }

}
