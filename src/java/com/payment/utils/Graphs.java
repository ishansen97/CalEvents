/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.payment.utils;

import com.payment.Expense;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class Graphs {

    public static int SUMMARY_GRAPH = 0;
    public static int SUMMARY_PIE_DATA = 1;
    public static int SUMMARY_PIE_LABELS = 2;

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
            String graphSetData = String.format("{ x: '%s', y: %.2f, }, ", Fmt.toShortDate(e.getDate()), amount);
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
