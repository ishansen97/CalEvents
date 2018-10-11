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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author User
 */
public class KitchenUtensils extends Facility {

    private String kUType;

    public KitchenUtensils() {
    }

    public KitchenUtensils(String name, int quantity, String condition, String type) {
        super(name, quantity, condition);
        this.kUType = type;

    }

    @Override
    public String add_Facility() {

        int res = 0;

        PreparedStatement addKitchen = null;

        try {

            String id = generate_Facility_Id("kitchen");

            if (dbcon.isConnected()) {
                Connection connect = dbcon.getCon();

                PreparedStatement soundExistCheck = connect.prepareStatement("SELECT * FROM `facilitykitchen` WHERE `facilitiyName` = ? AND `kUType` = ?");
                soundExistCheck.setString(1, itemName);
                soundExistCheck.setString(2, kUType);

                ResultSet alreadyExist = soundExistCheck.executeQuery();

                if (alreadyExist.next()) {
                    return "Item Already Exist!";
                } else {

                    addKitchen = connect.prepareStatement("INSERT INTO `facilities` (`facilityID`, `facilitiyName`, `facilityType`, `availableQuantity`, `totalQuantity`, `facilityCondition`,`kUType`)"
                            + " VALUES (?,?,?,?,?,?,?)");

                    addKitchen.setString(1, id);
                    addKitchen.setString(2, itemName);
                    addKitchen.setString(3, "kitchen");
                    addKitchen.setInt(4, quantity);
                    addKitchen.setInt(5, quantity);
                    addKitchen.setString(6, condition);
                    addKitchen.setString(7, kUType);

                    res = addKitchen.executeUpdate();
                }

            } else {
                return "Connection ERROR!";
            }

        } catch (ClassNotFoundException ex) {

            Logger.getLogger(Sounds.class.getName()).log(Level.SEVERE, null, ex);

        } catch (SQLException ex) {

            Logger.getLogger(Sounds.class.getName()).log(Level.SEVERE, null, ex);

        }

        if (res == 1) {
            return "Data Inserted !!";
        } else {
            return "Data Not Inserted !!";
        }
    }

    public ResultSet fetch() {

        PreparedStatement fetch = null;
        ResultSet details = null;

        try {

            if (dbcon.isConnected()) {
                Connection connect = dbcon.getCon();
                fetch = connect.prepareStatement("SELECT * FROM `facilitykitchen`");
                details = fetch.executeQuery();
            }

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Tents.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Tents.class.getName()).log(Level.SEVERE, null, ex);
        }

        return details;
    }

}
