/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package reservation;
import java.sql.*;
import Connection.ServerConnection;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.*;

/**
 *
 * @author DELL
 */
public class ReservationManagement {
    
    public static ResultSet getMonthlySummary(String date) {
        String[] splitDate = date.split("-");
        ResultSet result = null;
        try {
            ServerConnection.setConnection();
            String query = null;
            
            if (ServerConnection.getConnectionStatus()) {
                Connection con = ServerConnection.getConnection();
                query = "SELECT event_id, COUNT(*) "
                        + "FROM reservation_seat_details WHERE MONTH(date) = "
                        +"(SELECT MONTH(?)) "
                        +"GROUP BY event_id";
                
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, date);
                
                result = ps.executeQuery();
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return result;
        }
    }
    
    public static ResultSet getReservationSummaryForMonth(String date) {
        String[] splitDate = date.split("-");
        ResultSet result = null;
        try {
            ServerConnection.setConnection();
            String query = null;
            
            if (ServerConnection.getConnectionStatus()) {
                Connection con = ServerConnection.getConnection();
                Statement st = con.createStatement();
                query = "SELECT event_id, COUNT(*) FROM reservation WHERE MONTH(date) = MONTH('" +date+ "') GROUP BY event_id";
                
                result = st.executeQuery(query);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return result;
        }
    }
    
    public static ResultSet getWeeklySummary() {
        return null;
    }
    
    public static ResultSet getDailySummary() {
        return null;
    }
    
    public static ResultSet getSeatAvailability() {
        String query = null;
        ResultSet result = null;
        try {
            ServerConnection.setConnection();
            
            if (ServerConnection.getConnectionStatus()) {
                Connection con = ServerConnection.getConnection();
                Statement st = con.createStatement();
                query = "SELECT * FROM event_seat_availability WHERE date > CURRENT_TIME"; 
                result = st.executeQuery(query);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
        }finally {
            return result;
        }
    }
    
    public static ResultSet getPastEventDetails() {
        String query = null;
        ResultSet result = null;
        try {
            ServerConnection.setConnection();
            
            if (ServerConnection.getConnectionStatus()) {
                Connection con = ServerConnection.getConnection();
                Statement st = con.createStatement();
                query = "SELECT * FROM event_seat_availability WHERE date < CURRENT_TIME"; 
                result = st.executeQuery(query);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
        }finally {
            return result;
        }
    }
    
    public static String getTotalNoOfSeats(String event_id) {
        String query = null;
        ResultSet result = null;
        String total = null;
        try {
            ServerConnection.setConnection();
            
            if (ServerConnection.getConnectionStatus()) {
                Connection con = ServerConnection.getConnection();
                Statement st = con.createStatement();
                query = "SELECT total_seats FROM event_seat_availability WHERE event_ID = '" +event_id+ "'"; 
                result = st.executeQuery(query);
                
                while (result.next()) {
                    total = result.getString("total_seats");
                }
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
        }finally {
            return total;
        }
    }
    
    public static String getBookedNoOfSeats(String event_id) {
        String query = null;
        ResultSet result = null;
        String total = null;
        try {
            ServerConnection.setConnection();
            
            if (ServerConnection.getConnectionStatus()) {
                Connection con = ServerConnection.getConnection();
                Statement st = con.createStatement();
                query = "SELECT booked_seats FROM event_seat_availability WHERE event_ID = '" +event_id+ "'"; 
                result = st.executeQuery(query);
                
                while (result.next()) {
                    total = result.getString("booked_seats");
                }
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
        }finally {
            return total;
        }
    }
    
    public static String getAvailableNoOfSeats(String event_id) {
        String query = null;
        ResultSet result = null;
        String total = null;
        try {
            ServerConnection.setConnection();
            
            if (ServerConnection.getConnectionStatus()) {
                Connection con = ServerConnection.getConnection();
                Statement st = con.createStatement();
                query = "SELECT available_seats FROM event_seat_availability WHERE event_ID = '" +event_id+ "'"; 
                result = st.executeQuery(query);
                
                while (result.next()) {
                    total = result.getString("available_seats");
                }
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
        }finally {
            return total;
        }
    }
    
    public static ResultSet getBookedSeatNumbers(String event_id) {
        String query = null;
        ResultSet result = null;
        try {
            ServerConnection.setConnection();
            
            if (ServerConnection.getConnectionStatus()) {
                Connection con = ServerConnection.getConnection();
                Statement st = con.createStatement();
                query = "SELECT r.event_id, rs.seat_num FROM reservation r, reservation_seats rs WHERE r.res_id = rs.res_id AND r.event_id = '" +event_id+ "'"; 
                result = st.executeQuery(query);
                
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
        }finally {
            return result;
        }
    }
    
    public static ResultSet getAvailableSeatNumbers(String event_id) {
        String query = null;
        ResultSet result = null;
        try {
            ServerConnection.setConnection();
            
            if (ServerConnection.getConnectionStatus()) {
                Connection con = ServerConnection.getConnection();
                Statement st = con.createStatement();
                query = "SELECT seat_num FROM seats WHERE event_ID = '" +event_id+ "' AND seat_num NOT IN "
                        + "(SELECT rs.seat_num FROM reservation r, reservation_seats rs WHERE r.res_id = rs.res_id AND r.event_id = '"+event_id+ "')"; 
                result = st.executeQuery(query);
                
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
        }finally {
            return result;
        }
    }
    
    public static ResultSet[] getTicketPrices(String event_id) {
        String query1 = null;
        String query2 = null;
        String query3 = null;
        ResultSet[] result = new ResultSet[3];
        try {
            ServerConnection.setConnection();
            
            if (ServerConnection.getConnectionStatus()) {
                Connection con = ServerConnection.getConnection();
                Statement st = con.createStatement();
                Statement st1 = con.createStatement();
                Statement st2 = con.createStatement();
                
                query1 = "SELECT AVG(price) FROM seats WHERE event_ID = '" +event_id+ "' AND seat_num BETWEEN 1 AND 5";
                query2 = "SELECT AVG(price) FROM seats WHERE event_ID = '" +event_id+ "' AND seat_num BETWEEN 6 AND 10";
                query3 = "SELECT AVG(price) FROM seats WHERE event_ID = '" +event_id+ "' AND seat_num BETWEEN 11 AND 20";
                
                result[0] = st.executeQuery(query1);
                result[1] = st1.executeQuery(query2);
                result[2] = st2.executeQuery(query3);
                
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
        }finally {
            return result;
        }
    }
    
    public static ResultSet getCustomerDetailsForSeat(String event_id, int seat_num) {
        String query = null;
        ResultSet result = null;
        try {
            ServerConnection.setConnection();
            
            if (ServerConnection.getConnectionStatus()) {
                Connection con = ServerConnection.getConnection();
                Statement st = con.createStatement();
                query = "SELECT c.cus_id, c.name, c.address, c.contact_number, c.email " + 
                        "FROM reservation r, reservation_seats rs, customer c " + 
                        "WHERE r.res_id = rs.res_id AND r.cus_id = c.cus_id AND r.event_id = '" +event_id+ "' AND rs.seat_num = " + seat_num; 
                result = st.executeQuery(query);
                
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
        }finally {
            return result;
        }
    }
    
    public static boolean isTicketPricesUpdated(String event_id, double[] prices) throws ClassNotFoundException, SQLException {
        String query = null;
        String query1 = null;
        String query2 = null;
   
        ServerConnection.setConnection();

        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();
            Statement st1 = con.createStatement();
            Statement st2 = con.createStatement();

            query = "UPDATE seats SET price = " +prices[0]+ " WHERE event_ID = '" +event_id+ "' AND seat_num BETWEEN 1 AND 5";
            query1 = "UPDATE seats SET price = " +prices[1]+ " WHERE event_ID = '" +event_id+ "' AND seat_num BETWEEN 6 AND 10";
            query2 = "UPDATE seats SET price = " +prices[2]+ " WHERE event_ID = '" +event_id+ "' AND seat_num BETWEEN 11 AND 15";

            int result = st.executeUpdate(query);
            if (result > 0) {
                int result1 = st1.executeUpdate(query1);
                if (result1 > 0) {
                    int result2 = st2.executeUpdate(query2);
                    if (result2 > 0)
                        return true;
                    else
                        return false;
                }
                else
                    return false;
            }
            else
                return false;
        }
        else
            return false;
    }
    
    public static ResultSet getEventReservationSummary(String date) {
        String[] yyyyMM = date.split("-");
        String query = null;
        ResultSet result = null;
        System.out.println("length of the array : " + yyyyMM.length);
        
        if (yyyyMM.length == 2) {
            date = date + "-01";
            query = "SELECT pbe.event_name, COUNT(*) FROM reservation r, public_booked_events pbe WHERE r.event_id = pbe.event_ID AND MONTH(r.date) = MONTH('"+date+ "') GROUP BY r.event_id";
            //query = "SELECT event_ID, COUNT(*) FROM reservation WHERE MONTH(date) = MONTH('"+date+ "') GROUP BY event_ID";
            System.out.println("date : " + date);
        }
        else if (yyyyMM.length == 3) {
            query = "SELECT pbe.event_name, COUNT(*) FROM reservation r, public_booked_events pbe WHERE r.event_id = pbe.event_ID AND r.date = '"+date+"' GROUP BY r.event_id";
            //query = "SELECT event_ID, COUNT(*) FROM reservation WHERE date = '" +date+ "GROUP BY event_ID";
        }
        
        try {
            ServerConnection.setConnection();
            
            if (ServerConnection.getConnectionStatus()) {
                Connection con = ServerConnection.getConnection();
                Statement st = con.createStatement();
                //query = "SELECT event_id, COUNT(*) FROM reservation WHERE date = '" +date+ "' GROUP BY event_id"; 
                result = st.executeQuery(query);
                
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
        } catch(Exception ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return result;
        }
    }
    
    public static int getTotalNoOfReservationsForMonth(String date) {
        String query = null;
        ResultSet result = null;
        int no_of_reservations = 0;
        try {
            ServerConnection.setConnection();
            
            if (ServerConnection.getConnectionStatus()) {
                Connection con = ServerConnection.getConnection();
                Statement st = con.createStatement();
                query = "SELECT COUNT(*) FROM reservation WHERE MONTH(date) = MONTH('" +date+ "')"; 
                result = st.executeQuery(query);
                
                if (result.next()) {
                    no_of_reservations = result.getInt("COUNT(*)");
                }
                    
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
        }finally {
            return no_of_reservations;
        }
    }
    
    public static int getTotalSeatsReserved(String date) {
        String query = null;
        ResultSet result = null;
        int no_of_reservations = 0;
        try {
            ServerConnection.setConnection();
            
            if (ServerConnection.getConnectionStatus()) {
                Connection con = ServerConnection.getConnection();
                Statement st = con.createStatement();
                query = "SELECT COUNT(*) FROM reservation r, reservation_seats rs WHERE r.res_id = rs.res_id AND MONTH(r.date) = MONTH('"+date+"')";
                result = st.executeQuery(query);
                
                if (result.next()) {
                    no_of_reservations = result.getInt("COUNT(*)");
                }
                    
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
        }finally {
            return no_of_reservations;
        }
    }
    
    public static ResultSet getTotalSeatsSummary(String date) {
        String query = null;
        ResultSet result = null;
        try {
            ServerConnection.setConnection();
            
            if (ServerConnection.getConnectionStatus()) {
                Connection con = ServerConnection.getConnection();
                Statement st = con.createStatement();
                query = "SELECT event_id, COUNT(*) FROM reservation_seat_details WHERE MONTH(date) = MONTH('"+date+ "') GROUP BY event_id";
                result = st.executeQuery(query);
                
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
        }finally {
            return result;
        }
    }
    
    public static int getNoOfAvailableSeats(String date) {
        String query = null;
        ResultSet result = null;
        int no_of_available_seats = 0;
        try {
            ServerConnection.setConnection();
            
            if (ServerConnection.getConnectionStatus()) {
                Connection con = ServerConnection.getConnection();
                Statement st = con.createStatement();
                query = "SELECT SUM(available_seats) FROM event_seat_availability WHERE MONTH(date) = MONTH('"+date+"')";
                result = st.executeQuery(query);
                
                if (result.next()) {
                    no_of_available_seats = result.getInt("SUM(available_seats)");
                }
                    
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
        }finally {
            return no_of_available_seats;
        }
    }
    
    public static ResultSet getMonthlyAvailableSeatSummary(String date) {
        String query = null;
        ResultSet result = null;
        try {
            ServerConnection.setConnection();
            
            if (ServerConnection.getConnectionStatus()) {
                Connection con = ServerConnection.getConnection();
                Statement st = con.createStatement();
                query = "SELECT event_ID, available_seats FROM event_seat_availability WHERE MONTH(date) = MONTH('"+date+"')";
                result = st.executeQuery(query);
                
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
        }finally {
            return result;
        }
    }
    
    public static ResultSet getMostPopularEventForMonth(String date) {
        String query = null;
        String event_name = null;
        ResultSet result = null;
        try {
            ServerConnection.setConnection();
            
            if (ServerConnection.getConnectionStatus()) {
                Connection con = ServerConnection.getConnection();
                Statement st = con.createStatement();
                query = "SELECT event_ID, event_name FROM public_booked_events WHERE event_ID IN " +
                        "(SELECT event_id FROM reservation WHERE MONTH(date) = MONTH('" +date+ "') GROUP BY event_Id " + 
                        "HAVING COUNT(*) >= ALL(SELECT COUNT(*) FROM reservation WHERE MONTH(date) = MONTH('" +date+ "') GROUP BY event_id))";
                result = st.executeQuery(query);
                
//                while (result.next()) {
//                    event_name = result.getString("event_name");
//                }
                
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return result;
        }
    }
    
    public static ResultSet getBookedEventID() {
        String query = null;
        ResultSet result = null;
        try {
            ServerConnection.setConnection();
            
            if (ServerConnection.getConnectionStatus()) {
                Connection con = ServerConnection.getConnection();
                Statement st = con.createStatement();
                query = "SELECT event_ID FROM public_booked_events WHERE date > CURRENT_DATE AND event_ID NOT IN (SELECT event_ID FROM event_seat_arrangement)";
                result = st.executeQuery(query);
                
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex.getMessage());
        } finally {
            return result;
        }
    }
    
    public static String getDateWithMostReservations(String month) {
        String query = null;
        ResultSet result = null;
        String result_date = null;
        try {
            ServerConnection.setConnection();
            
            if (ServerConnection.getConnectionStatus()) {
                Connection con = ServerConnection.getConnection();
                Statement st = con.createStatement();
                query = "SELECT date, COUNT(*) " +
                "FROM reservation " +
                "WHERE MONTH(date) = MONTH('" +month+ "') " +
                "GROUP BY date " +
                "HAVING COUNT(*) >= ALL(SELECT COUNT(*) " +
                                      "FROM reservation " +
                                      "WHERE MONTH(date) = MONTH('" +month+ "') " +
                                      "GROUP BY date)";
                result = st.executeQuery(query);
                
                while (result.next()) {
                    result_date = result.getString("date");
                }
                
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        } catch (SQLException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        } catch (Exception ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex.getMessage());
            return null;
        } finally {
            return result_date;
        }
    }
    
    public static boolean isInserted(int columns, int x, int y, String event_ID) throws ClassNotFoundException, SQLException {
        String query = null;
        String event_name = null;
        ServerConnection.setConnection();

        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            query = "INSERT INTO event_seat_arrangement (event_ID,columns,x_columns,y_columns) VALUES(?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1, event_ID);
            ps.setInt(2, columns);
            ps.setInt(3, x);
            ps.setInt(4, y);

            int result = ps.executeUpdate();
            
            if (result > 0)
                return true;
            else
                return false;
        }
        else
            return false;
    }
    
    public static List<Integer> getNoOfTotalSeats() {
        String query = null;
        ResultSet result = null;
        ResultSet result1 = null;
        String event_ID = null;
        List<Integer> seat_list = new ArrayList<>();
        try {
            ServerConnection.setConnection();
            
            if (ServerConnection.getConnectionStatus()) {
                Connection con = ServerConnection.getConnection();
                Statement st = con.createStatement();
                Statement st1 =con.createStatement();
                query = "SELECT event_ID FROM public_booked_events WHERE date > CURRENT_DATE AND event_ID NOT IN (SELECT event_ID FROM event_seat_arrangement)";
                result = st.executeQuery(query);
                
                while (result.next()) {
                    event_ID = result.getString("event_ID");
                    String query1 = "SELECT total_seats FROM event_seat_availability WHERE event_id = '" +event_ID+ "'";
                    result1 = st1.executeQuery(query1);
                    
                    while (result1.next()) {
                        seat_list.add(result1.getInt("total_seats"));
                    }
                }
                
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex.getMessage());
        } finally {
            return seat_list;
        }
    }
    
    public static ResultSet viewSeatArrangements() {
        String query = null;
        ResultSet result = null;
        try {
            ServerConnection.setConnection();
            
            if (ServerConnection.getConnectionStatus()) {
                Connection con = ServerConnection.getConnection();
                Statement st = con.createStatement();
                query = "SELECT * FROM event_seat_arrangement";
                
                result = st.executeQuery(query);
                
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return result;
        }
    }
    
    public static ResultSet searchSeatArrangement(String event_id) {
        String query = null;
        ResultSet result = null;
        try {
            ServerConnection.setConnection();
            
            if (ServerConnection.getConnectionStatus()) {
                Connection con = ServerConnection.getConnection();
                Statement st = con.createStatement();
                query = "SELECT * FROM event_seat_arrangement WHERE event_ID = '" +event_id+ "'";
                
                result = st.executeQuery(query);
                
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return result;
        }
    }
    
    public static boolean isSeatArrangementDeleted(int seat_arr_id) {
        String query = null;
        int result = 0;
        try {
            ServerConnection.setConnection();
            
            if (ServerConnection.getConnectionStatus()) {
                Connection con = ServerConnection.getConnection();
                Statement st = con.createStatement();
                query = "DELETE FROM event_seat_arrangement WHERE seat_arranegement_id = "+seat_arr_id;
                
                result = st.executeUpdate(query);
                
                if (result > 0)
                    return true;
                else
                    return false;
            }
            else {
                return false;
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } catch (SQLException ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } catch (Exception ex) {
            Logger.getLogger(ReservationManagement.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
}
