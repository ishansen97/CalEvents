/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package faciliyPackages.operations;

import facilities.event.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Sachith
 */
public class Facility_Packages {

    private String packageID;
    private String packageName;
    private String facilities;
    private double price;
    private DBConnect dbcon;

    public Facility_Packages() {
        this.dbcon = DBConnect.getInstance();
    }

    public Facility_Packages(String name, String facilities, double price) {
        this.packageName = name;
        this.facilities = facilities;
        this.price = price;
        this.dbcon = DBConnect.getInstance();
    }

    public String generate_Facility_Id() throws ClassNotFoundException, SQLException {

        String id_Q = null;
        String packageID= "";

        if (dbcon.isConnected()) {

            Connection connect = dbcon.getCon();

            Statement stmt = connect.createStatement();

            id_Q = "select packageID from facility_packages order by packageID desc limit 1";

            ResultSet rs = stmt.executeQuery(id_Q);

            if (rs.next()) {

                String ID = rs.getString("packageID");

                String[] parts = ID.split("FP", 2);

                int integerid = Integer.parseInt(parts[1]);
                integerid++;
                
                if (integerid > 1 && integerid < 10)
                    packageID = "FP00" + integerid;
                else if(integerid >=10 && integerid < 100)
                    packageID = "FP0" + integerid;
                else 
                    packageID = "FP" + integerid;

            } else {
                packageID = "FP001";
            }

        } else {
            return "Connection Failed !!";
        }

        return packageID;
    }


public boolean insert_Packages() throws ClassNotFoundException, SQLException {
        
        packageID = generate_Facility_Id();
        
        PreparedStatement insert_Package = null;
        PreparedStatement check_Package = null;
        int inserted = 0 ;
        
        if (dbcon.isConnected()) {
                Connection connect = dbcon.getCon();
                
                check_Package = connect.prepareStatement("SELECT * FROM facility_packages WHERE packageName = ?");
                check_Package.setString(1, packageName);
                ResultSet aval = check_Package.executeQuery();
                
                if(aval.next()) return false;
                else{
                insert_Package = connect.prepareStatement("INSERT INTO `facility_packages`(`packageID`,`packageName`, `facilities`, `price`) VALUES (?,?,?,?)");
                insert_Package.setString(1, packageID);
                insert_Package.setString(2, packageName);
                insert_Package.setString(3, facilities);
                insert_Package.setDouble(4, price);
                
                inserted = insert_Package.executeUpdate();
                }
                
                
        }
        
        if(inserted ==1) return true;
        else return false;
       
    }

public ResultSet fetch_Packages() throws SQLException, ClassNotFoundException{
    PreparedStatement check_Package = null;
    ResultSet packages = null;
        
        if (dbcon.isConnected()) {
                Connection connect = dbcon.getCon();
                check_Package = connect.prepareStatement("SELECT * FROM facility_packages");
                
                packages = check_Package.executeQuery();
                
        }
        
        return packages;
}
}



class packmain{
public static void main(String[] args) throws ClassNotFoundException, SQLException{
    
       Facility_Packages f = new Facility_Packages("ultra sounds","dj mixer, 3 microphnes, jbl columns",200.0);
       System.out.println(f.insert_Packages());

}
}