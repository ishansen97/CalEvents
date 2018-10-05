
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
    mona huththakda kale? run hari bng
man ahanne anthimata mona huththak karalada meh wagey adaradayak kara gatte? eka eeye raath awa
 */
package test;

import Connection.DBConnect;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import static javax.management.remote.JMXConnectorFactory.connect;

/**
 *
 * @author Lini Eisha
 */
public class Raw_Determine {

    private int item_id;
    private String rawID;
    private String name;
    private DBConnect dbcon;
    private double quantity;

    public Raw_Determine() {
        this.dbcon = DBConnect.getInstance();
    }

    public Raw_Determine(int item_id, String rawID, String name, double quantity) {
        this.item_id = item_id;
        this.rawID = rawID;
        //this.name = name;
        this.quantity = quantity;
        this.dbcon = DBConnect.getInstance();
    }

    public Raw_Determine(String foodID, String rawID, double qty) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public Raw_Determine(int item_id, String rawID, double ingQuantity) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

  /*  public String getIDs(String tablename, String name) throws SQLException, ClassNotFoundException {
        PreparedStatement Query, qu = null;
        ResultSet resultQ;

        if (dbcon.isConnected()) {
            Connection connect = dbcon.getCon();
            String id = "";
            String table = tablename;

            if (table.equalsIgnoreCase("rawID")) {
                Query = connect.prepareStatement("SELECT `rawID` FROM `raw_materials` WHERE `name` = ? ");
                Query.setString(1, name);

                resultQ = qu.executeQuery();

                while (resultQ.next()) {
                    id = resultQ.getString("rawID");

                }
                return id;
            } else if (table.equalsIgnoreCase("item_id")) {
                Query = connect.prepareStatement("SELECT `item_id` FROM `menu_items` WHERE `name` = ? ");
                Query.setString(1, name);

                resultQ = qu.executeQuery();

                while (resultQ.next()) {
                    id = resultQ.getString("item_id");
                }
            } else {
                return "Error";
            }
        }
        return "error";

    }*/

    public String detRaw() throws ClassNotFoundException, SQLException {
        PreparedStatement addR, exist = null;
        int res = 0;
        ResultSet resultName;
        String rawName;

        if (dbcon.isConnected()) {
            Connection connect = dbcon.getCon();

            addR = connect.prepareStatement("INSERT INTO `raw_determine`(`item_id`, `rawID`, `quantity`) VALUES (? , ? , ?)");
            addR.setInt(1, item_id);
            addR.setString(2, rawID);
            addR.setDouble(3, quantity);
            res = addR.executeUpdate();

            if (res == 1) {
                return "new record inserted";
            } else {
                return "new record not inserted";
            }

        } else {
            return "Connection error!!";
        }
    }
    
    public void insert(String[] name,String[] quantity) throws ClassNotFoundException, SQLException{
        
        ResultSet rs = null;
        PreparedStatement ps = null;
        
        if(dbcon.isConnected()){
            Connection con = dbcon.getCon();
            ps = con.prepareStatement("");
        }
        
        for(int i = 0 ; i < name.length ; i++){
            System.out.println(name[i]);
        }
    
    }

    public int getCrowd(String event_name) throws ClassNotFoundException, SQLException {
        ResultSet resultcrowd;
        PreparedStatement sq = null;
        int crowd = 0;

        if (dbcon.isConnected()) {
            Connection connect = dbcon.getCon();

            sq = connect.prepareStatement("SELECT `crowd_expected` FROM `private_events` WHERE `event_Name` = ?");
            sq.setString(1, event_name);
            resultcrowd = sq.executeQuery();
            while (resultcrowd.next()) {

                crowd = resultcrowd.getInt("crowd");

            }
        }

        return crowd;
    }

    public double getQuantity(String name) throws ClassNotFoundException, SQLException {
        ResultSet resultQuantityQ;
        PreparedStatement sq = null;
        double availableQuantity = 0.0;

        if (dbcon.isConnected()) {
            Connection connect = dbcon.getCon();

            sq = connect.prepareStatement("SELECT * from raw_materials where name = ?");
            sq.setString(1, name);
            resultQuantityQ = sq.executeQuery();
            while (resultQuantityQ.next()) {

                quantity = resultQuantityQ.getDouble("availableQuantity");

            }
        }

        return quantity;

    }

    public double getTotal(int crowd, double quantity, String name, double availableQuantity) throws ClassNotFoundException, SQLException {
        PreparedStatement tot = null;
        double total = 0.0;

        double getTotal = getTotal(name);
        getTotal = crowd * quantity;

        if (dbcon.isConnected()) {
            Connection connect = dbcon.getCon();

            tot = connect.prepareStatement("UPDATE `raw_allocate` SET `needed_raw` = ? WHERE `event_name` = ?");

            tot.setDouble(1, getTotal);

            tot.setString(2, name);

            total = tot.executeUpdate();

            if (total < availableQuantity) {
                System.out.println("record Added");
            } else if (total > availableQuantity) {
                System.out.println("Not Enough raw materials");
            }
        } else {
            System.out.println("Conncetion error");
        }

        return total;
    }

    private double getTotal(String name) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public String reduceQuantity(String name, double total, double quantity) throws ClassNotFoundException, SQLException {

        PreparedStatement reduce = null;
        double reduced = 0;

        double getNewQuantity = getQuantity(name);
        getNewQuantity = quantity - total;

        if (dbcon.isConnected()) {
            Connection connect = dbcon.getCon();

            reduce = connect.prepareStatement("UPDATE `raw_materials` SET `quantity` = ? WHERE `name` = ?");

            reduce.setDouble(1, getNewQuantity);

            reduce.setString(2, name);

            reduced = reduce.executeUpdate();

        } else {
            return "connection error!";
        }

        if (reduced == 1) {
            return "record added!";
        } else {
            return "record not added";
        }

    }
                ////    allocate
            //CREATE VIEW getOrderaw AS
            //SELECT mp.private_Id, mp.item_id , pe.crowd_expected , mi.ingredients , mi.name, pe.event_Name
            //FROM private_events pe, menu_private mp , menu_items mi
            //WHERE pe.event_ID = mp.private_Id AND mi.item_id = mp.item_id
    
    
    
}

class main {

    public static void main(String[] args) throws ClassNotFoundException, SQLException {

        Raw_Determine raw = new Raw_Determine();
        String[] t = new String[]{"d","g"};
        String[] r = new String[]{"d","g"};
        raw.insert(t,r);
//        System.out.println(raw.getMenuID("Apple Salad"));
//        
    }

}
