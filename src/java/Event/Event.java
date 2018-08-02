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
    
    

    public Event(String event_name, String description, String location,Date date,Time start_time, Time end_time) {
        this.event_name = event_name;
        this.description = description;
        this.location = location;
        this.date = date;
        this.start_time = start_time;
        this.end_time = end_time;
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
                String[] parts = ID.split("E00", 2);
                int integerid = Integer.parseInt(parts[1]);
                integerid++;
                event_id = "E00" + integerid;
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
        

}

