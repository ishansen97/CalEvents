/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.payment;

import Connection.ServerConnection;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author muammar
 */
public class Payment {

    private String resId, amount, method;

    /**
     * Create new payment
     * @param resId Reservation ID
     * @param amount Payment amount
     * @param method Payment method
     */
    Payment(String resId, String amount, String method) {
        this.resId = resId;
        this.amount = amount;
        this.method = method;
    }

    /**
     * Insert new payment to table
     * @return
     * @throws ClassNotFoundException
     * @throws SQLException
     */
    public boolean insertPayment() throws ClassNotFoundException, SQLException {
        // ServerConnection.setConnection();
        String query = "INSERT INTO `payment` (`res_id`, `amount`, `method`) VALUES (?, ?, ?)";

        Connection con = ServerConnection.getConnection();
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, resId);
        ps.setString(2, amount);
        ps.setString(3, method);

        if (ps.executeUpdate() > 0) {
            return true;
        }

        return false;
    }

    /**
     * Get all entries in the payment table
     * @return
     * @throws ClassNotFoundException
     * @throws SQLException
     */
    public static ResultSet getAllPayments() throws ClassNotFoundException, SQLException {
        // ServerConnection.setConnection();
        String query = "SELECT * from payment";
        ResultSet res = null;

        Connection con = ServerConnection.getConnection();
        Statement st = con.createStatement();
        res = st.executeQuery(query);

        return res;
    }
}
