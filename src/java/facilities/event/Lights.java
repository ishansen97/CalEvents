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
 * @author User
 */
public class Lights extends Facility{
    
    public Lights(){}
    
    public Lights(String name, int quantity, String condition){
        
        super(name,quantity,condition);
        
    }
    
    @Override
    public String add_Facility() {
        
                
            int res = 0 ;
            
            PreparedStatement addTents = null;
            
        try {
            
            
            
            
            String id = generate_Facility_Id("lights");
                
            if (dbcon.isConnected())
            {
                Connection connect = dbcon.getCon();
            
                PreparedStatement soundExistCheck = connect.prepareStatement("SELECT * FROM `facilitylight` WHERE `facilitiyName` = ?");
                soundExistCheck.setString(1, itemName);
                
                ResultSet alreadyExist = soundExistCheck.executeQuery();
                
                if(alreadyExist.next()) return "Item Already Exist!";    
                
                else                
                {
                
                addTents = connect.prepareStatement("INSERT INTO `facilities` (`facilityID`, `facilitiyName`, `facilityType`, `availableQuantity`, `totalQuantity`, `facilityCondition`)"
                        + " VALUES (?,?,?,?,?,?)");
                
                addTents.setString(1, id);
                addTents.setString(2, itemName);
                addTents.setString(3, "light");
                addTents.setInt   (4, quantity);
                addTents.setInt   (5, quantity);
                addTents.setString(6, condition);
                
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
    
    public ResultSet fetch(){
        
            PreparedStatement fetch = null;
            ResultSet details = null;
            
        try {
            
            if(dbcon.isConnected()){
                Connection connect = dbcon.getCon();
                fetch = connect.prepareStatement("SELECT * FROM `facilitylight`");
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

