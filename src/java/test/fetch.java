/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import Connection.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Lini Eisha
 */
public class fetch {
     
DBConnect dbcon;
    
    public fetch(){
        dbcon = DBConnect.getInstance();
    }
    
    public ResultSet fetchData() throws SQLException, ClassNotFoundException{
            
    ResultSet result = null;        
    PreparedStatement statement = null;
    
     if (dbcon.isConnected()) 
    {
    Connection connect = dbcon.getCon();
    
    statement = connect.prepareStatement("SELECT * FROM `raw_materials`");
    
    result = statement.executeQuery();
  
    }
    
    return result;
    
    }
    
    
    public ResultSet fetchName() throws ClassNotFoundException, SQLException{
        
        ResultSet result = null;
        PreparedStatement statement = null;
        
        
     if (dbcon.isConnected()) 
    {
    Connection connect = dbcon.getCon();
    
    statement = connect.prepareStatement("SELECT name FROM `raw_materials`");
    
    result = statement.executeQuery();
  
    }
    
    return result;
    
    } 
}
