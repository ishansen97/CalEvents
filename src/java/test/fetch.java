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
    
    
    public ResultSet fetchAppetizers() throws SQLException, ClassNotFoundException{
            
    ResultSet result = null;        
    PreparedStatement statement = null;
    
     if (dbcon.isConnected()) 
    {
    Connection connect = dbcon.getCon();
    
    statement = connect.prepareStatement("SELECT * FROM `menuappetizer`");
    
    result = statement.executeQuery();
  
    }
    
    return result;
    
    }
    
    
    
    public ResultSet fetchMainDishes() throws SQLException, ClassNotFoundException{
            
    ResultSet result = null;        
    PreparedStatement statement = null;
    
     if (dbcon.isConnected()) 
    {
    Connection connect = dbcon.getCon();
    
    statement = connect.prepareStatement("SELECT * FROM `menumaindish`");
    
    result = statement.executeQuery();
  
    }
    
    return result;
    
    }
        
    
    
    
    public ResultSet fetchDesserts() throws SQLException, ClassNotFoundException{
            
    ResultSet result = null;        
    PreparedStatement statement = null;
    
     if (dbcon.isConnected()) 
    {
    Connection connect = dbcon.getCon();
    
    statement = connect.prepareStatement("SELECT * FROM `menudessert`");
    
    result = statement.executeQuery();
  
    }
    
    return result;
    
    }
   
    
    
    
    public ResultSet fetchRefreshments() throws SQLException, ClassNotFoundException{
            
    ResultSet result = null;        
    PreparedStatement statement = null;
    
     if (dbcon.isConnected()) 
    {
    Connection connect = dbcon.getCon();
    
    statement = connect.prepareStatement("SELECT * FROM `menurefreshment`");
    
    result = statement.executeQuery();
  
    }
    
    return result;
    
    }
            
            
}



class d {
public static void main(String[] args) throws SQLException, ClassNotFoundException{



    fetch f = new fetch();
    ResultSet r = f.fetchAppetizers();
    
    while(r.next()){
    System.out.println(r.getString("name")+"  :  ");    
    String in = r.getString("ingredients");
    String[] raws = in.split(",");
    for(int i=0;i<raws.length;i++){
        System.out.println(raws[i].trim());}
    }
}
}