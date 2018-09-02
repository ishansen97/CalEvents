/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facilities.event;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Sachith Fernando
 */

public class Sounds extends Facility{

    private String brand;
    
    
    public Sounds(){
    
    }
    
    public Sounds( String name, String brand, int quantity, String condition) {
        
    super(name, quantity, condition);
    
    this.brand=brand;
    
    }
    
    @Override
    public int getAvailableQuantity(String soundKey) {
        PreparedStatement getA = null;
    
        ResultSet quantity = null ;
        
        int availableQuantity = 0 ;
        
        try {                   
            if (dbcon.isConnected())
            {
                Connection connect = dbcon.getCon();
                
                getA = connect.prepareStatement("SELECT * FROM `facilitysound` WHERE `facilityID` = ?");
                getA.setString(1,soundKey);
                
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
    public int getTotalQuantity(String soundKey) {   
        PreparedStatement getT = null;
        ResultSet quantity = null ;
        int totalQuantity = 0 ;
        
        try {                   
            if (dbcon.isConnected())
            {
                Connection connect = dbcon.getCon();
                
                getT = connect.prepareStatement("SELECT * FROM `facilitysound` WHERE `facilityID` = ?");
                getT.setString(1,soundKey);
                
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
    public String add_Facility() 
    {
        
            int res = 0 ;
            
            PreparedStatement addSounds = null;
            
        try {
            
            
            
            
            String id = generate_Facility_Id("sounds");
                
            if (dbcon.isConnected())
            {
                Connection connect = dbcon.getCon();
            
                PreparedStatement soundExistCheck = connect.prepareStatement("SELECT * FROM `facilitysound` WHERE `facilitiyName` = ? AND `soundsBrand` = ?");
                soundExistCheck.setString(1, itemName);
                soundExistCheck.setString(2, brand);
                
                ResultSet alreadyExist = soundExistCheck.executeQuery();
                
                if(alreadyExist.next()) return "Item Already Exist!";    
                
                else                
                {
                
                addSounds = connect.prepareStatement("INSERT INTO `facilities` (`facilityID`, `facilitiyName`, `facilityType`, `availableQuantity`, `totalQuantity`, `facilityCondition`, `soundsBrand`)"
                        + " VALUES (?,?,?,?,?,?,?)");
                
                addSounds.setString(1, id);
                addSounds.setString(2, itemName);
                addSounds.setString(3, "sound");
                addSounds.setInt   (4, quantity);
                addSounds.setInt(5, quantity);
                addSounds.setString(6, condition);
                addSounds.setString(7, brand);
                
                res = addSounds.executeUpdate();
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
    public boolean updateCondition(String soundKey,String condition) {
            
        PreparedStatement updateConditionQ = null;
        
        int updated = 0;
        
        try {
            if (dbcon.isConnected())
            {
                Connection connect = dbcon.getCon();
                
                updateConditionQ = connect.prepareStatement("UPDATE `facilities` SET `facilityCondition` = ? WHERE `facilityID` = ?");
                
                updateConditionQ.setString(1, condition);
                
                updateConditionQ.setString(2, soundKey);
                
                
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

    @Override
    public boolean reduceAvailableQuantity(int quantity, String soundKey) {
        
        PreparedStatement reduceAvailable = null;
        
        int availableQuantity = getAvailableQuantity(soundKey);
        
        availableQuantity = availableQuantity - quantity;
        
        int reduced = 0 ;
        
        try {
            if (dbcon.isConnected())
            {
                Connection connect = dbcon.getCon();
                 
                reduceAvailable = connect.prepareStatement("UPDATE `facilities` SET `availableQuantity` = ? WHERE `facilityID` = ?");
                
                reduceAvailable.setInt(1, availableQuantity);
                
                reduceAvailable.setString(2, soundKey);
                
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
    public boolean incrementAvailableQuantity(int quantity, String soundKey) {
        
        PreparedStatement incrementAvailable = null;
        
        int availableQuantity = getAvailableQuantity(soundKey);
        
        availableQuantity = availableQuantity + quantity;
        
        int incremented = 0 ;
        
        try {
            if (dbcon.isConnected())
            {
                Connection connect = dbcon.getCon();
                 
                incrementAvailable = connect.prepareStatement("UPDATE `facilities` SET `availableQuantity` = ? WHERE `facilityID` = ?");
                
                incrementAvailable.setInt(1, availableQuantity);
                
                incrementAvailable.setString(2, soundKey);
                
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
    public boolean reduceTotalQuantity(int quantity, String soundKey) {
        
        PreparedStatement reduceTotal = null;
        
        int totalQuantity = getTotalQuantity(soundKey);
        
        totalQuantity = totalQuantity - quantity;
        
        int reduced = 0 ;
        
        try {
            if (dbcon.isConnected())
            {
                Connection connect = dbcon.getCon();
                 
                reduceTotal = connect.prepareStatement("UPDATE `facilities` SET `totalQuantity` = ? WHERE `facilityID` = ?");
                
                reduceTotal.setInt(1, totalQuantity);
                
                reduceTotal.setString(2, soundKey);
                
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
    public boolean incrementTotalQuantity(int quantity, String soundKey) {
        
        PreparedStatement incrementTotal = null;
        
        int totalQuantity = getTotalQuantity(soundKey);
        
        totalQuantity = totalQuantity + quantity;
        
        int incremented = 0 ;
        
        try {
            if (dbcon.isConnected())
            {
                Connection connect = dbcon.getCon();
                 
                incrementTotal = connect.prepareStatement("UPDATE `facilities` SET `totalQuantity` = ? WHERE `facilityID` = ?");
                
                incrementTotal.setInt(1, totalQuantity);
                
                incrementTotal.setString(2, soundKey);
                
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
    
    public ResultSet fetch(){
        
            PreparedStatement fetch = null;
            ResultSet details = null;
            
        try {
            
            if(dbcon.isConnected()){
                Connection connect = dbcon.getCon();
                fetch = connect.prepareStatement("SELECT * FROM `facilitysound`");
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
