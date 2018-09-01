/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import java.*;
import Connection.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Lini Eisha
 */
public class Raw_Materials {
    private String id;
    private String name;
    private double price;
    private String qType;
    private double quantity;
    private DBConnect dbcon;  
    
    public Raw_Materials(){
        this.dbcon = DBConnect.getInstance();}
    
    public Raw_Materials(String name,double price,String type,double quantity){
        this.name = name;
        this.price = price;
        this.qType = type;
        this.quantity = quantity;
        this.dbcon = DBConnect.getInstance();
    }

    public Raw_Materials(String name, String price, String type, String qty) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public Raw_Materials(String name, double qty) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public Raw_Materials(String name, String type, double price, double qty) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
    public String generate_Raw_Id() throws ClassNotFoundException, SQLException{
        String query = null;

        if (dbcon.isConnected()) {
            Connection connect = dbcon.getCon();
            Statement stmt = connect.createStatement();
            query = "select rawID from raw_materials order by rawID desc limit 1";

            ResultSet rs = stmt.executeQuery(query);

            if (rs.next()) {
                String ID = rs.getString("rawID");
                String[] parts = ID.split("R00", 2);
                int integerid = Integer.parseInt(parts[1]);
                integerid++;
                id = "R00" + integerid;
            }
            else
                id = "R001";

        }
        return id;
            
    }
    
    public String insertRaw() throws ClassNotFoundException, SQLException{
        PreparedStatement addF,exist = null;
        int res=0;
        ResultSet resultName;
        String rawName;
        
        if (dbcon.isConnected()) {
        Connection connect = dbcon.getCon();                               
        id = generate_Raw_Id();
                
            exist = connect.prepareStatement("SELECT name from raw_materials where name = ?");
            exist.setString(1, name);
            resultName = exist.executeQuery();
                
                if(resultName.next()){ return "raw material already exist"; }
                
                else{
                addF = connect.prepareStatement("INSERT INTO `raw_materials`(`rawID`, `name`, `qType`, `quantity`, `unit_Price`) VALUES (?,?,?,?,?)");
                addF.setString(1, id);
                addF.setString(2, name);
                addF.setString(3, qType);
                addF.setDouble(4, quantity);
                addF.setDouble(5, price);
                res = addF.executeUpdate();
                
                if(res==1)return "new record inserted";
                
                else return "new record not inserted";                    
                    
                }
            }
        
        return "Connection error!!";
    }
    
    public ResultSet fetch_Raw(String namer) throws ClassNotFoundException, SQLException{
    
    PreparedStatement fetch_Raw = null;
    
               Connection connect = dbcon.getCon();
               fetch_Raw = connect.prepareStatement("SELECT * FROM `raw_materials` WHERE `name`=?");
               fetch_Raw.setString(1, namer);
               
               ResultSet raw = fetch_Raw.executeQuery();

               return raw;
}

    
    public String removeRaw(String name) throws ClassNotFoundException, SQLException{
        PreparedStatement removeF,exist = null;
        int res=0;
        ResultSet resultName;
        
        if (dbcon.isConnected()) {
        Connection connect = dbcon.getCon();                               
//                
//            exist = connect.prepareStatement("SELECT name from raw_materials where rawID = ?");
//            exist.setString(1, name);
//            resultName = exist.executeQuery();
                
//                if(resultName.next()){
                
        
                removeF = connect.prepareStatement("DELETE FROM `raw_materials` WHERE name = ?");
                removeF.setString(1, name);
                res = removeF.executeUpdate(); 
                                  
                    
//                }
//                else{
//                    return "Raw Material doesn't exist";
                }
        
        else 
                return "Connection error!";
        
        
                if(res==1)return "Record Removed";
                
                else return "Record does not exist";  
            
                        
                        
    }

    
       public String updatePrice(String name , double price) throws ClassNotFoundException, SQLException{
        PreparedStatement updateF,exist = null;
        int res=0;
        ResultSet resultName;
        String rawName;
        
        if (dbcon.isConnected()) {
        Connection connect = dbcon.getCon();                               
    
            /*exist = connect.prepareStatement("SELECT quantity from raw_materials where name = ?");
            exist.setString(1, name);
            resultName = exist.executeQuery();
                
                
                
                if(resultName.next()){*/
                updateF = connect.prepareStatement("UPDATE `raw_materials` SET  `unit_Price`=? WHERE name = ?");
                updateF.setDouble(1, price);
                updateF.setString(2,name);
                res = updateF.executeUpdate();
        }
                
         else
            return "Connection error!!";
        
                        if(res==1)return "Record Updated";
                        
                        else{ return "raw material doesn't exist"; }
        
    } 
       
