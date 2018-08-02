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
                String[] parts = ID.split("BE00",2);
                int integerid = Integer.parseInt(parts[1]);
                integerid++;
                B_event_ID = "BE00"+integerid;
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
                st.setString(1, eid);
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
} 
