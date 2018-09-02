/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package supporting;

import facilities.event.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author User
 */
public class Fetch {   
    DBConnect dbcon;
    
    public Fetch(){
        dbcon = DBConnect.getInstance();
    }
    
    public ResultSet fetchTypes() throws SQLException, ClassNotFoundException{
            
    ResultSet result = null;        
    PreparedStatement statement = null;
    
     if (dbcon.isConnected()) 
    {
    Connection connect = dbcon.getCon();
    
    statement = connect.prepareStatement("SELECT * FROM `types`");
    
    result = statement.executeQuery();
  
    }
    
    return result;
    
    }
}
