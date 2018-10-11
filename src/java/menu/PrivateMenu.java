/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package menu;

import Connection.ServerConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Sohan
 */
public class PrivateMenu {

    String eventId;
    String[] itemId;

    public PrivateMenu(String eventId, String[] itemId) {
        this.eventId = eventId;
        this.itemId = itemId;
    }

    public boolean isInserted() {
        try {
            ServerConnection.setConnection();
            String query = null;
            if (ServerConnection.getConnectionStatus()) {
                Connection con = ServerConnection.getConnection();
                query = "INSERT INTO `menu_private` (`private_id`, `item_id`) VALUES (?, ?)";
                PreparedStatement ps;
                int res;
                for (String item : itemId) {
                    ps = con.prepareStatement(query);
                    ps.setString(1, eventId);
                    ps.setString(2, item);
                    res = ps.executeUpdate();
                    if (res < 1) {
                        return false;
                    }
                }
                return true;
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Menu.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Menu.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;

    }

}
