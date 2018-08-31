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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author User
 */
public class Tents extends Facility {
    
    private String color;
    private String size;
    
    public Tents(){}
    
    public Tents(String name, int quantity, String condition, String color, String size){
        super(name,quantity,condition);
        this.color = color;
        this.size = size;
    }
    
    @Override
    public int getAvailableQuantity(String tentKey) {
        PreparedStatement getA = null;
    
        ResultSet quantity = null ;
        
        int availableQuantity = 0 ;
        
        try {                   
            if (dbcon.isConnected())
            {
                Connection connect = dbcon.getCon();
                
                getA = connect.prepareStatement("SELECT * FROM `facilitytent` WHERE `facilityID` = ?");
                getA.setString(1,tentKey);
                
                quantity = getA.executeQuery();
                
                while(quantity.next()){
                
                    availableQuantity = quantity.getInt("availableQuantity");
                    
                }
                
            }
            
            else return -99;
        
        } catch (ClassNotFoundException ex) {
                
            Logger.getLogger(Sounds.class.getName()).log(Level.SEVERE, null, ex);
            
        } catch (SQLException ex) {
            
            Logger.getLogger(Sounds.class.getName()).log(Level.SEVERE, null, ex);
            
        }
        
        return availableQuantity;
    }

    @Override
    public int getTotalQuantity(String tentKey) {
        
        PreparedStatement getT = null;
        ResultSet quantity = null ;
        int totalQuantity = 0 ;
        
        try {                   
            if (dbcon.isConnected())
            {
                Connection connect = dbcon.getCon();
                
                getT = connect.prepareStatement("SELECT * FROM `facilitytent` WHERE `facilityID` = ?");
                getT.setString(1,tentKey);
                
                quantity = getT.executeQuery();
                
                while(quantity.next()){
                
                    totalQuantity = quantity.getInt("totalQuantity");
                    
                }
                
            }
            
            else return -99;
        
        } catch (ClassNotFoundException ex) {
                
            Logger.getLogger(Sounds.class.getName()).log(Level.SEVERE, null, ex);
            
        } catch (SQLException ex) {
            
            Logger.getLogger(Sounds.class.getName()).log(Level.SEVERE, null, ex);
            
        }
        
        return totalQuantity;
    }

    @Override
    public boolean updateCondition(String tentKey, String condition) {
            
        PreparedStatement updateConditionQ = null;
        
        int updated = 0;
        
        try {
            if (dbcon.isConnected())
            {
                Connection connect = dbcon.getCon();
                
                updateConditionQ = connect.prepareStatement("UPDATE `facilities` SET `facilityCondition` = ? WHERE `facilityID` = ?");
                
                updateConditionQ.setString(1, condition);
                
                updateConditionQ.setString(2, tentKey);
                
                
                updated = updateConditionQ.executeUpdate();
                
                
            }
            
            else return false;
            
        } catch (ClassNotFoundException ex) {
            
            Logger.getLogger(Sounds.class.getName()).log(Level.SEVERE, null, ex);
            
        } catch (SQLException ex) {
            
            Logger.getLogger(Sounds.class.getName()).log(Level.SEVERE, null, ex);
            
        }
        
        if(updated == 1) return true;
        
        else return false;
    }

