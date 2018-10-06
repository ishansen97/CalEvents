/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package reservation;
import Connection.ServerConnection;
import java.sql.*;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DELL
 */
public class EventViewer {
    private String event_id;

    public EventViewer(String event_id) {
        this.event_id = event_id;
    }
    
    public ResultSet getSeats() throws ClassNotFoundException, SQLException {
        ServerConnection.setConnection();
        String query = null;
        ResultSet res = null;
        
        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();
            
            query = "SELECT DISTINCT s.seat_num FROM seats s WHERE s.event_ID = '" +event_id+ "' AND seat_num NOT IN (SELECT seat_num FROM reservation_seats rs1, reservation r1 WHERE r1.res_id = rs1.res_id AND r1.event_id = '" +event_id+ "')";
            
            res = st.executeQuery(query);
            
        }
        return res;
    }
    
    //to display the event details
    public ResultSet getEventDetails() throws ClassNotFoundException, SQLException {
        ServerConnection.setConnection();
        String query = null;
        ResultSet res = null;
        
        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();
            
            query = "select event_name,description,date,start_time,end_time from public_booked_events where event_ID = '" +event_id+ "'";
            res = st.executeQuery(query);
        }
        return res;
    }
    
    public ResultSet getFirstSeat() throws ClassNotFoundException, SQLException {
        ServerConnection.setConnection();
        String query = null;
        ResultSet res = null;
        
        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();
            
            query = "select seat_num from seats where event_ID = '" +event_id+ "' order by event_ID ASC LIMIT 1";
            
            res = st.executeQuery(query);
            
            
        }
        return res;
    }
    
    //to display the upcoming events on the calendar page
    public static ResultSet getEventView() throws ClassNotFoundException, SQLException {
        ServerConnection.setConnection();
        String query = null;
        ResultSet res = null;
        java.util.Date date = new java.util.Date();
        SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
        String curDate = sdf.format(date);
        
        
        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();
            
            query = "select event_ID,event_name,date from public_booked_events where date > '" +curDate+ "' order by date ASC";
            
            res = st.executeQuery(query);
        }
        return res;
    }
    
    //to display the number of seats available for a given event
    public int getNoOfSeats() throws ClassNotFoundException, SQLException {
        ServerConnection.setConnection();
        String query = null;
        String query1 = null;
        ResultSet res = null;
        ResultSet res1 = null;
        int count = 0;
        
        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();
            Statement st1 = con.createStatement();
            
            query = "SELECT DISTINCT s.seat_num FROM seats s WHERE s.event_ID = '" +event_id+ "' AND seat_num NOT IN (SELECT seat_num FROM reservation_seats rs1, reservation r1 WHERE r1.res_id = rs1.res_id AND r1.event_id = '" +event_id+ "')";
            query1 = "SELECT seat_num from seats where event_ID = '" +event_id+ "'";
            
            res = st.executeQuery(query);
            res1 = st1.executeQuery(query1);
            
            while (res.next()) {
                count++;
            }
           
            /*if (res1.next()) {
                while (res1.next()) {
                    count++;
                }
            }*/
      
            
        }
        return count;
    }
    
    public boolean isBookedByCustomer(String customer_id) throws ClassNotFoundException, SQLException {
        ServerConnection.setConnection();
        String query = null;
        
        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();
            query = "SELECT * FROM reservation WHERE cus_id = '" +customer_id+ "' AND event_id = '" +event_id+ "'";
            
            ResultSet result = st.executeQuery(query);
            
            if (result.next())
                return true;
            else
                return false;
        }
        else
            return false;
    }
    
    public static ResultSet getEventName(String event_id) {
        String query = null;
        ResultSet result = null;
        try {
            ServerConnection.setConnection();
            
            if (ServerConnection.getConnectionStatus()) {
                Connection con = ServerConnection.getConnection();
                Statement st = con.createStatement();
                query = "SELECT event_name FROM public_booked_events WHERE event_ID = '" +event_id+ "'";
                
                result = st.executeQuery(query);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EventViewer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(EventViewer.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return result;
        }
    }
    
    public ResultSet getEventSeats(String event_id) {
        String query = null;
        ResultSet result = null;
        try {
            ServerConnection.setConnection();
            
            if (ServerConnection.getConnectionStatus()) {
                Connection con = ServerConnection.getConnection();
                Statement st = con.createStatement();
                query = "SELECT seat_num FROM seats WHERE event_ID = '" +event_id+ "'";
                
                result = st.executeQuery(query);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EventViewer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(EventViewer.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return result;
        }
    }
    
    public ResultSet getSeatArrangement() {
        String query = null;
        ResultSet result = null;
        try {
            ServerConnection.setConnection();
            
            if (ServerConnection.getConnectionStatus()) {
                Connection con = ServerConnection.getConnection();
                Statement st = con.createStatement();
                query = "SELECT columns, x_columns, y_columns FROM event_seat_arrangement WHERE event_ID = '"+event_id+"'";
                
                result = st.executeQuery(query);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EventViewer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(EventViewer.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return result;
        }
    }
}
