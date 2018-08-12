/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kitchenJava;

import Connection.ServerConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Lini Eisha
 */
public class Accept {
    
    public void update( String Menu ,String Date){
    
    
                ServerConnection db = ServerConnection.getInstance();
                Connection con = db.getConnection();
                cin.Prepare Stat
//            ServerConnection con;
//            con = ServerConnection.getInstance();
           
            
            String o_id = "";
            
        try {
            PreparedStatement ps = con.prepareStatement("select o_id from oder where Menu = ? AND Date = ? ");
            ps.setString(1, Menu);
            ps.setString(2, Date);
            
            
            ResultSet res = ps.executeQuery();
            
            while(res.next()){
            o_id = res.getString("o_id");
            
            }
            
            PreparedStatement ps2 = con.prepareStatement("update raw_materails set quantity where o_id = ? ");
            ps2.setString(1, o_id);
            
            int i = ps2.executeUpdate();
            
            if(i<0)
                {System.out.println("Update unsuccessful");}
            
            else{System.out.println("Update successful");}
                     } 
            catch (SQLException ex) {
                Logger.getLogger(Accept.class.getName()).log(Level.SEVERE, null, ex);
        }
            
    }
    }
