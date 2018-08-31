   /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Event;
import com.dhtmlx.planner.*;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import Connection.ServerConnection;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.text.SimpleDateFormat;

import com.dhtmlx.planner.DHXEv;
import com.dhtmlx.planner.DHXEvent;
import com.dhtmlx.planner.DHXEventRec;
import com.dhtmlx.planner.DHXEventsManager;
import com.dhtmlx.planner.DHXStatus;

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
    //@Override
    public DHXStatus saveEvent(DHXEv event, DHXStatus status){
        try {
            ServerConnection.setConnection();
            
            if (ServerConnection.getConnectionStatus()) {
                Connection conn = ServerConnection.getConnection();
                java.sql.PreparedStatement ps = null;
                java.sql.ResultSet result = null;
                try{
                    String query = null;
                    String start_date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(event.getStart_date());
                    String end_date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(event.getEnd_date());
                    if(status == DHXStatus.UPDATE){
                        query = "UPDATE public_events Set event_name=?, location_ID=?, description=?, date=? , start_time=?, end_time=? WHERE  event_ID=?";
                        ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
                        ps.setString(1, event.getText());
                        ps.setString(2,start_date);
                        ps.setString(3, end_date);
                        ps.setInt(4, event.getId());
                    } else if(status == DHXStatus.INSERT){
                        query = "INSERT INTO public_events(event_ID,start_date,end_date)VALUES(null,?,?,?)";
                        ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
                        ps.setString(1, event.getText());
                        ps.setString(2, start_date);
                        ps.setString(3, end_date);
                    } else if(status == DHXStatus.DELETE){
                        query = "DELETE FROM events WHERE event_ID=? LIMIT 1 ";
                        ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
                        ps.setInt(1, event.getId());
                    }
                    if (ps!=null){
                        ps.executeUpdate();
                        result = ps.getGeneratedKeys();
                        if(result.next()){
                            event.setId(result.getInt(1));
                        }
                    }
                }catch (SQLException e) {
                    e.printStackTrace();
                }finally{
                    if(result != null) try {result.close();} catch (SQLException e){}
                    if(ps !=null) try {ps.close();} catch (SQLException e){}
                    if(conn != null) try {conn.close();}catch(SQLException e){}
                }
                return status;
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EventsManager.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(EventsManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return status;       
        
        
    }
    public DHXEv createEvent(String id, DHXStatus status){
            return new DHXEvent();
        }
}
    

