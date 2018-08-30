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
public class KitchenUtensils extends Facility {
    
    private String kUType ;
    
    public KitchenUtensils(){}
    
    public KitchenUtensils(String name, int quantity, String condition, String type){
        super(name,quantity,condition);
        this.kUType = type;
    
    }

    @Override
    public int getAvailableQuantity(String kitchenKey) {
        
        PreparedStatement getA = null;
    
        ResultSet quantity = null ;
        
        int availableQuantity = 0 ;
        
        try {                   
            if (dbcon.isConnected())
            {
                Connection connect = dbcon.getCon();
                
                getA = connect.prepareStatement("SELECT * FROM `facilitykitchen` WHERE `facilityID` = ?");
                getA.setString(1,kitchenKey);
                
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
    public int getTotalQuantity(String kitchenKey) {
        
        PreparedStatement getT = null;
        ResultSet quantity = null ;
        int totalQuantity = 0 ;
        
        try {                   
            if (dbcon.isConnected())
            {
                Connection connect = dbcon.getCon();
                
                getT = connect.prepareStatement("SELECT * FROM `facilitykitchen` WHERE `facilityID` = ?");
                getT.setString(1,kitchenKey);
                
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
    public boolean updateCondition(String kitchenKey, String condition) {
           
        PreparedStatement updateConditionQ = null;
        
        int updated = 0;
        
        try {
            if (dbcon.isConnected())
            {
                Connection connect = dbcon.getCon();
                
                updateConditionQ = connect.prepareStatement("UPDATE `facilities` SET `facilityCondition` = ? WHERE `facilityID` = ?");
                
                updateConditionQ.setString(1, condition);
                
                updateConditionQ.setString(2, kitchenKey);
                
                
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
    public boolean reduceAvailableQuantity(int quantity, String kitchenKey) {
        
        PreparedStatement reduceAvailable = null;
        
        int availableQuantity = getAvailableQuantity(kitchenKey);
        
        availableQuantity = availableQuantity - quantity;
        
        int reduced = 0 ;
        
        try {
            if (dbcon.isConnected())
            {
                Connection connect = dbcon.getCon();
                 
                reduceAvailable = connect.prepareStatement("UPDATE `facilities` SET `availableQuantity` = ? WHERE `facilityID` = ?");
                
                reduceAvailable.setInt(1, availableQuantity);
                
                reduceAvailable.setString(2, kitchenKey);
                
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
    public boolean incrementAvailableQuantity(int quantity, String kitchenKey) {
        
        PreparedStatement incrementAvailable = null;
        
        int availableQuantity = getAvailableQuantity(kitchenKey);
        
        availableQuantity = availableQuantity + quantity;
        
        int incremented = 0 ;
        
        try {
            if (dbcon.isConnected())
            {
                Connection connect = dbcon.getCon();
                 
                incrementAvailable = connect.prepareStatement("UPDATE `facilities` SET `availableQuantity` = ? WHERE `facilityID` = ?");
                
                incrementAvailable.setInt(1, availableQuantity);
                
                incrementAvailable.setString(2, kitchenKey);
                
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
    public boolean reduceTotalQuantity(int quantity, String kitchenKey) {
        
        PreparedStatement reduceTotal = null;
        
        int totalQuantity = getTotalQuantity(kitchenKey);
        
        totalQuantity = totalQuantity - quantity;
        
        int reduced = 0 ;
        
        try {
            if (dbcon.isConnected())
            {
                Connection connect = dbcon.getCon();
                 
                reduceTotal = connect.prepareStatement("UPDATE `facilities` SET `totalQuantity` = ? WHERE `facilityID` = ?");
                
                reduceTotal.setInt(1, totalQuantity);
                
                reduceTotal.setString(2, kitchenKey);
                
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
    public boolean incrementTotalQuantity(int quantity, String kitchenKey) {
        
        PreparedStatement incrementTotal = null;
        
        int totalQuantity = getTotalQuantity(kitchenKey);
        
        totalQuantity = totalQuantity + quantity;
        
        int incremented = 0 ;
        
        try {
            if (dbcon.isConnected())
            {
                Connection connect = dbcon.getCon();
                 
                incrementTotal = connect.prepareStatement("UPDATE `facilities` SET `totalQuantity` = ? WHERE `facilityID` = ?");
                
                incrementTotal.setInt(1, totalQuantity);
                
                incrementTotal.setString(2, kitchenKey);
                
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
            
            PreparedStatement addKitchen = null;
            
        try {
            
            
            
            
            String id = generate_Facility_Id("kitchen");
                
            if (dbcon.isConnected())
            {
                Connection connect = dbcon.getCon();
            
                PreparedStatement soundExistCheck = connect.prepareStatement("SELECT * FROM `facilitykitchen` WHERE `facilitiyName` = ? AND `kUType` = ?");
                soundExistCheck.setString(1, itemName);
                soundExistCheck.setString(2, kUType);
                
                ResultSet alreadyExist = soundExistCheck.executeQuery();
                
                if(alreadyExist.next()) return "Item Already Exist!";    
                
                else                
                {
                
                addKitchen = connect.prepareStatement("INSERT INTO `facilities` (`facilityID`, `facilitiyName`, `facilityType`, `availableQuantity`, `totalQuantity`, `facilityCondition`,`kUType`)"
                        + " VALUES (?,?,?,?,?,?,?)");
                
                addKitchen.setString(1, id);
                addKitchen.setString(2, itemName);
                addKitchen.setString(3, "kitchen");
                addKitchen.setInt   (4, quantity);
                addKitchen.setInt   (5, quantity);
                addKitchen.setString(6, condition);
                addKitchen.setString(7, kUType);
                
                res = addKitchen.executeUpdate();
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
    
}

