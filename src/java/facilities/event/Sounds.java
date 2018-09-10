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
