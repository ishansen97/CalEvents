/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facility;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import static jdk.nashorn.internal.objects.NativeJava.type;

/**
 *
 * @author User
 */

abstract class FacilityTest {

    String itemId;
    String itemName;
    String status;
    int quantity;
    String condition;
    DBConnect dbcon;
    
        public FacilityTest(String name,String status,int quantity,String condition){
            //this.itemId=id;
            this.itemName=name;
            this.status=status;
            this.quantity=quantity;
            this.condition=condition;
            this.dbcon = DBConnect.getInstance();
        }
        
        public String generate_Facility_Id(String type) throws ClassNotFoundException, SQLException{
             
            String id_Q = null;
            if(type=="Tents"){
                type= "Hut";
            }
            char start = type.charAt(0);
        
            if (dbcon.isConnected()) {
                Connection connect = dbcon.getCon();
                Statement stmt = connect.createStatement();
            
            
            
                id_Q = "select Facility_ID from "+type+" order by Facility_ID desc limit 1";

                ResultSet rs = stmt.executeQuery(id_Q);

                if (rs.next()) {
                    String ID = rs.getString("Facility_ID");
                    String[] parts = ID.split(start+"00", 2);
                    int integerid = Integer.parseInt(parts[1]);
                    integerid++;
                    itemId = start+"00" + integerid;
                }
                else
                    itemId = start+"001";

            }
        
            return itemId;            
        }
        
        public abstract boolean add_Facility();
        public abstract void remove_Facility(String f_ID);
        public abstract int get_Available_Quantity();
         
}

class F_Sounds extends FacilityTest{
    //private final String brand;
    public F_Sounds( String name, String status, int quantity, String condition) {
        super(name, status, quantity, condition);
        //this.brand=brand;
    }

    @Override
    public boolean add_Facility() {
        PreparedStatement addF = null;
        Boolean res=null;
        String id;
        try {
            if (dbcon.isConnected()) {
                Connection connect = dbcon.getCon();                               
                id = generate_Facility_Id("Sounds");
                
                addF = connect.prepareStatement("INSERT INTO `sounds`(`Facility_ID`, `Facility_Name`, `Status`, `Quantity`, `Condition`) VALUES (?,?,?,?,?)");
                addF.setString(1, id);
                addF.setString(2, itemName);
                addF.setString(3, status);
                addF.setInt(4, quantity);
                addF.setString(5, condition);
                res = addF.execute();              
                if(res==true) return true;
                else return false;
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(F_Sounds.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(F_Sounds.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return false;
    }

    @Override
    public void remove_Facility(String f_ID) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int get_Available_Quantity() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}

class F_Tents extends FacilityTest{
    private final String color;
    private final String size;
    
    public F_Tents(String name, String status, int quantity, String condition,String color,String size) {
        super(name, status, quantity, condition);
        this.color=color;
        this.size=size;
    }

    @Override
    public boolean add_Facility() {
        PreparedStatement addF = null;
        Boolean res=null;
        String id;
        try {
            if (dbcon.isConnected()) {
                Connection connect = dbcon.getCon();                               
                id = generate_Facility_Id("Tents");
                
                addF = connect.prepareStatement("INSERT INTO `tents`(`Facility_ID`, `Facility_Name`, `Status`, `Quantity`, `F_Condition`, `Color`, `Size`) VALUES(?,?,?,?,?,?,?)");
                addF.setString(1, id);
                addF.setString(2, itemName);
                addF.setString(3, status);
                addF.setInt(4, quantity);
                addF.setString(5, condition);
                addF.setString(6, color);
                addF.setString(7, size);
                
                res = addF.execute();              
                if(res==true) return true;
                else return false;
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(F_Sounds.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(F_Sounds.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return false;
    }

    @Override
    public void remove_Facility(String f_ID) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int get_Available_Quantity() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}

class F_Chair extends FacilityTest{
    private final String material;
    
    public F_Chair(String name, String status, int quantity, String condition,String material) {
        super(name, status, quantity, condition);
        this.material=material;
    }

    @Override
    public boolean add_Facility() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void remove_Facility(String f_ID) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int get_Available_Quantity() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}

class F_Table extends FacilityTest{
    private final String size;
    public F_Table(String name, String status, int quantity, String condition,String size) {
        super(name, status, quantity, condition);
        this.size=size;
    }

    @Override
    public boolean add_Facility() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void remove_Facility(String f_ID) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int get_Available_Quantity() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}


class F_Lights extends FacilityTest{
    private final String type;
    public F_Lights(String name, String status, int quantity, String condition,String type) {
        super(name, status, quantity, condition);
        this.type=type;
    }

    @Override
    public boolean add_Facility() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void remove_Facility(String f_ID) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int get_Available_Quantity() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}


class F_Kitchen_Utensils extends FacilityTest{
    private final String type;
    public F_Kitchen_Utensils(String name, String status, int quantity, String condition,String type) {
        super(name, status, quantity, condition);
        this.type=type;
    }

    @Override
    public boolean add_Facility() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void remove_Facility(String f_ID) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int get_Available_Quantity() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}




class test{
public static void main(String[] args){
 
    FacilityTest f1 = new F_Sounds("Electric Guitar","available",5,"good");
    if(f1.add_Facility()!=true){System.out.println("Successful!!");}
    else System.out.println("Unsuccessful!!");
    
    
        
        
}

}