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