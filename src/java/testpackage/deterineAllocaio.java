/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package testpackage;

import Connection.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Lini Eisha
 */
public class deterineAllocaio {

    private DBConnect dbcon;

    public deterineAllocaio() throws ClassNotFoundException, SQLException {

        this.dbcon = DBConnect.getInstance();

    }

    public boolean insertDtermine(String rawID, String menuID, String rawName, String menuName, double quan) throws ClassNotFoundException, SQLException {

        PreparedStatement ps = null;

        if (dbcon.isConnected()) {

            Connection con = dbcon.getCon();
            ps = con.prepareStatement("INSERT INTO `determined`(`menuID`, `name`, `rawID`, `rawName`, `quantity`) VALUES (?,?,?,?,?)");
            ps.setString(1, menuID);
            ps.setString(2, menuName);
            ps.setString(3, rawID);
            ps.setString(4, rawName);
            ps.setDouble(5, quan);

            int check = ps.executeUpdate();

            if (check > 0) {
                return true;
            }

        }

        return false;
    }

    public ResultSet fetchNeededQuantity(String menuID) throws ClassNotFoundException, SQLException {
        ResultSet rs = null;
        PreparedStatement ps = null;

        if (dbcon.isConnected()) {

            Connection con = dbcon.getCon();

            ps = con.prepareStatement("SELECT * FROM `determined` WHERE `menuID` = ?");
            ps.setString(1, menuID);

            rs = ps.executeQuery();
        }
        return rs;
    }

    public boolean insertToAllocate(String eventID, String foodID, String rawID, double quantityPerson, int expectedCrowd, double totalQuantity, double availableQuantity) {

        try {
            PreparedStatement ps = null;

            if (dbcon.isConnected()) {
                Connection con = dbcon.getCon();

                ps = con.prepareStatement("INSERT INTO `raw_allocate`(`event_ID`, `foodID`, `rawID`, `quantityPerson`, `expectedCrowd`, `totalQuantity`, `request`,`avqty`) VALUES (?,?,?,?,?,?,?,?)");
                ps.setString(1, eventID);
                ps.setString(2, foodID);
                ps.setString(3, rawID);
                ps.setDouble(4, quantityPerson);
                ps.setInt(5, expectedCrowd);
                ps.setDouble(6, totalQuantity);
                ps.setInt(7, 0);
                ps.setDouble(8, availableQuantity);

                int check = ps.executeUpdate();
                if (check > 0) {
                    return true;
                } else {
                    return false;
                }

            }
            return false;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(deterineAllocaio.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(deterineAllocaio.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

}
