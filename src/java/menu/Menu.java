/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package menu;
import Connection.ServerConnection;
import java.sql.*;


/**
 *
 * @author Sohan
 */
public abstract class Menu {
    protected String menu_Id;
    protected String name;

    public Menu(String name) {
        this.name = name;
    }
    
    public abstract String generateMenuId() throws ClassNotFoundException, SQLException;
    public abstract boolean isInserted() throws ClassNotFoundException, SQLException;
}
