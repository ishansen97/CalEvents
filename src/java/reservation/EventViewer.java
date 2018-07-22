/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package reservation;
import Connection.ServerConnection;
import java.sql.*;
import java.util.Date;

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
            
            query = "select seat_num from seats where event_ID = '" +event_id+ "'";
            
            res = st.executeQuery(query);
            
        }
        return res;
    }
    
    public ResultSet getEventDetails() throws ClassNotFoundException, SQLException {
        ServerConnection.setConnection();
        String query = null;
        ResultSet res = null;
        
        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();
            
            query = "select event_name,description,date,start_time,end_time from public_events where event_ID = '" +event_id+ "'";
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
    
    public static ResultSet getEventView() throws ClassNotFoundException, SQLException {
        ServerConnection.setConnection();
        String query = null;
        ResultSet res = null;
        
        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();
            
            query = "select event_ID,event_name,date from public_events order by date DESC";
            
            res = st.executeQuery(query);
        }
        return res;
    }
    
}
