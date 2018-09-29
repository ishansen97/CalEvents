/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facilities.allocation;

import facilities.event.*;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Sachith
 */
public class Allocation {
    private String facilityType;
    private Facility table;
    
    public Allocation(){}
    
    public Allocation(String facilityType)
    {
        this.facilityType = facilityType;
    }
    
    public void find_facility_view(){
        
        String type = this.facilityType.toLowerCase();
        
        if(type.equalsIgnoreCase("dj")){
            System.out.println("sounds");
            this.table = new Sounds();
        }
        else if(type.equalsIgnoreCase("live")){
            System.out.println("Sounds");
            this.table = new Sounds();
        }
        else if(type.equalsIgnoreCase("light")){
            System.out.println("Lights");
            this.table = new Lights();
        }
        else if(type.equalsIgnoreCase("mic")){
            System.out.println("Sounds");
            this.table = new Sounds();
        }
        else if(type.equalsIgnoreCase("chair")){
            System.out.println("Chairs");
            this.table = new Chairs();
        }   
        else if(type.equalsIgnoreCase("tent")){
            System.out.println("Tents");
            this.table = new Tents();
        }  
        else if(type.equalsIgnoreCase("table")){
            System.out.println("Tables");
            this.table = new Tables();
        }     
        else if(type.equalsIgnoreCase("kitchen")){
            System.out.println("Kitchen");
            this.table = new KitchenUtensils();
        }   
        else{
            System.out.println("Error");
        }   
    }
       
    public ResultSet fetch_available_facilities(){
    
        ResultSet available = this.table.fetch();
        
        return available;
    
    }
    
    
    
}

class testing{

    public static void main(String[] args) throws SQLException{
//        
//        Allocation all = new Allocation("tent");
//        all.find_facility_view();
//        ResultSet test = all.fetch_available_facilities();
//        
//        while(test.next()){
//            
//            System.out.println(test.getString("facilitiyName"));
//            
//        }
        
    }
    
}
