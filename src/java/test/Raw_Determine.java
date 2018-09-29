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
    //private String category;
    private String rawID;
    private String name;
    //private double price;
    //private String ingredients;
    private DBConnect dbcon;
    private double quantity;
    
    
    public Raw_Determine(){
        this.dbcon = DBConnect.getInstance();
    }
    
    public Raw_Determine(int item_id, String rawID, String name ,double quantity){
        this.item_id = item_id;
        this.rawID = rawID;
        this.name = name;
        this.quantity = quantity;
        this.dbcon = DBConnect.getInstance();
        
        //this.category = category;
        //this.price = price;
       // this.ingredients = ingredients;
    }

//    
//        public String determineRaw() throws ClassNotFoundException, SQLException{
//        
//        PreparedStatement determine,exist = null;
//        int res=0;
//        ResultSet resultName;
//        String rawName;
//        
//        if (dbcon.isConnected()) {
//        Connection connect = dbcon.getCon();                               
//                what the fuck is this? select raw id from anith tbale:3?? selecting that then? eka mata auto enna oni when i click:3
//            exist = connect.prepareStatement("SELECT `item_id` FROM `menu_items` where `item_id`=?");
//            exist.setInt(1, item_id);
//            //exist.setString(2,ingredients);
//            resultName = exist.executeQuery();
//        
//            if(resultName.next()){
//                determine = connect.prepareStatement("INSERT INTO `raw_determine`(`menuID`, `rawID`, `name`, `quntity`) VALUES (? ? ? ? )");
//                determine.setInt(1, item_id);
//                determine.setString(2, rawID);
//                determine.setString(3, name);
//                determine.setDouble(4, quantity);
//                res = determine.executeUpdate();
//                 
//                
//                if(res==1)return "new record inserted";
//                
//                else return "new record not inserted";
//                
//                }
//                    
//        }
//        return "Connection error!!";
//        }

 public String getMenuID(String name) throws ClassNotFoundException, SQLException{
     
     ResultSet getID = null;
     String id = "";
     PreparedStatement get = null;
     
       if (dbcon.isConnected())
            {
                Connection connect = dbcon.getCon();
                
                get = connect.prepareStatement("SELECT * FROM `menu_items` WHERE `name` = ?");
                get.setString(1, name);
                getID = get.executeQuery();
                
                while(getID.next()){
                    id = getID.getString("item_id");
                }
                
            }
        
     return id;
 }    

    public String determineRaw() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
        
}






class main{
    public static void main(String[] args) throws ClassNotFoundException, SQLException{
        
        Raw_Determine raw = new Raw_Determine(5 , "R008" , "mutton" , 0.5);
        System.out.println(raw.getMenuID("Apple Salad"));
        
    }
}