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
public class Event {
    private String event_id;
    private String event_name;
    private String description;
    private String location;
    private Date date;
    private Time start_time;
    private Time end_time;
    
    public Event()
    {
        
    }

    public Event(String event_name, String description, String location,Date date,Time start_time, Time end_time) {
        this.event_name = event_name;
        this.description = description;
        this.location = location;
        this.date = date;
        this.start_time = start_time;
        this.end_time = end_time;
    }

    Event(String event_name, String description, String location, String date, String start_time, String end_time) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public String generateEventId() throws ClassNotFoundException, SQLException{
        DBConnect dbcon = DBConnect.getInstance();
        String query = null;

        if (dbcon.isConnected()) {
            Connection connect = dbcon.getCon();
            Statement stmt = connect.createStatement();
            query = "select event_ID from public_events order by event_ID desc limit 1";             
            
            ResultSet rs = stmt.executeQuery(query);

            if (rs.next()) {
                String ID = rs.getString("event_ID");
                String[] parts = ID.split("E0", 2);
                int integerid = Integer.parseInt(parts[1]);
                integerid++;
                if(integerid > 1 && integerid<10)
                event_id = "E00" + integerid;
                else
                    event_id = "E0"+integerid;
            }
            else
                event_id = "E001";

        }
        return event_id;
            
    } 
    
    public String getTestString() {
        return "working";
    }
    
    public boolean isInserted() {
        try {
            String eId = generateEventId();
            
            DBConnect connect = DBConnect.getInstance();
            String query = null;
            
            if (connect.isConnected()) {
                try {
                    Connection con = connect.getCon();
                    query = "insert into public_events values(?,?,?,?,?,?,?)";
                    PreparedStatement st = con.prepareStatement(query);
                    st.setString(1, eId);
                    st.setString(2, event_name);
                    st.setString(3, location);
                    st.setString(4, description);
                    st.setDate(5, date);
                    st.setTime(6, start_time);
                    st.setTime(7, end_time);
                    
                    
                    int result = st.executeUpdate();
                    
                    if (result > 0)
                        return true;
                    else
                        return false;
                } catch (SQLException ex) {
                    Logger.getLogger(Event.class.getName()).log(Level.SEVERE, null, ex);
                    return false;
                }
            }
            else
                return false;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Event.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } catch (SQLException ex) {
            Logger.getLogger(Event.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
       
    }
    
    public static ResultSet getEventDetails() throws SQLException, ClassNotFoundException {
        DBConnect connect = DBConnect.getInstance();
        ResultSet result = null;
        
        if (connect.isConnected()) {
            Connection con = connect.getCon();
            Statement st = con.createStatement();
            String query = "SELECT * FROM public_events";
            result = st.executeQuery(query);
        }
        return result;
    }
    
    public static ResultSet displayThisEvent(String event_id) throws ClassNotFoundException, SQLException {
        DBConnect connect = DBConnect.getInstance();
        ResultSet result = null;
        
        if (connect.isConnected()) {
            Connection con = connect.getCon();
            Statement st = con.createStatement();
            String query = "SELECT * FROM public_events WHERE event_ID = '" +event_id+ "'";
            result = st.executeQuery(query);
        }
        return result;
    }
    
    public boolean isUpdated(String event_id) throws ClassNotFoundException, SQLException {
        DBConnect connect = DBConnect.getInstance();
        String query = null;
        
        if (connect.isConnected()) {
            Connection con = connect.getCon();
            query = "UPDATE public_events SET event_name = ?, location_ID = ?, description = ?, date = ?, start_time = ?, end_time = ? WHERE event_ID = '" +event_id+ "'";
            PreparedStatement ps = con.prepareStatement(query);
            
            //assigning values 
            ps.setString(1, event_name);
            ps.setString(2, location);
            ps.setString(3, description);
            ps.setDate(4, date);
            ps.setTime(5, start_time);
            ps.setTime(6, end_time);
            
                int result = ps.executeUpdate();
               
            
            if (result > 0)
                return true;
            else
                return false;
        } 
        else
            return false;
    }
    public static boolean isDeleted(String event_id) throws ClassNotFoundException, SQLException {
        DBConnect connect = DBConnect.getInstance();
        String query = null;
        
        if(connect.isConnected()){
            Connection con = connect.getCon();
            query = "DELETE FROM public_events WHERE event_ID=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, event_id);
            
            int result = ps.executeUpdate();
            
            if (result > 0)
                return true;
            else
                return false;
        }
        else
            return false;
    }
    public static ResultSet Next_start_time(String location, String date) throws ClassNotFoundException, SQLException
    {
        DBConnect connect = DBConnect.getInstance();
        String query = null;
        ResultSet result = null;
        
        if(connect.isConnected()){
            Connection con = connect.getCon();
            Statement st = con.createStatement();
            query = "SELECT end_time" +
                    "FROM public_events" +
                    "WHERE date ='" +date+ "' AND location_ID = '" +location+
                    "' ORDER BY end_time DESC LIMIT 1";
            
            result = st.executeQuery(query);
            
        
        }
        
        return result;
    
    }
    
    public static ResultSet getLastEndTime(String location, String date) throws ClassNotFoundException, SQLException {
        DBConnect connect = DBConnect.getInstance();
        String query = null;
        ResultSet result = null;
        
        if(connect.isConnected()){
            Connection con = connect.getCon();
            Statement st = con.createStatement();
            query = "SELECT ADDTIME(end_time, '2:00:00') AS 'next_start_time' FROM public_events WHERE date = '" +date+ "' AND location_ID = '" +location+ "' ORDER BY end_time DESC LIMIT 1";
            
            result = st.executeQuery(query);
        
        }
        
        return result;
    }
    
    public static boolean isValidTime(String location, String date) throws ClassNotFoundException, SQLException {
        DBConnect connect = DBConnect.getInstance();
        String query = null;
        ResultSet result = null;
        
        if(connect.isConnected()){
            Connection con = connect.getCon();
            Statement st = con.createStatement();
            query = "SELECT end_time" +
                    "FROM public_events" +
                    "WHERE date ='" +date+ "' AND location_ID = '" +location+
                    "' ORDER BY end_time DESC LIMIT 1";
            
            result = st.executeQuery(query);
        
        }
        return false;
        
    }
    /*public static String getCount(String id)throws ClassNotFoundException, SQLException {
         DBConnect connect = DBConnect.getInstance();
        String query = null;
        ResultSet result = null;
        
        if(connect.isConnected()){
            Connection con = connect.getCon();
            Statement st = con.createStatement();
//            query ="SELECT COUNT(*) FROM public_events";
            result = st.executeQuery(query);
        }
      
    }*/
    
    public static ResultSet searchPublicEvents(String search) {
        String query = null;
        ResultSet result = null;
            
        try {
            DBConnect connect = DBConnect.getInstance();
            
            if(connect.isConnected()){
                Connection con = connect.getCon();
                Statement st = con.createStatement();
                query = "SELECT * FROM public_events WHERE event_ID LIKE '%"+search+"%' OR event_name LIKE '%"+search+"%' OR location_ID LIKE '%"+search+"%' OR description LIKE '%"+search+"%' OR date LIKE '%"+search+"%'";
                
                System.out.println(query);
                result = st.executeQuery(query);
                
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Event.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        } catch (SQLException ex) {
            Logger.getLogger(Event.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        } finally {
            return result;
        }
    }
}



