/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package event.facilities;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Sachith Fernando
 */
public abstract class Facility {
    

    String itemId;    
    String itemName;    
    int quantity;    
    String condition;    
    DBConnect dbcon;
    
    
    public Facility(){this.dbcon = DBConnect.getInstance();}
    
    public Facility(String name,int quantity,String condition){
            
            this.itemName=name;
            
            this.quantity=quantity;
            
            this.condition=condition;
            
            this.dbcon = DBConnect.getInstance();
            
    }    
        
    public String generate_Facility_Id(String type) throws ClassNotFoundException, SQLException{
            
            String view = "";
            
            String id_Q = null;
            
            type = type.toUpperCase();
            
        if(type.equalsIgnoreCase("Tents")||type.equalsIgnoreCase("Sounds")||type.equalsIgnoreCase("Kitchen")||type.equalsIgnoreCase("Lights")||type.equalsIgnoreCase("Chairs")||type.equalsIgnoreCase("Tables"))
        {    
            if(type.equalsIgnoreCase("Tents")){
                
                type= "Hut";
            }
            
            switch(type){
                case "Hut": view = "facilitytent";
                break;
                case "TABLES": view = "facilitytable";
                break;
                case "LIGHTS": view = "facilitylight";
                break;
                case "KITCHEN": view = "facilitykitchen";
                break;
                case "CHAIRS": view = "facilitychair";
                break;
                case "SOUNDS": view = "facilitysound";
                break;
            }
            
            char start = type.charAt(0);
        
            
            if (dbcon.isConnected()) 
            {
                
                Connection connect = dbcon.getCon();
                
                Statement stmt = connect.createStatement();
                 
            
                id_Q = "select facilityID from " + view + " order by facilityID desc limit 1";

                ResultSet rs = stmt.executeQuery(id_Q);

                
                if (rs.next()) 
                {       
                    
                    String ID = rs.getString("facilityID");
                    
                    String[] parts = ID.split(start+"00", 2);
                    
                    int integerid = Integer.parseInt(parts[1]);
                    
                    integerid++;
                    
                    itemId = start+"00" + integerid;
                    
                }
                
                else
                    
                    itemId = start+"001";

            }
            
            else return "Connection Failed !!";
        
            return itemId;            
        }
        
        else 
            
            return "no such facility called " + type;
        
        }
        
        public abstract int getAvailableQuantity(String soundKey);
        public abstract int getTotalQuantity(String soundKey);
        public abstract boolean updateCondition(String soundKey,String condition);
        public abstract boolean reduceAvailableQuantity(int quantity, String soundKey);        
        public abstract boolean incrementAvailableQuantity(int quantity, String soundKey);
        public abstract boolean reduceTotalQuantity(int quantity, String soundKey);
        public abstract boolean incrementTotalQuantity(int quantity, String soundKey);
        public abstract String add_Facility();
        public abstract boolean remove_Facility(String f_ID);
    
}
