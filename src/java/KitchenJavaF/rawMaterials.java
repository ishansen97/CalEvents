/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package KitchenJavaF;

import Connection.Connectiondb;
import Connection.ServerConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Lini Eisha
 */
public class rawMaterials {
    
    private String r_ID;
    private String rawName;
    private int quantity; 
    private double unit_Price;
    Connection con = null;
    
    
    public rawMaterials(){
        con = Connectiondb.getdbConnection();
    }
    
    
    public void showstats(){
        if(con!=null){System.out.println("Connection Established!");}else{System.out.println("Connection failed!");}
    }
    

    public String generateRawId() throws ClassNotFoundException, SQLException {
        ServerConnection.setConnection();
        String query = null;
        String r_ID = null;
        
        if(ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();
            
            String sr = "select A_id from raw_marterials order by R_id DESC LIMIT 1";
            
            ResultSet result = st.executeQuery(query);
            
            if (result.next()) {
                String last_id = result.getString("R_id");
                String[] idParts = last_id.split("R0", 2);
                int integerId = Integer.parseInt(idParts[1]);
                integerId++;
                String r_id;
                
                if (integerId >= 10)
                    r_ID = "R0" + integerId;
                else if (integerId >= 2 && integerId < 10)
                    r_id = "R00" + integerId;
            }
            else
                r_ID = "R001";
        }
        return r_ID;
    }



    public static ResultSet getRaw() throws ClassNotFoundException, SQLException {
        ServerConnection.setConnection();
        String query = null;
        ResultSet res = null;
        
        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();
            
            String display = "SELECT * from raw_materials";
            
            res = st.executeQuery(display);
            
        }
        return res;
        
    }
    
    
    public boolean isInserted_raw() throws ClassNotFoundException, SQLException {
        String app = generateRawId();
        ServerConnection.setConnection();
        String ir = null;
        
        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            
            ir = "INSERT INTO raw_materials values(?,?,?)";
            
            PreparedStatement ps = con.prepareStatement(ir);
            ps.setString(1, name);
            ps.setString(2, quantity);
            ps.setString(3, unit_price);
            int result = ps.executeUpdate();
            
            if (result > 0)
                return true;
            else
                return false;
        }
        else
            return false;
    }
    
    
    public static boolean isUpdated_raw(String r_ID, String name, String quantity, double unit_price) throws ClassNotFoundException, SQLException {
        ServerConnection.setConnection();
        String ur = null;
        
        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            
            
            ur = "UPDATE raw_materials SET name = ?, quantity = ?, unit_price = ? where R_id = ?";
            
            PreparedStatement ps = con.prepareStatement(ur);
            ps.setString(1, name);
            ps.setString(2, quantity);
            ps.setString(3, unit_price)
            
            int result = pst.executeUpdate();
            
            if (result > 0)
                return true;
            else
                return false;
        }
        else 
            return false;
    }
    
    
   public static boolean isDeleted_raw(String id) throws ClassNotFoundException, SQLException {
        ServerConnection.setConnection();
        String dr= null;
        
        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();
            
            dr = "DELETE from raw_materials where R_id = '" +id+ "'";
            
            int result = st.executeUpdate(dr);
            
            if (result > 0)
                return true;
            else
                return false;
            
        }
        else
            return false;
    }
 
    
    
    
    public static ResultSet display_raw(String id) throws ClassNotFoundException, SQLException {
        ServerConnection.setConnection();
        String query = null;
        ResultSet res = null;
        
        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();
            
            query = "SELECT * from raw_materials where R_id = '" +id+ "'";
            
            res = st.executeQuery(query);
            
        }
        return res;
    }
    
    
      
    
    
    
    public ResultSet fetch_Raw_Materials(){
        ResultSet rawM = null;
         try{
            PreparedStatement ps = con.prepareStatement("select * from raw_materials ");
            rawM = ps.executeQuery();
            }catch(SQLException ex){ex.printStackTrace();} 
         return rawM;
    
    }

    public void get_Available_Quantity(String raw_Name){
        
        
    }
    
    
    public ResultSet separate_Food(String menu_ID){
        ResultSet foodID=null;
        
        return foodID;
    }
    
    public ResultSet determine_Raw_Materials(String food_ID){
        ResultSet raw_M=null;
    
        return raw_M;
    }
    
    public void deduct_Raw(String r_ID){}



    
}

