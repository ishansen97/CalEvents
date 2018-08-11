package facility;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/**
 *
 * @author Sachith Fernando
 */
public class Facility {
    protected String itemId;
    protected String itemName;
    protected String status;
    protected int quantity;
    protected String condition;
    public Facility(){}
    public Facility(String id,String name,String status,int quantity,String condition){
        this.itemId=id;
        this.itemName=name;
        this.status=status;
        this.quantity=quantity;
        this.condition=condition;
    }
    
     public String generate_Facility_Id(String type) throws ClassNotFoundException, SQLException{
        DBConnect dbcon = DBConnect.getInstance();
        String id_Q = null;
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
    
    public boolean add_Facility(String facility_Type) throws ClassNotFoundException, SQLException{
        DBConnect dbcon = DBConnect.getInstance();
        String query = null;
        Boolean result=null;
        
        itemId = generate_Facility_Id(facility_Type);
        
         if (dbcon.isConnected()) {
             Connection connection = dbcon.getCon();
             PreparedStatement add_F = connection.prepareStatement("insert in to "+facility_Type+" values (?,?,?,?,?)");
             
             add_F.setString(1, itemId);
             add_F.setString(2, itemName);
             add_F.setString(3, status);
             add_F.setInt(4, quantity);
             add_F.setString(5, condition);
             result = add_F.execute();
             return result;
         }
        else
             return false;
    }
    
    public void remove_Facility(){
    
    }
        
    public ResultSet fetch_Facility_Packages() throws ClassNotFoundException, SQLException{
        DBConnect dbcon = DBConnect.getInstance();
        String query = null;
        ResultSet facilities=null;
         if (dbcon.isConnected()) {
             Connection connection = dbcon.getCon();
             PreparedStatement ps = connection.prepareStatement("select * from facility_packages");
             
             facilities = ps.executeQuery();

        }
        return facilities;
         
         
        
    }
    
    public int getQuantity(){
    int quantity=0;
    
    return quantity;
    }
    
    public void allocate(String quantity){
    
    }
}
class Tent extends Facility{
    private final String color;
    private final String size;
    
    public Tent(String id, String name, String status, int quantity, String condition,String color,String size) {
        super(id, name, status, quantity, condition);
        this.color=color;
        this.size=size;
    }
    
}

class Chair extends Facility{
    private final String material;
    
    public Chair(String id, String name, String status, int quantity, String condition,String material) {
        super(id, name, status, quantity, condition);
        this.material=material;
    }
}

class Table extends Facility{
    private final String size;
    public Table(String id, String name, String status, int quantity, String condition,String size) {
        super(id, name, status, quantity, condition);
        this.size=size;
    }
}

class Sounds extends Facility{
    private final String brand;
    public Sounds(String id, String name, String status, int quantity, String condition,String brand) {
        super(id, name, status, quantity, condition);
        this.brand=brand;
    }

}

class Lights extends Facility{
    private final String type;
    public Lights(String id, String name, String status, int quantity, String condition,String type) {
        super(id, name, status, quantity, condition);
        this.type=type;
    }
}

class Kitchen_Utensils extends Facility{
    private final String type;
    public Kitchen_Utensils(String id, String name, String status, int quantity, String condition,String type) {
        super(id, name, status, quantity, condition);
        this.type=type;
    }
}

class Test{
public static void main(String[] args) throws ClassNotFoundException, SQLException{

        Facility f1 = new Facility();
        
          

}

}