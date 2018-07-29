package Employee;

import Connection.ServerConnection;
import java.sql.*;
import java.io.*;
import java.util.*;

public class Employee {

    private final Integer error = 404;
    PreparedStatement ps = null;
    private String sql = null;
    ResultSet resultSet = null;

    // Add employee
    public Integer addEmployee(String id, String username, String nic, String first_name, String last_name, String gender, String address_line_1, String address_line_2, String city, String zip, String country, String contact_number, String avatar, String department, String privilege_mode, String password) throws ClassNotFoundException, SQLException {

        
        // Setting server connection
        ServerConnection.setConnection();
        
        // Checking for server status
        if (ServerConnection.getConnectionStatus()) {

            // If connection successfully established
            Connection con = ServerConnection.getConnection();
            sql = "INSERT INTO employees (id, username, nic, first_name, last_name, gender, address_line_1, address_line_2, city, zip, country, contact_number, avatar, department, privilege_mode, password)values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ps.setString(2, username);
            ps.setString(3, nic);
            ps.setString(4, first_name);
            ps.setString(5, last_name);
            ps.setString(6, gender);
            ps.setString(7, address_line_1);
            ps.setString(8, address_line_2);
            ps.setString(9, city);
            ps.setString(10, zip);
            ps.setString(11, country);
            ps.setString(12, contact_number);
            ps.setString(13, avatar);
            ps.setString(14, department);
            ps.setString(15, privilege_mode);
            ps.setString(16, password);
            int querry = ps.executeUpdate();
            return querry;
        }

        // If error in establishing Connection 
        return error;

    }

    
    // Update employee
    public Integer updateEmployee(String id, String username, String nic, String first_name, String last_name, String gender, String address_line_1, String address_line_2, String city, String zip, String country, String contact_number, String avatar, String department, String privilege_mode) throws ClassNotFoundException, SQLException {

        // Setting server connection
        ServerConnection.setConnection();

        // Checking for server status
        if (ServerConnection.getConnectionStatus()) {

            // If connection successfully established
            Connection con = ServerConnection.getConnection();
            
            if(avatar == null){
                try{
                sql = "UPDATE employees SET username =?, nic=?, first_name=?, last_name=?, gender=?, address_line_1=?, address_line_2=?, city=?, zip=?, country=?, contact_number=?, department=?, privilege_mode=? WHERE employees.id="+id;
                ps = con.prepareStatement(sql);
                ps.setString(1, username);
                ps.setString(2, nic);
                ps.setString(3, first_name);
                ps.setString(4, last_name);
                ps.setString(5, gender);
                ps.setString(6, address_line_1);
                ps.setString(7, address_line_2);
                ps.setString(8, city);
                ps.setString(9, zip);
                ps.setString(10, country);
                ps.setString(11, contact_number);
                ps.setString(12, department);
                ps.setString(13, privilege_mode);
                int querry = ps.executeUpdate();

                return querry;}catch(Exception e){
                }
                
            }else{
                try{
                sql = "UPDATE employees SET username =?, nic=?, first_name=?, last_name=?, gender=?, address_line_1=?, address_line_2=?, city=?, zip=?, country=?, contact_number=?, avatar=?, department=?, privilege_mode=? WHERE employees.id="+id;
                ps = con.prepareStatement(sql);
                ps.setString(1, username);
                ps.setString(2, nic);
                ps.setString(3, first_name);
                ps.setString(4, last_name);
                ps.setString(5, gender);
                ps.setString(6, address_line_1);
                ps.setString(7, address_line_2);
                ps.setString(8, city);
                ps.setString(9, zip);
                ps.setString(10, country);
                ps.setString(11, contact_number);
                ps.setString(12, avatar);
                ps.setString(13, department);
                ps.setString(14, privilege_mode);
                int querry = ps.executeUpdate();

                return querry;}catch(Exception e){
                }
            }
        }

        // If error in establishing Connection 
        return error;
    }

    
    // Delete employee 
    public Integer deleteEmployee(String id) throws ClassNotFoundException, SQLException {

        // Setting server connection
        ServerConnection.setConnection();

        // Checking for server status
        if (ServerConnection.getConnectionStatus()) {

            // If connection successfully established
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();

            int querry = st.executeUpdate("DELETE FROM employees WHERE  employees.id="+id);

            return querry;
        }

        // If error in establishing Connection 
        return error;
    }

    
    // View all employees
    public static ResultSet readEmployees() throws ClassNotFoundException, SQLException {

        ServerConnection.setConnection();
        String query = null;
        ResultSet res = null;

        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();

            query = "SELECT * FROM employees ORDER BY employees.id ASC";

            res = st.executeQuery(query);
        }
        return res;

    }
    
    
    
    // View specific employee
    public static ResultSet readEmployee(String id) throws ClassNotFoundException, SQLException {

        ServerConnection.setConnection();
        String query = null;
        ResultSet res = null;

        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();

            query = "SELECT * FROM employees WHERE id LIKE '"+id+"%'";

            res = st.executeQuery(query);
        }
        return res;

    }
    
    
    
    
    public Integer getLastId() throws ClassNotFoundException, SQLException{

        ServerConnection.setConnection();
        String query = null;
        ResultSet res = null;
        Integer empId = null;
        Integer error = 404;

        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();

            query = "SELECT id FROM employees ORDER BY id DESC LIMIT 1";
            res = st.executeQuery(query);
            
            String lastEmpId = "";
            while (res.next()) {
                lastEmpId = res.getString(1);
            }
            
            //If there are no records in the employee table
            if("".equals(lastEmpId)){
                //First employee id will be set to 1000
                empId = 1000;
            }else
                
            //Converting last employee id to an integer and adding one
            empId = (Integer.parseInt(lastEmpId)+1);
            
             return empId;
        }
       return error;
    }
    
}

    
