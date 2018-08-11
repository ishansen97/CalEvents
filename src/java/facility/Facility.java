package facility;

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
    
    public Facility(String id,String name,String status,int quantity,String condition){
        this.itemId=id;
        this.itemName=name;
        this.status=status;
        this.quantity=quantity;
        this.condition=condition;
    }
    
    public void remove_Facility(){
    
    }
        
    public void add_Facility(){
        
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
