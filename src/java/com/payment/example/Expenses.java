package com.payment.example;

public class Expenses {

    private double kitchen, facility;

    public Expenses(double kitchen, double facility) {
        this.kitchen = kitchen;
        this.facility = facility;
    }

    protected double getTotal() {
        return kitchen + facility;
    }

    public String getKitchen() {
        return String.format("$%.2f", kitchen);
    }

    public String getFacility() {
        return String.format("$%.2f", facility);
    }
}
