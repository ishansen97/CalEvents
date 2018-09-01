  package Event;


import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.*;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author hp
 */
public class Booked_Event {
    private String B_event_ID;
    private String B_event_name;
    private String B_category;
    private String B_event_discription;
    private Date B_date;
    private Time B_start_time;
    private Time B_end_time;
    private String location;
    private int seats;
    
    public Booked_Event(String B_event_name,String B_category,String B_event_discription,Date B_date,Time B_start_time,Time B_end_time,String location,int seats)
    {
        this.B_event_name = B_event_name;
        this.B_event_discription=B_event_discription;
        this.B_category = B_category;
        this.location = location;
        this.B_date = B_date;
        this.B_start_time = B_start_time;
        this.B_end_time = B_end_time;
        this.seats = seats;
    }
    
    public Booked_Event() {}
    public String generateBookEventId() throws ClassNotFoundException, SQLException{
        DBConnect dbcon = DBConnect.getInstance();
        String query = null;
        
        if(dbcon.isConnected()){
            Connection connect = dbcon.getCon();
            Statement stmt = connect.createStatement();
            query = "select event_ID from booked_event order by event_ID desc limit 1";
            
            ResultSet rs = stmt.executeQuery(query);
        
            if(rs.next()){
                String ID = rs.getString("event_ID");
                String[] parts = ID.split("BE0",2);
                int integerid = Integer.parseInt(parts[1]);
                integerid++;
                if (integerid > 1 && integerid < 10)
                    B_event_ID = "BE00"+integerid;
                else
                    B_event_ID = "BE0" + integerid;
            }
            else 
                B_event_ID = "BE001";
        }
        return B_event_ID;
    }
    public boolean isInserted(){
    try{
        String eid = generateBookEventId();
        
        DBConnect connect = DBConnect.getInstance();
        String query = null;
        
        if(connect.isConnected()){
            try{
                Connection con = connect.getCon();
                query = "insert into booked_event values (?,?,?,?,?,?,?,?,?)";
                PreparedStatement st = con.prepareStatement(query);
                st.setString(1, B_event_ID);
                st.setString(2, B_event_name);
                st.setString(3, B_category);
                st.setString(4, B_event_discription);
                st.setDate(5, B_date);
                st.setTime(6,B_start_time);
                st.setTime(7, B_end_time);
                st.setString(8, location);
                st.setInt(9, seats);
                
                int result = st.executeUpdate();    
                
                if(result > 0 )
                    return true;
                else
                    return false;
            }catch(SQLException ex){
                Logger.getLogger(Booked_Event.class.getName()).log(Level.SEVERE, null, ex);
                return false;
            }
        }
        else
            return false;
    }catch(ClassNotFoundException ex){
        Logger.getLogger(Booked_Event.class.getName()).log(Level.SEVERE, null, ex);
        return false;
    }catch (SQLException ex){
        Logger.getLogger(Booked_Event.class.getName()).log(Level.SEVERE, null, ex);
        return false;
    }
   }
    public static ResultSet getBookedEventDetails()throws SQLException, ClassNotFoundException{
        DBConnect connect = DBConnect.getInstance();
        ResultSet result = null;
        
        if(connect.isConnected()){
            Connection con = connect.getCon();
            Statement st = con.createStatement();
            String query = "SELECT* FROM booked_event";
            result = st.executeQuery(query);
        }
        return result;
    }
    public static ResultSet displayThisBookedEvent(String event_id)throws ClassNotFoundException,SQLException{
        DBConnect connect = DBConnect.getInstance();
        ResultSet result = null;
        
        if(connect.isConnected()){
            Connection con = connect.getCon();
            Statement st = con.createStatement();
            String query = "SELECT* FROM booked_event WHERE event_ID = '"+event_id+"'";
            result = st.executeQuery(query);
        }
        return result;
    }
    public boolean isUpdated(String event_id) throws ClassNotFoundException, SQLException{
       DBConnect connect = DBConnect.getInstance();
       String query= null;
       if(connect.isConnected()){
           Connection con = connect.getCon();
           query = "UPDATE booked_event SET event_Name = ?,Category = ?,description=?,Date=?,start_time=?,end_time=?,location_id=?,no_seats=? WHERE event_ID='"+event_id+"'";
           PreparedStatement ps = con.prepareStatement(query);
           
           ps.setString(1,B_event_name);
           ps.setString(2,B_category);
           ps.setString(3,B_event_discription);
           ps.setDate(4,B_date);
           ps.setTime(5,B_start_time);
           ps.setTime(6,B_end_time);
           ps.setString(7,location);
           ps.setInt(8,seats);
           
           int result = ps.executeUpdate();
                
           
           if(result > 0)
               return true;
           else
               return false;
       }
       else
           return false;
    }
    public static boolean isDeleted(String event_id) throws ClassNotFoundException, SQLException{
        DBConnect connect = DBConnect.getInstance();
        String query = null;
        
        if(connect.isConnected()){
            Connection con = connect.getCon();
            query="DELETE FROM booked_event WHERE event_ID=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, event_id);
            
            int result = ps.executeUpdate();
            
            if(result > 0)
                return true;
            else
                return false;
        }
        else 
            return false;
    }
    
} 
