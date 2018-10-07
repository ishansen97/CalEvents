/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Event;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author hp
 */
public class Statistics {

    public static String getCount() throws ClassNotFoundException, SQLException {
        DBConnect dbcon = DBConnect.getInstance();
        String query = null;
        String publicEventCount = null;
        String privateEventCount = null;
        String bookedEventCount = null;

        if (dbcon.isConnected()) {
            Connection connect = dbcon.getCon();
            Statement stmt = connect.createStatement();
            query = "SELECT COUNT(*) AS Public_Event_Count FROM `public_events` WHERE YEAR(`date`)=YEAR(CURDATE())";
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                publicEventCount = rs.getString("Public_Event_Count");
            }

            String query01 = "SELECT COUNT(*) AS Private_Event_Count FROM `private_events` WHERE YEAR(`date`)=YEAR(CURDATE())";
            ResultSet rs01 = stmt.executeQuery(query01);

            while (rs01.next()) {
                privateEventCount = rs01.getString("Private_Event_Count");
            }

            String query02 = "SELECT COUNT(*) AS Booked_Event_Count FROM `booked_event` WHERE YEAR(`date`)=YEAR(CURDATE())";
            ResultSet rs02 = stmt.executeQuery(query02);

            while (rs02.next()) {
                bookedEventCount = rs02.getString("Booked_Event_Count");
            }

        }
        return publicEventCount + "," + privateEventCount + "," +bookedEventCount;
    }
    
    
     public static String getCountForLastYear() throws ClassNotFoundException, SQLException {
        DBConnect dbcon = DBConnect.getInstance();
        String query = null;
        String publicEventCount = null;
        String privateEventCount = null;
        String bookedEventCount = null;

        if (dbcon.isConnected()) {
            Connection connect = dbcon.getCon();
            Statement stmt = connect.createStatement();
            query = "SELECT COUNT(*) AS Public_Event_Count FROM `public_events` WHERE YEAR(`date`)=YEAR(CURDATE())-1";
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                publicEventCount = rs.getString("Public_Event_Count");
            }

            String query01 = "SELECT COUNT(*) AS Private_Event_Count FROM `private_events` WHERE YEAR(`date`)=YEAR(CURDATE())-1";
            ResultSet rs01 = stmt.executeQuery(query01);

            while (rs01.next()) {
                privateEventCount = rs01.getString("Private_Event_Count");
            }

            String query02 = "SELECT COUNT(*) AS Booked_Event_Count FROM `booked_event` WHERE YEAR(`date`)=YEAR(CURDATE())-1";
            ResultSet rs02 = stmt.executeQuery(query02);

            while (rs02.next()) {
                bookedEventCount = rs02.getString("Booked_Event_Count");
            }

        }
        return publicEventCount + "," + privateEventCount + "," +bookedEventCount;
    }

}
