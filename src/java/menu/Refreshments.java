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
public class Refreshments extends Menu {
    private String ingredients;
    private double price;
    
    public Refreshments(String name, String ingredients, double price) {
        super(name);
        this.ingredients = ingredients;
        this.price = price;
    
    }
    
    public String generateMenuId() throws ClassNotFoundException, SQLException {
            ServerConnection.setConnection();
            String query = null;
            
            if(ServerConnection.getConnectionStatus()) {
           Connection con = ServerConnection.getConnection();
           Statement st = con.createStatement();
           
           query = "select R_id from refreshment order by R_id DESC LIMIT 1 ";
           
           ResultSet result = st.executeQuery(query);
           
           if (result.next()) {
                String last_id = result.getString("R_id");
                String[] idParts = last_id.split("R0", 2);
                int integerId = Integer.parseInt(idParts[1]);
                integerId++;
                
                if (integerId >= 10)
                    menu_Id = "R0" + integerId;
                else if (integerId >= 2 && integerId < 10)
                    menu_Id = "R00" + integerId;
            }
            else
                menu_Id = "R001";
        }
        return menu_Id;
            
            
    }
    
    public boolean isInserted() throws ClassNotFoundException, SQLException {
       String refresh = generateMenuId();
       ServerConnection.setConnection();
       String query =null;
         
       if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            
            query = "INSERT INTO refreshment values(?,?,?,?)";
            
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, refresh);
            ps.setString(2, name);
            ps.setString(3, ingredients);
            ps.setDouble(4, price);
            int result = ps.executeUpdate();
            
            if (result > 0)
                return true;
            else
                return false;
        }
        else
            return false;
    }

    public static ResultSet getRefreshment() throws ClassNotFoundException, SQLException {
        ServerConnection.setConnection();
        String query = null;
        ResultSet res = null;
        
        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();
            
            query = "SELECT * from refreshment";
            
            res = st.executeQuery(query);
            
        }
        return res;
        
    }
    
    public static ResultSet displayRefreshment(String id) throws ClassNotFoundException, SQLException {
        ServerConnection.setConnection();
        String query = null;
        ResultSet res = null;
        
        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();
            
            query = "SELECT * from refreshment where R_id = '" +id+ "'";
            
            res = st.executeQuery(query);
            
        }
        return res;
    }
    
    public static boolean isUpdated(String id, String name, String ingredients, double price) throws ClassNotFoundException, SQLException {
        ServerConnection.setConnection();
        String query = null;
        
        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            query = "UPDATE refreshment SET R_name = ?, ingredient = ?, Price = ? where R_id = ?";
            
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, name);
            pst.setString(2, ingredients);
            pst.setDouble(3, price);
            pst.setString(4, id);
            
            int result = pst.executeUpdate();
            
            if (result > 0)
                return true;
            else
                return false;
        }
        else 
            return false;
    }
    
    public static boolean isDeleted(String id) throws ClassNotFoundException, SQLException {
        ServerConnection.setConnection();
        String query = null;
        
        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();
            
            query = "DELETE from refreshment where R_id = '" +id+ "'";
            
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
