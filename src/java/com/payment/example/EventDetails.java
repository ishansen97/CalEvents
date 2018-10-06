package com.payment.example;

import java.text.SimpleDateFormat;
import java.util.Date;

public class EventDetails {

    private String name;
    private Date date;
    private int status;
    private int booked, total;
    private double price;
    public Expenses expenses;

    public static final int STATUS_CLOSED = 0;
    public static final int STATUS_OPEN = 1;
    public static final int STATUS_SOLD_OUT = 2;

    private final String[] STATUS_TEXT = {"sales-closed", "on-sale", "sold-out"};
    private final SimpleDateFormat ft = new SimpleDateFormat("MMMM dd, yyyy");

    public EventDetails(String name, Date date, int status, int booked, int total, double price, Expenses expenses) {
        this.name = name;
        this.booked = booked;
        this.total = total;
        this.price = price;
        this.expenses = expenses;

        if (status >= STATUS_CLOSED || status <= STATUS_OPEN) {
            this.status = status;
        } else {
            this.status = STATUS_CLOSED;
        }

        if (booked >= total) {
            this.booked = this.total;
            this.status = STATUS_SOLD_OUT;
        }

        this.date = date;
    }

    public String getName() {
        return name;
    }

    public int getBooked() {
        return booked;
    }

    public int getTotal() {
        return total;
    }

    public double getPercentage() {
        return ((float) booked / total) * 100;
    }

    private double calcExpected() {
        return price * total;
    }

    private double calcIncome() {
        return price * booked;
    }

    private double calcProfit() {
        return calcIncome() - expenses.getTotal();
    }

    public String getPrice() {
        return String.format("$%.2f", price);
    }

    public String getExpenses() {
        return String.format("$%.2f", expenses.getTotal());
    }

    public String getExpected() {
        return String.format("$%.2f", calcExpected());
    }

    public String getIncome() {
        return String.format("$%.2f", calcIncome());
    }

    public double getProfitPercentage() {
        return calcProfit()/calcExpected() * 100;
    }

    public String getProfit() {
        String str = "<span ";
        double profit = calcProfit();
        if (profit > 0) {
            str += String.format(">+ $%.2f", profit);
        } else {
            str += String.format("class='text-danger'>- $%.2f", Math.abs(profit));
        }
        str += "</span>";
        return str;
    }

    public String getBookedTitle() {
        return getBooked() + "/" + getTotal() + " (" + Math.floor(getPercentage()) + "%)";
    }

    public String getStatusClass() {
        return STATUS_TEXT[status];
    }

    public String getStatus() {
        return STATUS_TEXT[status].replaceAll("-", " ").toUpperCase();
    }

    public String getDate() {
        return ft.format(date);
    }
}
