/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facilities.event;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Sachith Fernando
 */
public abstract class Facility {

    String itemId;
    String itemName;
    int quantity;
    String condition;
    DBConnect dbcon;

    public Facility() {
        this.dbcon = DBConnect.getInstance();
    }

    public Facility(String name, int quantity, String condition) {

        this.itemName = name;

        this.quantity = quantity;

        this.condition = condition;

        this.dbcon = DBConnect.getInstance();

    }

    public String generate_Facility_Id(String type) throws ClassNotFoundException, SQLException {

        String view = "";

        String id_Q = null;

        type = type.toUpperCase();

        if (type.equalsIgnoreCase("Tents") || type.equalsIgnoreCase("Sounds") || type.equalsIgnoreCase("Kitchen") || type.equalsIgnoreCase("Lights") || type.equalsIgnoreCase("Chairs") || type.equalsIgnoreCase("Tables")) {
            if (type.equalsIgnoreCase("Tents")) {

                type = "Hut";
            }

            switch (type) {
                case "Hut":
                    view = "facilitytent";
                    break;
                case "TABLES":
                    view = "facilitytable";
                    break;
                case "LIGHTS":
                    view = "facilitylight";
                    break;
                case "KITCHEN":
                    view = "facilitykitchen";
                    break;
                case "CHAIRS":
                    view = "facilitychair";
                    break;
                case "SOUNDS":
                    view = "facilitysound";
                    break;
            }

            char star = type.charAt(0);
            String start = Character.toString(star);

            if (dbcon.isConnected()) {

                Connection connect = dbcon.getCon();

                Statement stmt = connect.createStatement();

                id_Q = "select facilityID from " + view + " order by facilityID desc limit 1";

                ResultSet rs = stmt.executeQuery(id_Q);

                if (rs.next()) {

                    String ID = rs.getString("facilityID");

                    String[] parts = ID.split(start, 2);

                    int integerid = Integer.parseInt(parts[1]);

                    integerid++;

                    if (integerid > 1 && integerid < 10) {
                        itemId = start + "00" + integerid;
                    } else if (integerid >= 10 && integerid < 100) {
                        itemId = start + "0" + integerid;
                    } else {
                        itemId = start + integerid;
                    }

                } else {
                    itemId = start + "001";
                }

            } else {
                return "Connection Failed !!";
            }

            return itemId;
        } else {
            return "no such facility called " + type;
        }

    }

    public String getItemID(String view, String name) throws ClassNotFoundException, SQLException {

        PreparedStatement ps = null;
        ResultSet result = null;
        String id = "";

        if (dbcon.isConnected()) {

            Connection connect = dbcon.getCon();
            ps = connect.prepareStatement("SELECT * FROM " + view + " WHERE `facilitiyName` = ? ");
            ps.setString(1, name);

            result = ps.executeQuery();
            while (result.next()) {
                id = result.getString("facilityID");
            }

        } else {
            return "Connection Error!";
        }

        return id;
    }

    public int getAvailableQuantity(String Key) {

        PreparedStatement getA = null;

        ResultSet quantity = null;

        int availableQuantity = 0;

        try {
            if (dbcon.isConnected()) {
                Connection connect = dbcon.getCon();

                getA = connect.prepareStatement("SELECT * FROM `facilities` WHERE `facilityID` = ?");
                getA.setString(1, Key);

                quantity = getA.executeQuery();

                while (quantity.next()) {

                    availableQuantity = quantity.getInt("availableQuantity");

                }

            } else {
                return -99;
            }

        } catch (ClassNotFoundException ex) {

            Logger.getLogger(Sounds.class.getName()).log(Level.SEVERE, null, ex);

        } catch (SQLException ex) {

            Logger.getLogger(Sounds.class.getName()).log(Level.SEVERE, null, ex);

        }

        return availableQuantity;
    }

    public int getTotalQuantity(String Key) {

        PreparedStatement getT = null;
        ResultSet quantity = null;
        int totalQuantity = 0;

        try {
            if (dbcon.isConnected()) {
                Connection connect = dbcon.getCon();

                getT = connect.prepareStatement("SELECT * FROM `facilities` WHERE `facilityID` = ?");
                getT.setString(1, Key);

                quantity = getT.executeQuery();

                while (quantity.next()) {

                    totalQuantity = quantity.getInt("totalQuantity");

                }

            } else {
                return -99;
            }

        } catch (ClassNotFoundException ex) {

            Logger.getLogger(Sounds.class.getName()).log(Level.SEVERE, null, ex);

        } catch (SQLException ex) {

            Logger.getLogger(Sounds.class.getName()).log(Level.SEVERE, null, ex);

        }

        return totalQuantity;
    }

