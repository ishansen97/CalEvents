/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facilities.allocation;

import facilities.event.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author Sachith
 */
public class Allocation {

    private String facilityType;
    private Facility table;
    private DBConnect dbcon;

    public Allocation(){
        this.dbcon = DBConnect.getInstance();
    }

    public Allocation(String facilityType) {
        this.dbcon = DBConnect.getInstance();
        this.facilityType = facilityType;
    }
    
    
    public void setType(String type){
    
        this.facilityType = facilityType;
        
    }
    
    public boolean toAllocate(String facility,int quantity,int avalq,String eventID,String itemID) throws ClassNotFoundException, SQLException{
        PreparedStatement ps = null;
        
        if(dbcon.isConnected()){
            
            Connection con = dbcon.getCon();
            ps = con.prepareStatement("INSERT INTO `allocation`(`facility`, `quantity`, `allocated`, `eventid`,availableQuantity,itemID) VALUES (?,?,?,?,?,?)");
            ps.setString(1, facility);
            ps.setInt(2, quantity);
            ps.setInt(3, 0);
            ps.setString(4, eventID);
            ps.setInt(5, avalq);
            ps.setString(6, itemID);
            int check = ps.executeUpdate();
            if(check>0) return true;
        
        }
    
        return false;
    }
    
    public boolean setAllocated(int id) throws ClassNotFoundException, SQLException{
    
        PreparedStatement ps = null;
        
        if(dbcon.isConnected()){
        
            Connection con = dbcon.getCon();
            ps =con.prepareStatement("UPDATE `allocation`SET `allocated`= 1 WHERE `id` = ?");
            ps.setInt(1, id);
            
            int check = ps.executeUpdate();
            if(check>0) return true;
        }
        
        
    return false;
    }
    
    public int getAllAvailableQuantity(int id) throws ClassNotFoundException, SQLException{
    
        int aval = 0;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        if(dbcon.isConnected()){
            
            Connection con = dbcon.getCon();
            ps = con.prepareStatement("SELECT * FROM `allocation` WHERE `id` = ?");
            ps.setInt(1, id);
            
            rs = ps.executeQuery();
            
            while(rs.next()){
                
                aval = rs.getInt("availableQuantity");
                
            }
            
            
        }
                
        return aval;
    }
    
    public boolean setAvailablesQ(int id,int quan) throws ClassNotFoundException, SQLException{
    
        PreparedStatement ps = null;
        
        int available = getAllAvailableQuantity(id);
         quan = quan + available;
        
        if(dbcon.isConnected()){
        
            Connection con = dbcon.getCon();
            ps =con.prepareStatement("UPDATE `allocation`SET `availableQuantity`= ? WHERE `id` = ?");
            ps.setInt(1, quan);
            ps.setInt(2, id);
            
            int check = ps.executeUpdate();
            if(check>0) return true;
        }
        
        
    return false;
    }
    
    public void find_facility_view(String type) {

        

        if (type.equalsIgnoreCase("s")) {
            System.out.println("Sounds");
            this.table = new Sounds();
        }else if (type.equalsIgnoreCase("l")) {
            System.out.println("Lights");
            this.table = new Lights();
        } else if (type.equalsIgnoreCase("c")) {
            System.out.println("Chairs");
            this.table = new Chairs();
        } else if (type.equalsIgnoreCase("h")) {
            System.out.println("Tents");
            this.table = new Tents();
        } else if (type.equalsIgnoreCase("t")) {
            System.out.println("Tables");
            this.table = new Tables();  
        } else if (type.equalsIgnoreCase("k")) {
            System.out.println("Kitchen");
            this.table = new KitchenUtensils();
        } else {
            System.out.println("Error");
        }
    }

    public ResultSet fetch_available_facilities() {

        ResultSet available = this.table.fetch();

        return available;

    }

    public boolean inserttoAllocation(String facility,int quantity,int avalq,String eventID) throws ClassNotFoundException, SQLException{
        PreparedStatement ps = null;
        
        if(dbcon.isConnected()){
        
            Connection con = dbcon.getCon();
            ps = con.prepareStatement("INSERT INTO `allocation`(`facility`, `quantity`, `allocated`, `eventid`,availableQuantity) VALUES (?,?,?,?,?)");
            ps.setString(1, facility);
            ps.setInt(2, quantity);
            ps.setInt(3, 0);
            ps.setString(4, eventID);
            ps.setInt(5, avalq);
            
            int res = ps.executeUpdate();
            if(res>0) return true;
                
            
        }
        
    
        return false;
    }
    
    public ResultSet fetch_to_allocate(String eventId) throws ClassNotFoundException, SQLException{
        ResultSet rs = null;
        PreparedStatement ps = null;
            if(dbcon.isConnected()){
            
                Connection con = dbcon.getCon();
                ps = con.prepareStatement("SELECT * FROM `allocation` WHERE `eventid` = ? AND allocated = 0 ");
                ps.setString(1, eventId);
                
            
                rs = ps.executeQuery();
            
            }
               
        return rs;
    }
    
    public ResultSet fetch_requested_facility_details() throws ClassNotFoundException, SQLException {

        ResultSet list = null;
        PreparedStatement statementList = null;

        if (dbcon.isConnected()) {
            Connection connect = dbcon.getCon();
            statementList = connect.prepareStatement("select * from facilityrequested");
            list = statementList.executeQuery();
            
        }
            return list;
        }

    }

    class testing {

        public static void main(String[] args) throws SQLException, ClassNotFoundException {
        
//        Allocation all = new Allocation();
//            System.out.println(all.getAllAvailableQuantity(79));
//        all.toAllocate("test", 1, "eventD");
////        all.find_facility_view();
//        ResultSet test = all.fetch_requested_facility_details();
//        String s="";
//        while(test.next()){
//            
//            s =test.getString("facilityRequested");
//            
//        }
//        
//            String[] parts = s.split(",");
//            for(int i = 0 ; i < parts.length ; i++){
//            System.out.println(parts[i]);
//            }
        
//        String str=" 12307";    
//        Pattern pattern = Pattern.compile("\\w+([0-9]+)\\w+([0-9]+)");
//        Matcher matcher = pattern.matcher(str); 
//        String[] whatevethefuck = new String[3];
//        for(int i = 0 ; i < matcher.groupCount(); i++) {
//        matcher.find();
//        whatevethefuck[i] =  matcher.group();
//        System.out.println(whatevethefuck[i]);
        }

    }
    