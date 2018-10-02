/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facilities.allocation;

import facilities.event.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Sachith
 */
public class Packages {

    private String packageID;
    private String name;
    private double price;
    private String[] facilityIDs;
    private DBConnect db;

    private String generateID() {
        try {
            if (db.isConnected()) {
                Connection con = db.getCon();
                PreparedStatement ps = con.prepareStatement("SELECT `packageID` FROM `facility_packages` "
                        + "ORDER BY `packageID` "
                        + "DESC LIMIT 1");
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    String[] lastID = rs.getString("packageID").split("pack");
                    int lastIDNo = Integer.parseInt(lastID[1]) + 1;

                    String id = "pack";
                    if (lastIDNo > 1 && lastIDNo < 10) {
                        id += "00" + lastIDNo;
                    } else if (lastIDNo >= 10 && lastIDNo < 100) {
                        id += "0" + lastIDNo;
                    } else {
                        id += lastIDNo;
                    }
                    return id;
                }
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Packages.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Packages.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public Packages(){}

    public Packages(String name, double price, String[] facilityIDs) {
//        this.packageID = generateID();
        this.name = name;
        this.price = price;
        this.facilityIDs = facilityIDs;
        this.db = DBConnect.getInstance();
        this.packageID = generateID();
    }

    private boolean addFacilities(Connection con) throws SQLException {
        String query = "INSERT INTO `packageshas`(`packageID`, `facilityID`) "
                + "VALUES (?, ?)";
        PreparedStatement ps = con.prepareStatement(query);

        int update = 0;
        for (String facility : facilityIDs) {
            ps.setString(1, packageID);
            ps.setString(2, facility);
            update = ps.executeUpdate();
            if (update < 1) {
                return false;
            }
        }
        return true;
    }

    public boolean createPackage() throws ClassNotFoundException, SQLException {
        if (packageID == null) {
            return false;
        }
        if (db.isConnected()) {
            Connection con = db.getCon();
            String query = "INSERT INTO `facility_packages`("
                    + "`packageID`, `packageName`, `price`) VALUES (?, ?, ?)";
            PreparedStatement st = con.prepareStatement(query);
            st.setString(1, packageID);
            st.setString(2, name);
            st.setDouble(3, price);

            int upd = st.executeUpdate();
            if (upd > 0) {
                return addFacilities(con);
            }
        }
        return false;
    }
    
    public void AllocateForPackage(String PackageName) throws ClassNotFoundException, SQLException{
        
        PreparedStatement getfacilitiesforpackage = null;
        DBConnect dbconnect = DBConnect.getInstance();
        ResultSet facilitiesforpackage = null;
        ArrayList<String> facilitiestoallocate = new ArrayList();
        
        
        if(dbconnect.isConnected()){
            Connection con = dbconnect.getCon();
        getfacilitiesforpackage = con.prepareStatement("SELECT `facilitiyName` FROM `packagesview` WHERE `packageName` = ?");
        getfacilitiesforpackage.setString(1, PackageName);
        
        facilitiesforpackage = getfacilitiesforpackage.executeQuery();
        
        while(facilitiesforpackage.next()){
            
            facilitiestoallocate.add(facilitiesforpackage.getString("facilitiyName"));
            
        }    
        
        
        }
        
        
    }
   
    public static ResultSet getAllFacilities() {
        DBConnect dbcon = DBConnect.getInstance();
        PreparedStatement fetch = null;
        ResultSet details = null;
        try {

            if (dbcon.isConnected()) {
                Connection connect = dbcon.getCon();
                fetch = connect.prepareStatement("SELECT * FROM `facilities`");
                details = fetch.executeQuery();
                return details;
            }

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Packages.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Packages.class.getName()).log(Level.SEVERE, null, ex);
        }

        return details;
    }
}

class dbtest {

    public static void main(String[] args) throws ClassNotFoundException, SQLException {

        String[] arr = new String[]{"L002", "S005"};

        Set<String> set = new HashSet<String>();

        Packages p = new Packages("PackageTesting", 20.0, arr);

//        ArrayList<String> packageName = new ArrayList<String>();
        p.AllocateForPackage("EDM Package");

//        for (int i = 0; i < arr.length; i++) {
//
//            System.out.println(arr[i]);
//
//        }
    }

}
