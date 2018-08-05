package Log;

import Connection.ServerConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Activity {
    
    private final Integer error = 404;
    PreparedStatement ps = null;
    private String sql = null;

    // Add employee
    public Integer recordActivity(String actor, String activity) throws ClassNotFoundException, SQLException {

        
        // Setting server connection
        ServerConnection.setConnection();
        
        // Checking for server status
        if (ServerConnection.getConnectionStatus()) {

            // If connection successfully established
            Connection con = ServerConnection.getConnection();
            sql = "INSERT INTO activity_log (actor, activity, occurred_on)values (?, ?, NOW())";
            ps = con.prepareStatement(sql);
            ps.setString(1, actor);
            ps.setString(2, activity);
            int querry = ps.executeUpdate();
            return querry;
        }

        // If error in establishing Connection 
        return error;

    }
    
    
        // View all employees
    public static ResultSet readActivity() throws ClassNotFoundException, SQLException {

        ServerConnection.setConnection();
        String query = null;
        ResultSet res = null;

        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();

            query = "SELECT * FROM activity_log ORDER BY activity_log.occurred_on DESC";

            res = st.executeQuery(query);
        }
        return res;

    }
    
    
}
