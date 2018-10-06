/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.payment;

import com.payment.utils.PaymentDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class PaymentDao {

    private static String ID = "pay_id";
    private static String RES = "res_id";
    private static String METHOD = "pay_method";
    private static String AMOUNT = "amount";
    private static String DATE = "pay_date";
    private static String RES_DATE = "res_date";
    private static String EVENT_ID = "event_id";
    private static String EVENT_NAME = "event_name";
    private static String EVENT_DATE = "event_date";

    private static Payment getPayment(ResultSet rs) throws SQLException {
        Payment pm = new Payment();
        PaymentDetails dt = new PaymentDetails();
        pm.setId(rs.getInt(ID));
        pm.setResId(rs.getString(RES));
        pm.setAmount(rs.getDouble(AMOUNT));
        pm.setMethod(rs.getString(METHOD));
        pm.setDate(rs.getDate(DATE));
        dt.setResDate(rs.getDate(RES_DATE));
        dt.setEventId(rs.getString(EVENT_ID));
        dt.setEventName(rs.getString(EVENT_NAME));
        dt.setEventDate(rs.getDate(EVENT_DATE));
        dt.setCusId(rs.getString("cus_id"));
        dt.setCusName(rs.getString("cus_name"));
        pm.setEvent(dt);
        return pm;
    }

    public static boolean insertPayment(Payment payment) {
        try {
            String query = "INSERT INTO `payment` "
                    + "(`res_id`, `amount`, `method`) "
                    + "VALUES (?, ?, ?)";

            Connection con = PaymentDB.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, payment.getResId());
            ps.setDouble(2, payment.getAmount());
            ps.setString(3, payment.getMethod());

            if (ps.executeUpdate() > 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(PaymentDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public static ArrayList<Payment> getAllPayments() {
        ArrayList<Payment> payments = new ArrayList<>();
        try {
            // ServerConnection.setConnection();
            String query = "SELECT * FROM payment_res_event";
            ResultSet res = null;

            Connection con = PaymentDB.getConnection();
            Statement st = con.createStatement();
            res = st.executeQuery(query);

            while (res.next()) {
                payments.add(getPayment(res));
            }

        } catch (SQLException ex) {
            Logger.getLogger(PaymentDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return payments;
    }

    public static ArrayList<Payment> getPaymentsForMonth(String date) {
        ArrayList<Payment> payments = new ArrayList<>();
        try {
            String[] yyyyMM = date.split("-");
            String query = "SELECT * FROM payment_res_event "
                    + "WHERE year(pay_date) = ? AND month(pay_date) = ?";

            Connection con = PaymentDB.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, yyyyMM[0]);
            ps.setString(2, yyyyMM[1]);

            ResultSet res = ps.executeQuery();

            while (res.next()) {
                payments.add(getPayment(res));
            }

        } catch (SQLException ex) {
            Logger.getLogger(PaymentDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return payments;
    }

    public static Payment getPaymentById(String id) {
        Payment payment = null;
        try {
            Connection con = PaymentDB.getConnection();
            String query = "SELECT * FROM payment_res_event "
                    + "WHERE pay_id = ? ORDER BY pay_date ASC";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, id);
            ResultSet res = ps.executeQuery();

            if (res.next()) {
                payment = getPayment(res);
            }

        } catch (SQLException ex) {
            Logger.getLogger(PaymentDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return payment;
    }

    public static ResultSet getPaymentSummaryForMonth(String date) throws ClassNotFoundException, SQLException {
        String[] yyyyMM = date.split("-");
        String query = "SELECT date(pay_date), sum(amount) "
                + "FROM payment "
                + "WHERE year(pay_date) = ? AND month(pay_date) = ? "
                + "GROUP BY year(pay_date), month(pay_date), day(pay_date)";

        Connection con = PaymentDB.getConnection();
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, yyyyMM[0]);
        ps.setString(2, yyyyMM[1]);

        return ps.executeQuery();
    }

    public static ResultSet getEventsSummary(String date) throws ClassNotFoundException, SQLException {
        String[] yyyyMM = date.split("-");
        String query = "SELECT event_id, count(event_id) FROM `payment_res_event` "
                + "WHERE year(pay_date) = ? AND month(pay_date) = ? "
                + "GROUP BY year(pay_date), month(pay_date), event_Id";

        Connection con = PaymentDB.getConnection();
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, yyyyMM[0]);
        ps.setString(2, yyyyMM[1]);

        return ps.executeQuery();
    }

    public static ResultSet getPaymentSummary() throws ClassNotFoundException, SQLException {
        Connection con = PaymentDB.getConnection();
        String query = "SELECT year(pay_date) as year, month(pay_date) as month, count(amount) as count, sum(amount) as sum "
                + "FROM payment "
                + "GROUP BY year(pay_date), month(pay_date)";
        PreparedStatement ps = con.prepareStatement(query);
        return ps.executeQuery();
    }
    
    public static PaymentDetails getCustomerDetails(String id) {
        PaymentDetails customer = null;
        try {
            Connection con = PaymentDB.getConnection();
            String query = "SELECT * FROM `customer` WHERE cus_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, id);
            
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                customer = new PaymentDetails();
                customer.setCusId(rs.getString("cus_id"));
                customer.setCusName(rs.getString("name"));
                customer.setCusAddress(rs.getString("address"));
                customer.setCusEmail(rs.getString("email"));
                customer.setCusContact(rs.getString("contact_number"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PaymentDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return customer;
    }
}
