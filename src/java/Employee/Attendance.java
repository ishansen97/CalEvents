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

            sql = "SELECT leave_type FROM employee_work_schedule WHERE employee_id = '"+employee_id+"' AND date = '"+current_date+"'";
            res = st.executeQuery(sql);
            while(res.next()){
                leaveType = res.getString("leave_type");
            }
            return leaveType;
        }
        return "Error";
    }
}