    @Override
    public boolean reduceAvailableQuantity(int quantity, String tentKey) {
        PreparedStatement reduceAvailable = null;
        
        int availableQuantity = getAvailableQuantity(tentKey);
        
        availableQuantity = availableQuantity - quantity;
        
        int reduced = 0 ;
        
        try {
            if (dbcon.isConnected())
            {
                Connection connect = dbcon.getCon();
                 
                reduceAvailable = connect.prepareStatement("UPDATE `facilities` SET `availableQuantity` = ? WHERE `facilityID` = ?");
                
                reduceAvailable.setInt(1, availableQuantity);
                
                reduceAvailable.setString(2, tentKey);
                
                reduced = reduceAvailable.executeUpdate();
                
            }
            
            else return false;
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Sounds.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Sounds.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        if(reduced == 1) return true;
        
        else return false;
    }

    @Override
    public boolean incrementAvailableQuantity(int quantity, String tentKey) {
        
        PreparedStatement incrementAvailable = null;
        
        int availableQuantity = getAvailableQuantity(tentKey);
        
        availableQuantity = availableQuantity + quantity;
        
        int incremented = 0 ;
        
        try {
            if (dbcon.isConnected())
            {
                Connection connect = dbcon.getCon();
                 
                incrementAvailable = connect.prepareStatement("UPDATE `facilities` SET `availableQuantity` = ? WHERE `facilityID` = ?");
                
                incrementAvailable.setInt(1, availableQuantity);
                
                incrementAvailable.setString(2, tentKey);
                
                incremented = incrementAvailable.executeUpdate();
                
            }
            
            else return false;
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Sounds.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Sounds.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        if(incremented == 1) return true;
        
        else return false;
    }

    @Override
    public boolean reduceTotalQuantity(int quantity, String tentKey) {
        
        PreparedStatement reduceTotal = null;
        
        int totalQuantity = getTotalQuantity(tentKey);
        
        totalQuantity = totalQuantity - quantity;
        
        int reduced = 0 ;
        
        try {
            if (dbcon.isConnected())
            {
                Connection connect = dbcon.getCon();
                 
                reduceTotal = connect.prepareStatement("UPDATE `facilities` SET `totalQuantity` = ? WHERE `facilityID` = ?");
                
                reduceTotal.setInt(1, totalQuantity);
                
                reduceTotal.setString(2, tentKey);
                
                reduced = reduceTotal.executeUpdate();
                
            }
            
            else return false;
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Sounds.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Sounds.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        if(reduced == 1) return true;
        
        else return false;
    }

    @Override
    public boolean incrementTotalQuantity(int quantity, String tentKey) {
        PreparedStatement incrementTotal = null;
        
        int totalQuantity = getTotalQuantity(tentKey);
        
        totalQuantity = totalQuantity + quantity;
        
        int incremented = 0 ;
        
        try {
            if (dbcon.isConnected())
            {
                Connection connect = dbcon.getCon();
                 
                incrementTotal = connect.prepareStatement("UPDATE `facilities` SET `totalQuantity` = ? WHERE `facilityID` = ?");
                
                incrementTotal.setInt(1, totalQuantity);
                
                incrementTotal.setString(2, tentKey);
                
                incremented = incrementTotal.executeUpdate();
                
            }
            
            else return false;
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Sounds.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Sounds.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        if(incremented == 1) return true;
        
        else return false;
    }

    @Override
    public String add_Facility() {
                
            int res = 0 ;
            
            PreparedStatement addTents = null;
            
        try {
            
            
            
            
            String id = generate_Facility_Id("tents");
                
            if (dbcon.isConnected())
            {
                Connection connect = dbcon.getCon();
            
                PreparedStatement soundExistCheck = connect.prepareStatement("SELECT * FROM `facilitytent` WHERE `facilitiyName` = ?");
                soundExistCheck.setString(1, itemName);
                
                ResultSet alreadyExist = soundExistCheck.executeQuery();
                
                if(alreadyExist.next()) return "Item Already Exist!";    
                
                else                
                {
                
                addTents = connect.prepareStatement("INSERT INTO `facilities` (`facilityID`, `facilitiyName`, `facilityType`, `availableQuantity`, `totalQuantity`, `facilityCondition`, `tentColor`, `tentSize`)"
                        + " VALUES (?,?,?,?,?,?,?,?)");
                
                addTents.setString(1, id);
                addTents.setString(2, itemName);
                addTents.setString(3, "tent");
                addTents.setInt   (4, quantity);
                addTents.setInt   (5, quantity);
                addTents.setString(6, condition);
                addTents.setString(7, color);
                addTents.setString(8, size);
                
                res = addTents.executeUpdate();
                }
                 
            }          
                
            else return "Connection ERROR!";
            
        } catch (ClassNotFoundException ex) {
            
            Logger.getLogger(Sounds.class.getName()).log(Level.SEVERE, null, ex);
            
        } catch (SQLException ex) {
            
            Logger.getLogger(Sounds.class.getName()).log(Level.SEVERE, null, ex);
            
        }
        
        if(res == 1) return "Data Inserted !!";
        
        else return "Data Not Inserted !!";
    }

    @Override
    public boolean remove_Facility(String f_ID) {
        PreparedStatement deleteQ = null;
        
        int deleted = 0;
        
        try {
            if (dbcon.isConnected())
            {
                Connection connect = dbcon.getCon();
                
                deleteQ = connect.prepareStatement("DELETE FROM `facilities` WHERE `facilityID` = ?");
                
                deleteQ.setString(1, f_ID);
                
                
                deleted = deleteQ.executeUpdate();
                
                
            }
            
            else return false;
            
        } catch (ClassNotFoundException ex) {
            
            Logger.getLogger(Sounds.class.getName()).log(Level.SEVERE, null, ex);
            
        } catch (SQLException ex) {
            
            Logger.getLogger(Sounds.class.getName()).log(Level.SEVERE, null, ex);
            
        }
        
        if(deleted == 1) return true;
        
        else return false;
    }
    
    public ResultSet fetch(){
        
            PreparedStatement fetch = null;
            ResultSet details = null;
            
        try {
            
            if(dbcon.isConnected()){
                Connection connect = dbcon.getCon();
                fetch = connect.prepareStatement("SELECT * FROM `facilitytent`");
                details = fetch.executeQuery();
            }
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Tents.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Tents.class.getName()).log(Level.SEVERE, null, ex);
        }
        
            return details;
    }
    
}

class demo {
public static void main(String[] args) throws ClassNotFoundException, SQLException{

    Facility n = new Tents();
    while(n.fetch().next()){
        System.out.println(n.fetch().getString("facilitiyName"));
    }
}

}