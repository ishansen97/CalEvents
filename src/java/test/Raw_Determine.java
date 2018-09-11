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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Lini Eisha
 */
public class Raw_Determine {
    
    private int item_id;
    private String category;
    private String name;
    private double price;
    private String ingredients;
    private DBConnect dbcon;
    
    
    public Raw_Determine(){
        this.dbcon = DBConnect.getInstance();
    }
    
    public Raw_Determine(int item_id,String category,String name,double price,String ingredients){
        this.item_id = item_id;
        this.category = category;
        this.name = name;
        this.price = price;
        this.ingredients = ingredients;
    }
    
    
        public String determineRaw() throws ClassNotFoundException, SQLException{
        
        PreparedStatement determine,exist = null;
        int res=0;
        ResultSet resultName;
        String rawName;
        
        if (dbcon.isConnected()) {
        Connection connect = dbcon.getCon();                               
                
            exist = connect.prepareStatement("SELECT name, ingredients FROM `menu_items` where name = ?");
            exist.setString(1, name);
            exist.setString(2,ingredients);
            resultName = exist.executeQuery();
        
            if(resultName.next()){
                

                List<String> results = new ArrayList<String>();
                    while(resultName.next()) {
                    results.add(resultName.getString(1));
                }
                    
            
            
            
                
            
            
            
            if(res==1)return "Inserted";
                
                else return "Not inserted";  
        
            }
        }  
        
        return "Connection error!!"; 
    
    
}
}






class main{
    public static void main(String[] args) throws ClassNotFoundException, SQLException{
        
        Raw_Determine raw = new Raw_Determine(10,"main","pizza" ,1050.50,"aaaa,bbb,ccc");
        raw.determineRaw();
    }
}