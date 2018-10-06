/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.payment;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Lini Eisha
 */
public class FacilityExpense {

    private String type, name, condition;
    private int quantity;

    private double unitPrice, totalPrice;
    private Map<String, String> extraDetails;

    public FacilityExpense(String type, String name, String condition, int quantity, double unitPrice, Map<String, String> extraDetails) {
        this.type = type;
        this.name = name;
        this.condition = condition;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.extraDetails = extraDetails;
    }

    public String getType() {
        return type;
    }

    public String getDescription() {
        StringBuilder builder = new StringBuilder();

        builder.append(type).append(": ");
        builder.append("Name: ").append(name).append(" ");
        builder.append("x ").append(quantity).append(" ");
        builder.append(String.format("($%.2f per item)", unitPrice));

        return builder.toString();
    }

    public String getExtra() {
        StringBuilder builder = new StringBuilder();

        builder.append("Condition: ").append(condition);
        for (Map.Entry<String, String> val : extraDetails.entrySet()) {
            builder.append(", ")
                    .append(val.getKey()).append(": ")
                    .append(val.getValue());
        }

        return builder.toString();
    }

    public double getTotalAmount() {
        return unitPrice * quantity;
    }

}
