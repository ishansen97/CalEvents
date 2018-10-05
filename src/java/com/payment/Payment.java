/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.payment;

import com.payment.utils.PaymentDB;
import Connection.ServerConnection;
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author muammar
 */
public class Payment {

//    public static ResultSet getAllPayments() throws ClassNotFoundException, SQLException {
//        // ServerConnection.setConnection();
//        String query = "SELECT * FROM payment_res_event";
//        ResultSet res = null;
//
//        Connection con = PaymentDB.getConnection();
//        Statement st = con.createStatement();
//        res = st.executeQuery(query);
//
//        return res;
//    }
//
//    public static ResultSet getPaymentsForMonth(String date) throws ClassNotFoundException, SQLException {
//        String[] yyyyMM = date.split("-");
//        String query = "SELECT * FROM payment_res_event "
//                + "WHERE year(pay_date) = ? AND month(pay_date) = ?";
//
//        Connection con = PaymentDB.getConnection();
//        PreparedStatement ps = con.prepareStatement(query);
//        ps.setString(1, yyyyMM[0]);
//        ps.setString(2, yyyyMM[1]);
//
//        return ps.executeQuery();
//    }
//
//    public static ResultSet getPaymentById(String id) throws ClassNotFoundException, SQLException {
//        Connection con = PaymentDB.getConnection();
//        String query = "SELECT * FROM payment_res_event "
//                + "WHERE pay_id = ? ORDER BY pay_date ASC";
//
//        PreparedStatement ps = con.prepareStatement(query);
//        ps.setString(1, id);
//        ResultSet res = ps.executeQuery();
//
//        return res;
//    }
//
//    public static ResultSet getPaymentSummaryForMonth(String date) throws ClassNotFoundException, SQLException {
//        String[] yyyyMM = date.split("-");
//        String query = "SELECT date(pay_date), sum(amount) "
//                + "FROM payment "
//                + "WHERE year(pay_date) = ? AND month(pay_date) = ? "
//                + "GROUP BY year(pay_date), month(pay_date), day(pay_date)";
//
//        Connection con = PaymentDB.getConnection();
//        PreparedStatement ps = con.prepareStatement(query);
//        ps.setString(1, yyyyMM[0]);
//        ps.setString(2, yyyyMM[1]);
//
//        return ps.executeQuery();
//    }
//
//    public static ResultSet getEventsSummary(String date) throws ClassNotFoundException, SQLException {
//        String[] yyyyMM = date.split("-");
//        String query = "SELECT event_id, count(event_id) FROM `payment_res_event` "
//                + "WHERE year(pay_date) = ? AND month(pay_date) = ? "
//                + "GROUP BY year(pay_date), month(pay_date), event_Id";
//
//        Connection con = PaymentDB.getConnection();
//        PreparedStatement ps = con.prepareStatement(query);
//        ps.setString(1, yyyyMM[0]);
//        ps.setString(2, yyyyMM[1]);
//
//        return ps.executeQuery();
//    }
//
//    public static ResultSet getPaymentSummary() throws ClassNotFoundException, SQLException {
//        Connection con = PaymentDB.getConnection();
//        String query = "SELECT year(pay_date) as year, month(pay_date) as month, count(amount) as count, sum(amount) as sum "
//                + "FROM payment "
//                + "GROUP BY year(pay_date), month(pay_date)";
//        PreparedStatement ps = con.prepareStatement(query);
//        return ps.executeQuery();
//    }
    private int id;
    private String resId, method;
    private double amount;
    private Date date;
    private PaymentDetails event;

    public Payment() {

    }

    /**
     * Create new payment
     *
     * @param resId Reservation ID
     * @param amount Payment amount
     * @param method Payment method
     */
    public Payment(String resId, String amount, String method) {
        this.resId = resId;
        this.amount = Double.parseDouble(amount);
        this.method = method;
    }

    public PaymentDetails getEvent() {
        return event;
    }

    public void setEvent(PaymentDetails event) {
        this.event = event;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public void setDate(java.sql.Date resDate) {
        this.date = new Date(resDate.getTime());
    }

    public java.sql.Date getSQLDate() {
        return new java.sql.Date(date.getTime());
    }

    public String getResId() {
        return resId;
    }

    public void setResId(String resId) {
        this.resId = resId;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    /**
     * Insert new payment to table
     *
     * @return
     * @throws ClassNotFoundException
     * @throws SQLException
     */
    public boolean insertPayment() throws ClassNotFoundException, SQLException {
        // ServerConnection.setConnection();
        String query = "INSERT INTO `payment` (`res_id`, `amount`, `method`) VALUES (?, ?, ?)";

        Connection con = PaymentDB.getConnection();
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, resId);
        ps.setString(2, String.valueOf(amount));
        ps.setString(3, method);

        if (ps.executeUpdate() > 0) {
            return true;
        }

        return false;
    }

}
