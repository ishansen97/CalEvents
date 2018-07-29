package Security;

import Connection.ServerConnection;
import java.sql.*;

public class Authenticate {
    
    private String username;
    private String password;
    
    public Authenticate(String username, String password){
        
        this.username = username;
        this.password = password;
    }
    
    
    
    public String validateAdmin() throws ClassNotFoundException, SQLException{
        
        // Setting server connection
        ServerConnection.setConnection();

        // Checking for server status
        if (ServerConnection.getConnectionStatus()) {

            // If connection successfully established
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();

            String querry = "SELECT COUNT(*) FROM employee_login WHERE username = '"+username+"' AND password = '"+password+"'";
            ResultSet rs = st.executeQuery(querry);
            String Countrow="";
            while(rs.next()){
            Countrow = rs.getString(1);
            } 
            return Countrow;
        }
        // If error in establishing Connection 
        return "404";
    }
    
    
    public String getDepartment()throws ClassNotFoundException, SQLException{
        
        // Setting server connection
        ServerConnection.setConnection();

        // Checking for server status
        if (ServerConnection.getConnectionStatus()) {

            // If connection successfully established
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();

            String querry = "SELECT department FROM employee_login WHERE username = '"+username+"'";
            ResultSet rs = st.executeQuery(querry);
            String department = "";
            while (rs.next()) {
                department = rs.getString("department");
            } 
            return department;
        }
        // If error in establishing Connection 
        return "404";
    }
    
    
    public String getPrivilegeMode()throws ClassNotFoundException, SQLException{
        
        // Setting server connection
        ServerConnection.setConnection();

        // Checking for server status
        if (ServerConnection.getConnectionStatus()) {

            // If connection successfully established
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();

            String querry = "SELECT privilege_mode FROM employee_login WHERE username = '"+username+"'";
            ResultSet rs = st.executeQuery(querry);
            String department = "";
            while (rs.next()) {
                department = rs.getString("privilege_mode");
            } 
            return department;
        }
        // If error in establishing Connection 
        return "404";
    }
}
