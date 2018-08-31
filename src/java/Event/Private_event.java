/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Event;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.*;


/**
 *
 * @author hp
 */
public class Private_event {
    private String P_event_ID;
    private String P_event_name;
    private String P_Customer_name;
    private String PhoneNo;
    private String email;
    private Date P_date;
    private Time P_start_time;
    private Time P_end_time;
    private String P_location;
    
    public Private_event(String P_event_name,String P_Customer_name,String PhoneNo,String email,Date P_date,Time P_start_time,Time P_end_time,String P_location)
    {
        this.P_event_name = P_event_name;
        this.P_Customer_name = P_Customer_name;
        this.PhoneNo = PhoneNo;
        this.email = email;
        this.P_date = P_date;
        this.P_start_time = P_start_time;
        this.P_end_time = P_end_time;
        this.P_location = P_location;
        
    }
    public String generatePrivateEventId() throws ClassNotFoundException, SQLException{
        DBConnect dbcon = DBConnect.getInstance();
        String query = null;
        
        if(dbcon.isConnected()){
            Connection connect = dbcon.getCon();
            Statement stmt = connect.createStatement();
            query = "select event_ID from private_events order by event_ID desc limit 1 ";
            
            ResultSet rs = stmt.executeQuery(query);
            
            if(rs.next()){
                String ID = rs.getString("event_ID");
                String[] parts = ID.split("PE0", 2);
                int integerid = Integer.parseInt(parts[1]);
                integerid++;
                if(integerid > 1 && integerid < 10)
                    P_event_ID = "PE00"+integerid;
                else
                    P_event_ID = "PE0"+integerid; 
            }
            else 
                P_event_ID = "PE001";   
        }    
        return P_event_ID;
    }
    public boolean isInserted(){
        try{
            String eId = generatePrivateEventId();            
            DBConnect connect = DBConnect.getInstance();
            String query = null;
            
            if(connect.isConnected()) {
                try{
                    Connection con = connect.getCon();
                    query = "insert into private_events values (?,?,?,?,?,?,?,?,?)";
                    PreparedStatement st = con.prepareStatement(query);
                    st.setString(1, eId);
                    st.setString(2, P_event_name);
                    st.setString(3, P_Customer_name);
                    st.setString(4, PhoneNo);
                    st.setString(5, email);
                    st.setDate(6,P_date);
                    st.setTime(7, P_start_time);
                    st.setTime(8, P_end_time);
                    st.setString(9, P_location);
                    
                    int result = st.executeUpdate();
                    
                    if(result > 0)
                        return true;
                    else 
                        return false;
                }catch (SQLException ex){
                    Logger.getLogger(Private_event.class.getName()).log(Level.SEVERE, null, ex);
                    return false;
                }
            }
            else
                return false;
        }catch (ClassNotFoundException ex){
            Logger.getLogger(Private_event.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }catch (SQLException ex){
            Logger.getLogger(Private_event.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

}
          
                    
                    
      
                    
                
           
            
                 
           
        
    
    
   
        
    
    
    
