/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.payment;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class PaymentDB {
    private static Connection con = null;
    private static String url = "jdbc:mysql://127.0.0.1/";
    private static String dbname = "calevents";
    private static String username = "root";
    private static String password = "";

    public static Connection getConnection() {
            try {
                // check if connection is null or closed (checks if connection was disconnected and retries)
                if (con == null || con.isClosed()) {
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection(url+dbname, username, password);
                }
            }
            catch (Exception ex) {
                Logger.getLogger(PaymentDB.class.getName()).log(Level.SEVERE, null, ex);
            }
            finally {
                return con;
            }
        }
}
