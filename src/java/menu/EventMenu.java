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

/**
 *
 * @author Sohan
 */
public class EventMenu {
    private String menu_ID;
    private String appertizers;
    private String main_dishes;
    private String deserts;
    private String refreshments;

    public EventMenu(String appertizers, String main_dishes, String deserts, String refreshments) {
        this.appertizers = appertizers;
        this.main_dishes = main_dishes;
        this.deserts = deserts;
        this.refreshments = refreshments;
    }
    
    public String generateMenuId() throws ClassNotFoundException, SQLException {
       ServerConnection.setConnection();
       String query = null;
       
       if(ServerConnection.getConnectionStatus()) {
           Connection con = ServerConnection.getConnection();
           Statement st = con.createStatement();
           
           query = "select create_menu_id from create_menu order by create_menu_id DESC LIMIT 1 ";
           
           ResultSet result = st.executeQuery(query);
           
           if (result.next()) {
                String last_id = result.getString("create_menu_id");
                String[] idParts = last_id.split("CM0", 2);
                int integerId = Integer.parseInt(idParts[1]);
                integerId++;
                
                if (integerId >= 10)
                    menu_ID = "CM0" + integerId;
                else if (integerId >= 2 && integerId < 10)
                    menu_ID = "CM00" + integerId;
            }
            else
                menu_ID = "CM001";
        }
        return menu_ID;
   }
    
   public boolean isInserted() throws ClassNotFoundException, SQLException {
       String mdish = generateMenuId();
       ServerConnection.setConnection();
       String query =null;
         
       if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            
            query = "INSERT INTO create_menu values(?,?,?,?,?)";
            
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, menu_ID);
            ps.setString(2, appertizers);
            ps.setString(3, main_dishes);
            ps.setString(4, deserts);
            ps.setString(5, refreshments);
            int result = ps.executeUpdate();
            
            if (result > 0)
                return true;
            else
                return false;
        }
        else
            return false;
    }
   
public static ResultSet getCreateMenu() throws ClassNotFoundException, SQLException {
        ServerConnection.setConnection();
        String query = null;
        ResultSet res = null;
        
        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();
            
            query = "SELECT * from create_menu";
            
            res = st.executeQuery(query);
            
        }
        return res;
        
    }
    
    public static ResultSet displayCreateMenu(String id) throws ClassNotFoundException, SQLException {
        ServerConnection.setConnection();
        String query = null;
        ResultSet res = null;
        
        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();
            
            query = "SELECT * from create_menu where create_menu = '" +id+ "'";
            
            res = st.executeQuery(query);
            
        }
        return res;
    }
    
    
public static boolean isDeleted(String id) throws ClassNotFoundException, SQLException {
        ServerConnection.setConnection();
        String query = null;
        
        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();
            
            query = "DELETE from create_menu where create_menu_id = '" +id+ "'";
            
            int result = st.executeUpdate(query);
            
            if (result > 0)
                return true;
            else
                return false;
            
        }
        else
            return false;
    }    
   
}
