/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package menu;

import Connection.ServerConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Sohan
 */
public class Menu {
    String name;
    String[] items;
    
    Menu(String name, String[] items) {
        this.name = name;
        this.items = items;
    }
    
    private boolean insertMenuDetails(Connection con, String id) throws SQLException {
        String query = "INSERT INTO `menu_details` (`menu_id`, `item_id`) VALUES (?, ?)";
        PreparedStatement ps;
        int res;
        for(String item: items) {
            ps = con.prepareStatement(query);
            ps.setString(1, id);
            ps.setString(2, item);
            res = ps.executeUpdate();
            if (res < 1) {
                return false;
            }
        }
        return true;
    }
    
    public boolean createMenu() {
        try {
            ServerConnection.setConnection();
            String query = null;
            if (ServerConnection.getConnectionStatus()) {
                Connection con = ServerConnection.getConnection();
                
                query = "INSERT INTO `menu` (`menu_name`) VALUES (?)";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, name);
                
                int result = ps.executeUpdate();
                if (result > 0) {
                    PreparedStatement ps1 = con.prepareStatement("SELECT menu_id FROM menu WHERE menu_name=?");
                    ps1.setString(1, name);
                    ResultSet rs = ps1.executeQuery();
                    if (rs.next()) {
                        String menuId = rs.getString("menu_id");
                        if(insertMenuDetails(con, menuId)) {
                            return true;
                        }
                    }
                }
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Menu.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Menu.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public static ResultSet getAllMenus() throws ClassNotFoundException, SQLException {
        ServerConnection.setConnection();
        ResultSet rs = null;
        String query = "SELECT * FROM `menu`";
        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();
            rs = st.executeQuery(query);
        }
        return rs;
    }
    
    public static ResultSet getMenuDetails(String menuID) throws SQLException, ClassNotFoundException {
        ServerConnection.setConnection();
        ResultSet rs = null;
        String query = "SELECT m.menu_id, menu_name, i.item_id, category, name, price, ingredients "
                + "FROM `menu` m, `menu_details` d, `menu_items` i "
                + "WHERE m.menu_id = d.menu_id AND d.item_id = i.item_id "
                + "AND m.menu_id = ?";
        
        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, menuID);
            rs = ps.executeQuery();
        }
        
        return rs;
    }
    
    public static boolean isDeleted(String menuId) {
        try {
            ServerConnection.setConnection();
            ResultSet rs = null;
            String deleteItemsQuery = "DELETE FROM `menu_details` WHERE `menu_id` = ?";
            String deleteMenuQuery = "DELETE FROM `menu` WHERE `menu_id` = ?";
            if (ServerConnection.getConnectionStatus()) {
                Connection con = ServerConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(deleteItemsQuery);
                ps.setString(1, menuId);
                int res = ps.executeUpdate();
                if (res > 0) {
                    ps = con.prepareStatement(deleteMenuQuery);
                    ps.setString(1, menuId);
                    res = ps.executeUpdate();
                    if (res > 0) {
                        return true;
                    }
                }
            }
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Menu.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Menu.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
