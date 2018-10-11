/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.payment.utils;

import com.payment.Expense;
import com.payment.ExpenseDao;
import com.payment.PaymentDao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Graphs {

    public static int SUMMARY_GRAPH = 0;
    public static int SUMMARY_PIE_DATA = 1;
    public static int SUMMARY_PIE_LABELS = 2;

    public static int PAYMENT_SUMMARY = 3;
    public static int PAYMENT_PIE_LABEL = 4;
    public static int PAYMENT_PIE_DATA = 5;
    public static int PAYMENT_TOTAL = 6;
    public static int PAYMENT_EVENT_TOTAL = 7;
    public static int PAYMENT_SUM = 8;

    public static int EXPENSE_SUMMARY = 9;
    public static int EXPENSE_SUM = 10;

    public static int PAYMENT_EXPENSE_BALANCE = 10;

    public static HashMap<Integer, String> getIndexSummary() {
        HashMap<Integer, String> summary = new HashMap<Integer, String>();
        try {
            ResultSet ps = PaymentDao.getPaymentSummary();
            ResultSet es = ExpenseDao.getAllExpensesSummary();

            double incomeSum = 0;
            double expenseSum = 0;
            StringBuilder income = new StringBuilder();
            StringBuilder expense = new StringBuilder();

            while (ps.next()) {
                String date = ps.getString("year") + "/" + ps.getString("month");
                double sum = ps.getDouble("sum");
                income.append("{ x: '").append(date).append("', y: ").append(String.format("%.0f", sum)).append("}, ");
                incomeSum += sum;
            }

            while (es.next()) {
                String date = es.getString("year") + "/" + es.getString("month");
                double rand = es.getDouble("sum");
                expense.append("{ x: '").append(date).append("', y: ").append(String.format("%.0f", rand)).append("}, ");
                expenseSum += rand;
            }

            summary.put(PAYMENT_SUMMARY, income.toString());
            summary.put(EXPENSE_SUMMARY, expense.toString());
            summary.put(PAYMENT_SUM, Fmt.toDec(incomeSum));
            summary.put(EXPENSE_SUM, Fmt.toDec(expenseSum));
            summary.put(PAYMENT_EXPENSE_BALANCE, Fmt.toDec(incomeSum - expenseSum));


        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Graphs.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Graphs.class.getName()).log(Level.SEVERE, null, ex);
        }
        return summary;
    }

    public static HashMap getPaymentSummary(String date) {
        HashMap<Integer, String> summary = new HashMap<Integer, String>();
        try {
            ResultSet ps = PaymentDao.getPaymentSummaryForMonth(date);
            String paymentData = "";
            double paymentTotal = 0;
            double paymentSum;
            while (ps.next()) {
                paymentSum = ps.getDouble("sum(amount)");
                paymentTotal += paymentSum;
                paymentData += String.format("{ x: '%s', y: %.2f, },", ps.getString("date(pay_date)"), paymentSum);
            }

            ResultSet es = PaymentDao.getEventsSummary(date);
            String eventsLabels = "";
            String eventsData = "";
            int eventsTotal = 0;
            int eventsCount;
            while (es.next()) {
                eventsCount = es.getInt("count(event_id)");
                eventsTotal += eventsCount;
                eventsLabels += "'" + es.getString("event_id") + "', ";
                eventsData += eventsCount + ", ";
            }

            summary.put(PAYMENT_SUMMARY, paymentData);
            summary.put(PAYMENT_PIE_LABEL, eventsLabels);
            summary.put(PAYMENT_PIE_DATA, eventsData);
            summary.put(PAYMENT_TOTAL, Fmt.toDec(paymentTotal));
            summary.put(PAYMENT_EVENT_TOTAL, String.valueOf(eventsTotal));

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Graphs.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Graphs.class.getName()).log(Level.SEVERE, null, ex);
        }

        return summary;
    }

    public static HashMap getExpensesSummary(ArrayList<Expense> expenses) {
        HashMap<Integer, String> summary = new HashMap<Integer, String>();

        String graphData, pieLabels, pieAmount;
        Map<String, String> graphSet = new HashMap<String, String>();
        Map<String, Double> deptSum = new HashMap<String, Double>();

        for (Expense e : expenses) {
            // add department count
            String department = e.getDept();
            Double deptsum = deptSum.get(department);
            double amount = e.getAmount();
            deptSum.put(department, ((deptsum == null) ? amount : (deptsum + amount)));

            // get grpah data
            String graphSetData = String.format("{ x: '%s', y: %.2f, }, ", Fmt.toISODate(e.getDate()), amount);
            String currentData = graphSet.get(department);
            graphSet.put(department, (currentData == null ? graphSetData : currentData + graphSetData));
        }

        graphData = "";
        for (Map.Entry<String, String> val : graphSet.entrySet()) {
            graphData += String.format("{ label: '%s', data:[%s], },", Fmt.toTitleCase(val.getKey()), val.getValue());
        }

        pieLabels = "";
        pieAmount = "";
        for (Map.Entry<String, Double> val : deptSum.entrySet()) {
            pieLabels += String.format("'%s', ", Fmt.toTitleCase(val.getKey()));
            pieAmount += String.format("%.2f, ", val.getValue());
        }

        summary.put(SUMMARY_GRAPH, graphData);
        summary.put(SUMMARY_PIE_DATA, pieAmount);
        summary.put(SUMMARY_PIE_LABELS, pieLabels);
        return summary;
    }
}
