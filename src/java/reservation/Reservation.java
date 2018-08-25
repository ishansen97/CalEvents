/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package reservation;
import java.sql.*;
import java.util.Arrays;
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

    public Reservation(String res_id, String seat_array) {
        this.res_id = res_id;
        this.seat_array = seat_array;
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
                String[] idParts = last_id.split("R0", 2);
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
    
    public static boolean isDeleted(String res_id) throws ClassNotFoundException, SQLException {
        String query = null;
        String query1 = null;
        ServerConnection.setConnection();
        
        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();
            
            query = "Delete from reservation_seats where res_id = '" +res_id+ "'";
            
            int result = st.executeUpdate(query);
            
            if (result > 0) {
                Statement st1 = con.createStatement();
                query1 = "DELETE FROM reservation where res_id = '" +res_id+ "'";
                int result1 = st1.executeUpdate(query1);
                
                if (result1 > 0)
                    return true;
                else
                    return  false;
            }
            else
                return false;
        }
        else
            return false;
    }
    
    public static ResultSet getReservationDetails(String customer) throws ClassNotFoundException, SQLException {
        ServerConnection.setConnection();
        String query = null;
        ResultSet res = null;
        
        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement stmt = con.createStatement();
            
            query = "SELECT pe.event_name,r.res_id,r.date FROM public_events pe, reservation r WHERE r.event_id = pe.event_ID AND r.cus_id = '" +customer+ "'";
            
            res = stmt.executeQuery(query);
        }
        
        return res;
    }
    
    public static ResultSet getReservedSeats(String res_id) throws ClassNotFoundException, SQLException {
        ServerConnection.setConnection();
        String query = null;
        ResultSet res = null;
        
        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement stmt = con.createStatement();
            
            query = "SELECT seat_num FROM reservation_seats WHERE res_id = '" +res_id+ "'";
            
            res = stmt.executeQuery(query);
        }
        
        return res;
    }
    
    public boolean containsAllSeats() throws ClassNotFoundException, SQLException {
        int[] seats = SplitSeats();
        int temp;
        int count = 0;
        ResultSet result = null;
        ResultSet result1 = null;
        
        /*for (int i = 0; i < seats.length; i++) {
            for (int j = i + 1; j < seats.length; j++) {
                if (seats[i] == seats[j]) {
                    temp = seats[i];
                    seats[i] = seats[j];
                    seats[j] = temp;
                }
            }
        }*/
        
        result = getReservedSeats(res_id);
        
        while (result.next()) {
            count++;
        }
        
        /*int[] reserved_seats = new int[count];
        
        result1 = getReservedSeats(res_id);
        
        int i = 0;
        
        while (result1.next()) {
            while (i < count) {
                reserved_seats[i] = result1.getInt("seat_num");
                i++;
                break;
            }
        }
        
        
        if (Arrays.equals(seats, reserved_seats)) 
            return true;
        else
            return false;*/
        
        if (seats.length == count)
            return true;
        else
            return false;
        
        
    }
    
    public boolean isUpdated() throws ClassNotFoundException, SQLException {
        int[] seats = SplitSeats();
        ServerConnection.setConnection();
        String query = null;
        String query1 = null;
        ResultSet result = null;
        
        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();
            Statement st1 = con.createStatement();
            
            if (containsAllSeats()) {
                query = "DELETE FROM reservation_seats WHERE res_id = '" +res_id+ "'";
                query1 = "DELETE FROM reservation WHERE res_id = '" +res_id+ "'";
                int res = st.executeUpdate(query);
                
                if (res > 0) {
                    int res1 = st1.executeUpdate(query1);
                    
                    if (res1 > 0)
                        return true;
                    else
                        return false;
                }
                else
                    return false;
            }
            else {
                for (int i = 0; i < seats.length; i++) {
                    query = "DELETE FROM reservation_seats WHERE res_id = '" +res_id+ "' AND seat_num = " +seats[i];
                    st.executeUpdate(query);
                }
                return true;
            }
            
        }
        else
            return false;
    }
    
    public static ResultSet displayReservationDetails(Reservation res) throws ClassNotFoundException, SQLException {
        ServerConnection.setConnection();
        String query = null;
        ResultSet result = null;
        String customer_id = res.getCus_id();
        
        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();
            query = "SELECT DISTINCT b.event_name,res.date,p.amount FROM public_events b,reservation res,payment p WHERE res.cus_id = '" +customer_id+ "' AND b.event_ID = res.event_id AND res.res_id = p.res_id";
            
            result = st.executeQuery(query);
        }
        return result;
    }
    
}