    public double getQuantity(String name) throws ClassNotFoundException, SQLException{
        ResultSet resultQuantityQ;
        PreparedStatement sq= null;
        double quantity = 0.0;
        
        if(dbcon.isConnected()){
            Connection connect = dbcon.getCon();
       
            
            sq = connect.prepareStatement("SELECT * from raw_materials where name = ?");
            sq.setString(1,name);
            resultQuantityQ = sq.executeQuery();
            while(resultQuantityQ.next()){
                
                quantity = resultQuantityQ.getDouble("quantity");
                
            }
        }
        
        return quantity;
        
    }
    
    public String reduceQuantity(String name , double quantity) throws ClassNotFoundException, SQLException{
        
        PreparedStatement reduce= null;
        double reduced = 0;
        
        double getNewQuantity = getQuantity(name);
        getNewQuantity =  getNewQuantity - quantity  ;
        
        
        if (dbcon.isConnected())
            {
                Connection connect = dbcon.getCon();
                 
                reduce = connect.prepareStatement("UPDATE `raw_materials` SET `quantity` = ? WHERE `name` = ?");
                
                reduce.setDouble(1, getNewQuantity);
                
                reduce.setString(2, name);
                
                reduced = reduce.executeUpdate();
                
            }
        
        else
        return "connection error!";
        
        if(reduced==1)return "record added!";
        
        else return "record not added";
        
    }
    
    public String incrementQuantity(String name , double quantity) throws ClassNotFoundException, SQLException{
        PreparedStatement increment= null;
        double incremented = 0;
        
        double getNewQuantity = getQuantity(name);
        getNewQuantity = getNewQuantity + quantity;
        
        
        if (dbcon.isConnected())
            {
                Connection connect = dbcon.getCon();
                 
                increment = connect.prepareStatement("UPDATE `raw_materials` SET `quantity` = ? WHERE `name` = ?");
                
                increment.setDouble(1, getNewQuantity);
                
                increment.setString(2, name);
                
                incremented = increment.executeUpdate();
                
            }
        
        else
        return "connection error!";
        
        if(incremented==1)return "record added!";
        
        else return "record not added";
    }
    
    
  /* public ResultSet fetchTypes() throws SQLException, ClassNotFoundException{
            
    ResultSet result = null;        
    PreparedStatement statement = null;
    
     if (dbcon.isConnected()) 
    {
    Connection connect = dbcon.getCon();
    
    statement = connect.prepareStatement("SELECT * FROM `raw_materials`");
    
    result = statement.executeQuery();
  
    }
    
    return result;
    
    
    
    
}*/

    public String insertRaw(String name) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public String insertRaw(String name, double price, String type, double qty) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    }

class test{
public static void main(String[] args) throws ClassNotFoundException, SQLException{
   /* ResultSet result = null;
    String message = null;
    Raw_Materials raw = new Raw_Materials("noodles",1300.00,"kg",7);
    
    message = raw.insertRaw();
    if(message.equals("raw material already exist")){
        
    
        System.out.println(message);
        System.out.println("current quantity");
        //result= raw.fetch_Raw("vegetable oil");
        while(result.next()){
        System.out.print(result.getString("name")+"\t");
        System.out.print(result.getString("quantity")+"\t");
        System.out.print(result.getString("qType")+"\t");
        System.out.println(result.getString("unit_price"));
//        }
    }}
    else{
        System.out.println(message);
}*/
   
      Raw_Materials raw = new Raw_Materials();
//    System.out.println(raw.reduceQuantity("tomoto",12.0));
    System.out.println(raw.getQuantity("tomoto"));
    System.out.println(raw.incrementQuantity("tomoto", 12));
    
    //raw.removeRaw("tomoto");
   
    
    
}   }