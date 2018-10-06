/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package menu;
import Connection.ServerConnection;
import java.sql.*;

/**
 *
 * @author Sohan
 */
public class MenuReports {
    public static ResultSet displayMenuCategories() throws ClassNotFoundException, SQLException {
        ServerConnection.setConnection();
        String query = null;
        ResultSet result = null;
        
        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();
            query = "SELECT category, COUNT(*) FROM menu_items GROUP BY category";
            result = st.executeQuery(query);
        }
        return result;
    }
}