    public boolean updateCondition(String Key, String condition) {

        PreparedStatement updateConditionQ = null;

        int updated = 0;

        try {
            if (dbcon.isConnected()) {
                Connection connect = dbcon.getCon();

                updateConditionQ = connect.prepareStatement("UPDATE `facilities` SET `facilityCondition` = ? WHERE `facilityID` = ?");

                updateConditionQ.setString(1, condition);

                updateConditionQ.setString(2, Key);

                updated = updateConditionQ.executeUpdate();

            } else {
                return false;
            }

        } catch (ClassNotFoundException ex) {

            Logger.getLogger(Sounds.class.getName()).log(Level.SEVERE, null, ex);

        } catch (SQLException ex) {

            Logger.getLogger(Sounds.class.getName()).log(Level.SEVERE, null, ex);

        }

        if (updated == 1) {
            return true;
        } else {
            return false;
        }
    }

    public boolean reduceAvailableQuantity(int quantity, String Key) {

        PreparedStatement reduceAvailable = null;

        int availableQuantity = getAvailableQuantity(Key);

        availableQuantity = availableQuantity - quantity;

        int reduced = 0;

        try {
            if (dbcon.isConnected()) {
                Connection connect = dbcon.getCon();

                reduceAvailable = connect.prepareStatement("UPDATE `facilities` SET `availableQuantity` = ? WHERE `facilityID` = ?");

                reduceAvailable.setInt(1, availableQuantity);

                reduceAvailable.setString(2, Key);

                reduced = reduceAvailable.executeUpdate();

            } else {
                return false;
            }

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Sounds.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Sounds.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (reduced == 1) {
            return true;
        } else {
            return false;
        }
    }

    public boolean incrementAvailableQuantity(int quantity, String Key) {

        PreparedStatement incrementAvailable = null;

        int availableQuantity = getAvailableQuantity(Key);

        availableQuantity = availableQuantity + quantity;

        int incremented = 0;

        try {
            if (dbcon.isConnected()) {
                Connection connect = dbcon.getCon();

                incrementAvailable = connect.prepareStatement("UPDATE `facilities` SET `availableQuantity` = ? WHERE `facilityID` = ?");

                incrementAvailable.setInt(1, availableQuantity);

                incrementAvailable.setString(2, Key);

                incremented = incrementAvailable.executeUpdate();

            } else {
                return false;
            }

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Sounds.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Sounds.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (incremented == 1) {
            return true;
        } else {
            return false;
        }
    }

    public boolean reduceTotalQuantity(int quantity, String Key) {

        PreparedStatement reduceTotal = null;

        int totalQuantity = getTotalQuantity(Key);

        totalQuantity = totalQuantity - quantity;

        int reduced = 0;

        try {
            if (dbcon.isConnected()) {
                Connection connect = dbcon.getCon();

                reduceTotal = connect.prepareStatement("UPDATE `facilities` SET `totalQuantity` = ? WHERE `facilityID` = ?");

                reduceTotal.setInt(1, totalQuantity);

                reduceTotal.setString(2, Key);

                reduced = reduceTotal.executeUpdate();

            } else {
                return false;
            }

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Sounds.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Sounds.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (reduced == 1) {
            return true;
        } else {
            return false;
        }
    }

    public boolean incrementTotalQuantity(int quantity, String Key) {

        PreparedStatement incrementTotal = null;

        int totalQuantity = getTotalQuantity(Key);

        totalQuantity = totalQuantity + quantity;

        int incremented = 0;

        try {
            if (dbcon.isConnected()) {
                Connection connect = dbcon.getCon();

                incrementTotal = connect.prepareStatement("UPDATE `facilities` SET `totalQuantity` = ? WHERE `facilityID` = ?");

                incrementTotal.setInt(1, totalQuantity);

                incrementTotal.setString(2, Key);

                incremented = incrementTotal.executeUpdate();

            } else {
                return false;
            }

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Sounds.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Sounds.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (incremented == 1) {
            return true;
        } else {
            return false;
        }
    }

    public boolean remove_Facility(String f_ID) {

        PreparedStatement deleteQ = null;

        int deleted = 0;

        try {
            if (dbcon.isConnected()) {
                Connection connect = dbcon.getCon();

                deleteQ = connect.prepareStatement("DELETE FROM `facilities` WHERE `facilityID` = ?");

                deleteQ.setString(1, f_ID);

                deleted = deleteQ.executeUpdate();

            } else {
                return false;
            }

        } catch (ClassNotFoundException ex) {

            Logger.getLogger(Sounds.class.getName()).log(Level.SEVERE, null, ex);

        } catch (SQLException ex) {

            Logger.getLogger(Sounds.class.getName()).log(Level.SEVERE, null, ex);

        }

        if (deleted == 1) {
            return true;
        } else {
            return false;
        }
    }

    public abstract String add_Facility();

    public abstract ResultSet fetch();

}
