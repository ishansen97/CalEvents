/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Connection;

import static Connection.ServerConnection.con;
import java.sql.Connection;
import java.sql.DriverManager;

/** 
 *
 * @author Lini Eisha
 */
public class Connectiondb {
    static Connection con = null;
   
    private Connectiondb(){}
    
    public static Connection getdbConnection(){
    
        try{
            if(con==null){
                Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection( "jdbc:mysql://localhost:3306/calevents","root","");
            }
        }
        catch(Exception e){
        e.printStackTrace();
        }
        return con;
    }
}


