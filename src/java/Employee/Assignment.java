package Employee;

import Connection.ServerConnection;
import java.sql.*;

public class Assignment {

    // View all private events
    public static ResultSet viewEvents() throws ClassNotFoundException, SQLException {

        ServerConnection.setConnection();
        String query = null;
        ResultSet res = null;

        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();

            query = "SELECT * FROM private_events ORDER BY private_events.event_ID DESC";

            res = st.executeQuery(query);
        }
        return res;
    }
    
    // View specific private events
    public static ResultSet viewEvent(String eid) throws ClassNotFoundException, SQLException {

        ServerConnection.setConnection();
        String query = null;
        ResultSet res = null;

        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();

            query = "SELECT * FROM private_events WHERE event_ID LIKE '"+eid+"%' ORDER BY private_events.event_ID ASC";

            res = st.executeQuery(query);
        }
        return res;

    }
    
    // View specific private events
    public static ResultSet viewAssignee(String department) throws ClassNotFoundException, SQLException {

        ServerConnection.setConnection();
        String query = null;
        ResultSet res = null;

        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();

            query = "SELECT id, first_name, last_name FROM employees WHERE department='"+department+" Department' ORDER BY employees.id ASC";

            res = st.executeQuery(query);
        }
        return res;

    }
    
    // View specific private events
    public static ResultSet viewEventDetails(String eid) throws ClassNotFoundException, SQLException {

        ServerConnection.setConnection();
        String query = null;
        ResultSet res = null;

        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();

            query = "SELECT id, first_name, last_name FROM employees WHERE department='"+eid+" Department' ORDER BY employees.id ASC";

            res = st.executeQuery(query);
        }
        return res;

    }
    
    public static ResultSet viewCustomerDetails(String cid) throws ClassNotFoundException, SQLException {

        ServerConnection.setConnection();
        String query = null;
        ResultSet res = null;

        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();

            query = "SELECT name, address, contact_number, email FROM customer WHERE cus_id='"+cid+"'";

            res = st.executeQuery(query);
        }
        return res;

    }
}
