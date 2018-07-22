/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.planner;
import com.dhtmlx.planner.*;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import Connection.ServerConnection;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.text.SimpleDateFormat;
/**
 *
 * @author DELL
 */
public class EventsManager extends DHXEventsManager {
    public EventsManager(HttpServletRequest request) {
        super(request);
    }
    
    @Override
    public Iterable<DHXEv> getEvents() {
        ArrayList<DHXEv> events = new ArrayList<DHXEv>();
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/YYYY");
        try {
            
            /*DHXEvent event1 = new DHXEvent();
            
            event1.setId(1);
            event1.setText("first event");
            event1.setStart_date("07/10/2018 01:00");
            event1.setEnd_date("07/10/2018 03:00");
            
            DHXEvent event2 = new DHXEvent();
            
            event2.setId(2);
            event2.setText("second event");
            event2.setStart_date("07/08/2018 07:00");
            event2.setEnd_date("07/08/2018 08:00");
            
            events.add(event1);
            events.add(event2);
            
            return events;*/
            
            String query = null;
            ServerConnection.setConnection();
            
            if (ServerConnection.getConnectionStatus()) {
                Connection con = ServerConnection.getConnection();
                Statement st = con.createStatement();
                
                query = "select * from public_events";
                
                ResultSet result = st.executeQuery(query);
                
                while (result.next()) {
                    DHXEvent event = new DHXEvent();
                    
                    String date = sdf.format(result.getDate("date"));
                    String start_time = result.getString("start_time");
                    String end_time = result.getString("end_time");
                    
                    //event.setId(result.getString("event_ID"));
                    event.setText(result.getString("event_name"));
                    event.setStart_date(date + " " + start_time);
                    event.setEnd_date(date + " " + end_time);
                    
                    events.add(event);
                }
            }
        }
        catch (Exception ex) {
            Logger.getLogger(EventsManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally {
            return events;
        }
        
    }
    
}
