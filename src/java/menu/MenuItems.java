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
public class MenuItems {
    private String name;
    private String category;
    private String ingredients;
    private double price;

    public MenuItems(String name, String category, String ingredients, double price) {
        this.name = name;
        this.category = category;
        this.ingredients = ingredients;
        this.price = price;
    }
       
    /*
    public String generateMenuId() throws ClassNotFoundException, SQLException {
        ServerConnection.setConnection();
        String query = null;
        
        if(ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();
            
            query = "select A_id from appetizer order by A_id DESC LIMIT 1";
            
            ResultSet result = st.executeQuery(query);
            
            if (result.next()) {
                String last_id = result.getString("A_id");
                String[] idParts = last_id.split("A0", 2);
                int integerId = Integer.parseInt(idParts[1]);
                integerId++;
                
                if (integerId >= 10)
                    menu_Id = "A0" + integerId;
                else if (integerId >= 2 && integerId < 10)
                    menu_Id = "A00" + integerId;
            }
            else
                menu_Id = "A001";
        }
        return menu_Id;
    }
*/
    
    public boolean isInserted() throws ClassNotFoundException, SQLException {
//        String app = generateMenuId();
        ServerConnection.setConnection();
        String query = null;
        
        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            
            query = "INSERT INTO `Menu_items` (`category`, `name`, `price`, `ingredients`) "
                    + "VALUES (?, ?, ?, ?)";
            
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, category);
            ps.setString(2, name);
            ps.setDouble(3, price);
            ps.setString(4, ingredients);
            int result = ps.executeUpdate();
            
            if (result > 0)
                return true;
            else
                return false;
        }
        else
            return false;
    }
    
    public static ResultSet getItems() throws ClassNotFoundException, SQLException {
        ServerConnection.setConnection();
        String query = null;
        ResultSet res = null;
        
        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();
            
            query = "SELECT * FROM `Menu_items` ORDER BY category";
            
            res = st.executeQuery(query);
            
        }
        return res;
        
    }
    
    public static ResultSet getAllCategories() throws ClassNotFoundException, SQLException {
        ServerConnection.setConnection();
        ResultSet res = null;
        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();
            String query = "SELECT category from Menu_items GROUP BY category";
            res = st.executeQuery(query);
        }
        return res;
    }
    
    public static ResultSet getItemsByCategory(String cat) throws ClassNotFoundException, SQLException {
        ServerConnection.setConnection();
        ResultSet res = null;
        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();
            String query = "SELECT * FROM Menu_items WHERE category = '" + cat + "'";            
            res = st.executeQuery(query);
        }
        return res;
    }
    
    public static ResultSet displayItem(String id) throws ClassNotFoundException, SQLException {
        ServerConnection.setConnection();
        String query = null;
        ResultSet res = null;
        
        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();
            
            query = "SELECT * from Menu_items where item_id = '" +id+ "'";
            
            res = st.executeQuery(query);
            
        }
        return res;
    }
    
    public static boolean isUpdated(String id, String name, String category, String ingredients, double price) throws ClassNotFoundException, SQLException {
        ServerConnection.setConnection();
        String query = null;
        
        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            query = "UPDATE Menu_items SET name = ?, ingredients = ?, price = ?, category = ? where item_id = ?";
            
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, name);
            pst.setString(2, ingredients);
            pst.setDouble(3, price);
            pst.setString(4, category);
            pst.setString(5, id);
            
            int result = pst.executeUpdate();
            
            if (result > 0)
                return true;
            else
                return false;
        }
        else 
            return false;
    }
    
    public static boolean isDeleted(int id) throws ClassNotFoundException, SQLException {
        ServerConnection.setConnection();
        String query = "DELETE from Menu_items where item_id = ?";
        
        try {
            if (ServerConnection.getConnectionStatus()) {
                Connection con = ServerConnection.getConnection();
                PreparedStatement pst = con.prepareStatement(query);
                pst.setInt(1, id);
                
                int result = pst.executeUpdate();
                
                if (result > 0)
                    return true;
                else
                    return false;

            }
            else {
                return false;            
            }
        } catch (Exception e) {
            e.getStackTrace();
            System.out.println(e);
            return false;
        }
    }
 
}
