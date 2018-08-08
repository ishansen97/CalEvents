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
public class MainDish extends Menu{
    private String ingredients;
    private double price;
 
   public MainDish(String name, String ingredients, double price) {
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
           
           query = "select Md_id from maindish order by Md_id DESC LIMIT 1 ";
           
           ResultSet result = st.executeQuery(query);
           
           if (result.next()) {
                String last_id = result.getString("Md_id");
                String[] idParts = last_id.split("Md0", 2);
                int integerId = Integer.parseInt(idParts[1]);
                integerId++;
                
                if (integerId >= 10)
                    menu_Id = "Md0" + integerId;
                else if (integerId >= 2 && integerId < 10)
                    menu_Id = "Md00" + integerId;
            }
            else
                menu_Id = "Md001";
        }
        return menu_Id;
   } 
   
   public boolean isInserted() throws ClassNotFoundException, SQLException {
       String mdish = generateMenuId();
       ServerConnection.setConnection();
       String query =null;
         
       if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            
            query = "INSERT INTO maindish values(?,?,?,?)";
            
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, mdish);
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
   
    public static ResultSet getMainDish() throws ClassNotFoundException, SQLException {
        ServerConnection.setConnection();
        String query = null;
        ResultSet res = null;
        
        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();
            
            query = "SELECT * from maindish";
            
            res = st.executeQuery(query);
            
        }
        return res;
        
    }
    
    public static ResultSet displayMain(String id) throws ClassNotFoundException, SQLException {
        ServerConnection.setConnection();
        String query = null;
        ResultSet res = null;
        
        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();
            
            query = "SELECT * from maindish where Md_id = '" +id+ "'";
            
            res = st.executeQuery(query);
            
        }
        return res;
    }
    
    public static boolean isUpdated(String id, String name, String ingredients, double price) throws ClassNotFoundException, SQLException {
        ServerConnection.setConnection();
        String query = null;
        
        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            query = "UPDATE maindish SET Md_name = ?, ingredient = ?, Price = ? where Md_id = ?";
            
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
            
            query = "DELETE from maindish where Md_id = '" +id+ "'";
            
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
