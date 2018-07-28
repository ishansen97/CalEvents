/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package reservation;
import java.sql.*;
import Connection.ServerConnection;

/**
 *
 * @author DELL
 */
public class Reservation {
    private String res_id = null;
    private String event_id;
    private int seat_no;
    private String seat_array;
    private String cus_id;
    private Date res_date;
    private int[] seats;
    
    public Reservation() {}

    public Reservation(String event_id, String seat_array, String cus_id, Date res_date) {
        this.event_id = event_id;
        this.seat_array = seat_array;
        this.cus_id = cus_id;
        this.res_date = res_date;
    }
    
    public int[] SplitSeats() {
        if (seat_array.contains(",")) {
            String[] arr = seat_array.split(",");
            int len = arr.length - 1;
            seats = new int[len];
            
            for (int i = 0; i < len; i++) {
                seats[i] = Integer.parseInt(arr[i + 1]);
            }
        }
        else {
            seat_no = Integer.parseInt(seat_array);
        }
        return seats;
    }
    
    public String generateResId() throws ClassNotFoundException, SQLException {
        String query = null;
        ServerConnection.setConnection();
        
        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();
            query = "select res_id from reservation order by res_id DESC limit 1";
            
            ResultSet result1 = st.executeQuery(query);
            
            if (result1.next()) {
                String last_id = result1.getString("res_id");
                String[] idParts = last_id.split("R00", 2);
                int integerId = Integer.parseInt(idParts[1]);
                integerId++;
                
                if (integerId >= 10)
                    res_id = "R0" + integerId;
                else if (integerId >= 2 && integerId < 10) 
                    res_id = "R00" + integerId;
            }
            else
                res_id = "R001";
        }
        return res_id;
    }
    
    public boolean isInserted() throws ClassNotFoundException, SQLException {
        String reservation = generateResId();
        String query = null;
        int[] seat_arr = SplitSeats();
        
        ServerConnection.setConnection();
        
        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            query = "Insert into reservation values(?,?,?,?)";
            
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, reservation);
            pst.setString(2, cus_id);
            pst.setString(3, event_id);
            pst.setDate(4, res_date);
            
            int result = pst.executeUpdate();
            
            if (result > 0) {
                String query1 = "INSERT INTO reservation_seats values(?,?)";
                int len = seat_arr.length;
                
                for (int i = 0; i < len; i++) {
                    PreparedStatement pst1 = con.prepareStatement(query1);
                    pst1.setString(1, reservation);
                    pst1.setInt(2, seat_arr[i]);
                    pst1.executeUpdate();
                }
                return true;
            }
            else
                return false;
        }
        else
            return false;
    }

    public String getRes_id() {
        return res_id;
    }

    public String getEvent_id() {
        return event_id;
    }

    public int getSeat_no() {
        return seat_no;
    }

    public String getCus_id() {
        return cus_id;
    }

    public Date getRes_date() {
        return res_date;
    }
    
    public boolean isDeleted(String res_id) throws ClassNotFoundException, SQLException {
        String query = null;
        ServerConnection.setConnection();
        
        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();
            
            query = "Delete from reservation where res_id = '" +res_id+ "'";
            
            int result = st.executeUpdate(query);
            
            if (result > 0)
                return true;
            else
                return false;
        }
        else
            return false;
    }
    
    
}
