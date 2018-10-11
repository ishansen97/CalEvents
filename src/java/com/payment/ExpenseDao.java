/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.payment;

import com.payment.utils.Fmt;
import com.payment.utils.PaymentDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class ExpenseDao {

    private static String ID = "exp_id";
    private static String DEPT = "dept";
    private static String DESC = "description";
    private static String METHOD = "method";
    private static String AMOUNT = "amount";
    private static String DATE = "date_time";
    private static String CATEGORY = "category";
    private static String NOTES = "notes";

    public static boolean createExpense(Expense expense) throws SQLException {
        String query =
                "INSERT into expenses (dept, description, method, amount) "
                + "VALUES (?, ?, ?, ?)";

        Connection con = PaymentDB.getConnection();
        PreparedStatement ps = con.prepareStatement(query);

        ps.setString(1, expense.getDept());
        ps.setString(2, expense.getDesc());
        ps.setString(3, expense.getMethod());
        ps.setDouble(4, expense.getAmount());

        if (ps.executeUpdate() > 0) {
            return true;
        }
        return false;
    }

    public static boolean addFacilityExpense(Expense expense) throws SQLException {
        String query =
                "INSERT INTO expenses (dept, description, method, amount, category, notes) "
                + "VALUES (?, ?, ?, ?, ?, ?)";
        Connection con = PaymentDB.getConnection();
        PreparedStatement ps = con.prepareStatement(query);

        ps.setString(1, expense.getDept());
        ps.setString(2, expense.getDesc());
        ps.setString(3, expense.getMethod());
        ps.setDouble(4, expense.getAmount());
        ps.setString(5, expense.getCategory());
        ps.setString(6, expense.getNotes());

        if(ps.executeUpdate() > 0) {
            return true;
        }
        return false;
    }

    private static Expense getExpense(ResultSet rs) throws SQLException {
        Expense ex = new Expense();
        ex.setId(rs.getInt(ID));
        ex.setDept(rs.getString(DEPT));
        ex.setDesc(rs.getString(DESC));
        ex.setMethod(rs.getString(METHOD));
        ex.setAmount(rs.getDouble(AMOUNT));
        ex.setSQLDate(rs.getDate(DATE));
        ex.setCategory(rs.getString(CATEGORY));
        ex.setNotes(rs.getString(NOTES));

        return ex;
    }

    public static ArrayList<Expense> getAllExpenses() {
        ArrayList<Expense> expenses = new ArrayList<>();
        String query = "SELECT * FROM expenses";
        try {
            Connection con = PaymentDB.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet res = ps.executeQuery();

            while (res.next()) {
                expenses.add(getExpense(res));
            }

        } catch (SQLException ex) {
            Logger.getLogger(ExpenseDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return expenses;
    }

    public static Expense getExpense(String id) {
        Expense expense = null;
        String query = "SELECT * FROM expenses WHERE exp_id = ?";

        try {
            Connection con = PaymentDB.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, id);
            ResultSet res = ps.executeQuery();

            if (res.next()) {
                expense = getExpense(res);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ExpenseDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return expense;
    }

    public static ArrayList<Expense> getExpensesSummary() {
        ArrayList<Expense> summary = new ArrayList<>();
        String query = "SELECT date_time, dept, sum(amount) as amount "
                + "FROM expenses "
                + "GROUP BY dept, date(date_time) "
                + "ORDER BY date_time";
        try {
            Connection con = PaymentDB.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Expense ex = new Expense();
                ex.setDept(rs.getString(DEPT));
                ex.setAmount(rs.getDouble(AMOUNT));
                ex.setSQLDate(rs.getDate(DATE));
                summary.add(ex);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ExpenseDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return summary;
    }

    public static ArrayList<Expense> getExpensesSummaryForMonth(String date) {
        if (date == null) {
            return getExpensesSummary();
        }
        String where = "";
        String[] yyyyMM = null;
        if (date != null) {
            where = "WHERE year(date_time) = ? AND month(date_time) = ? ";
            yyyyMM = date.split("-");
        }

        ArrayList<Expense> summary = new ArrayList<>();
        String query = "SELECT date_time, dept, sum(amount) as amount "
                + "FROM expenses "
                + where
                + "GROUP BY dept, date(date_time) "
                + "ORDER BY date_time";
        try {
            Connection con = PaymentDB.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            if (date != null) {
                ps.setString(1, yyyyMM[0]);
                ps.setString(2, yyyyMM[1]);
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Expense ex = new Expense();
                ex.setDept(rs.getString(DEPT));
                ex.setAmount(rs.getDouble(AMOUNT));
                ex.setSQLDate(rs.getDate(DATE));
                summary.add(ex);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ExpenseDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return summary;
    }

    public static ResultSet getAllExpensesSummary() throws ClassNotFoundException, SQLException {
        Connection con = PaymentDB.getConnection();
        String query = "SELECT year(date_time) as year, month(date_time) as month, count(amount) as count, sum(amount) as sum "
                + "FROM expenses "
                + "GROUP BY year(date_time), month(date_time)";
        PreparedStatement ps = con.prepareStatement(query);
        return ps.executeQuery();
    }

    public static ArrayList<Expense> expensesSearch(String event, String dept, String method, String date, String sort, String order) {
        if (event == null && date == null && sort == null && dept == null && method == null) {
            return getAllExpenses();
        }

        ArrayList<Expense> expenses = new ArrayList<>();

        String[] yyyyMM = null;

        String where = "";
        String WHERE_EVENT = "";
        String WHERE_DATE = "";
        String WHERE_METHOD = "";
        String WHERE_DEPT = "";


        if (event != null) {
            where = "WHERE ";
            WHERE_EVENT = where + "description LIKE ?";
        }
        if (date != null) {
            where = "".equals(where) ? "WHERE " : " AND ";
            WHERE_DATE = where + "year(date_time) = ? AND month(date_time) = ? ";
            yyyyMM = date.split("-");
        }
        if (dept != null) {
            where = "".equals(where) ? "WHERE " : " AND ";
            WHERE_DEPT = where + "dept = ? ";
        }
        if (method != null) {
            where = "".equals(where) ? "WHERE " : " AND ";
            WHERE_METHOD = where + "method = ? ";
        }

        String ORDER_BY = "ORDER BY ";

        sort = sort == null ? "" : sort;
        switch(sort) {
            case "sort_invoice" :
                ORDER_BY += "exp_id";
             break;
            case "sort_amount" :
                ORDER_BY += "amount";
                break;
            default:
                ORDER_BY += "date_time";
        }

        ORDER_BY += " ";
        if (order == null || order.equals("desc")) {
            ORDER_BY  += "DESC";
        } else {
            ORDER_BY += "ASC";
        }

        try {
            String query = "SELECT * FROM expenses "
                    + WHERE_EVENT + WHERE_DEPT + WHERE_METHOD + WHERE_DATE + ORDER_BY;

            Connection con = PaymentDB.getConnection();
            PreparedStatement ps = con.prepareStatement(query);

            System.out.println(ps.toString());

            int i = 1;
            if (event != null) {
                ps.setString(i++, "%"+event+"%");
            }
            if (dept != null) {
                ps.setString(i++, dept);
            }
            if (method != null) {
                ps.setString(i++, method);
            }
            if (date != null) {
                ps.setString(i++, yyyyMM[0]);
                ps.setString(i++, yyyyMM[1]);
            }

            System.out.println(ps.toString());

            ResultSet res = ps.executeQuery();

            while (res.next()) {
                expenses.add(getExpense(res));
            }

        } catch (SQLException ex) {
            Logger.getLogger(PaymentDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return expenses;
    }
}
