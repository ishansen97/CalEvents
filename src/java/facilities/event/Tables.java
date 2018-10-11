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
public class Tables extends Facility{
    
    private String size;
    private String noOfC;
    private String shape;
    
    public Tables(){}
    
    public Tables(String name, int quantity, String condition, String size, String noOfC, String shape){
        super(name,quantity,condition);
        this.size = size;
        this.noOfC = noOfC;
        this.shape = shape;
        
    }
    @Override
    public String add_Facility() {
                               
            int res = 0 ;
            
            PreparedStatement addTents = null;
            
        try {
            
            
            
            
            String id = generate_Facility_Id("tables");
                
            if (dbcon.isConnected())
            {
                Connection connect = dbcon.getCon();
            
                PreparedStatement soundExistCheck = connect.prepareStatement("SELECT * FROM `facilitytable` WHERE `facilitiyName` = ? AND `nOfChairsPT` = ? AND `tableShape` = ?");
                soundExistCheck.setString(1, itemName);
                soundExistCheck.setString(2, noOfC);
                soundExistCheck.setString(3, shape);
                
                ResultSet alreadyExist = soundExistCheck.executeQuery();
                
                if(alreadyExist.next()) return "Item Already Exist!";    
                
                else                
                {
                
                addTents = connect.prepareStatement("INSERT INTO `facilities` (`facilityID`, `facilitiyName`, `facilityType`, `availableQuantity`, `totalQuantity`, `facilityCondition`, `tableSize`, `nOfChairsPT`, `tableShape`)"
                        + " VALUES (?,?,?,?,?,?,?,?,?)");
                
                addTents.setString(1, id);
                addTents.setString(2, itemName);
                addTents.setString(3, "table");
                addTents.setInt   (4, quantity);
                addTents.setInt   (5, quantity);
                addTents.setString(6, condition);
                addTents.setString(7, size);
                addTents.setString(8, noOfC);
                addTents.setString(9, shape);
                
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
                fetch = connect.prepareStatement("SELECT * FROM `facilitytable`");
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




