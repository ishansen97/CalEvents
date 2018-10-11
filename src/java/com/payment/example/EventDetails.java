package com.payment.example;

import com.payment.utils.PaymentDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

public class EventDetails {
    public static final int STATUS_CLOSED = 0;
    public static final int STATUS_OPEN = 1;
    public static final int STATUS_SOLD_OUT = 2;

    public static ArrayList<EventDetails> getEventDetails() {
        ArrayList<EventDetails> ev = new ArrayList<>();
        try {
            String query = "SELECT * FROM `payment_event_summary`";

            Connection con = PaymentDB.getConnection();
            PreparedStatement ps = con.prepareStatement(query);

            ResultSet res = ps.executeQuery();

            while (res.next()) {
                EventDetails event = new EventDetails();
                event.setId(res.getString("event_ID"));
                event.setName(res.getString("event_name"));
                event.setDate(res.getDate("date"));
                event.setBooked(res.getInt("bookings"));
                event.setTotalPrice(res.getDouble("total_income"));
                ev.add(event);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EventDetails.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ev;
    }


    private String id;
    private String name;

    private Date date;
    private int status;
    private int booked, total;
    private double totalPrice;

    private double price;
    public Expenses expenses;


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

    private EventDetails() {

    }
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public void setName(String name) {
        this.name = name;
    }
    public void setDate(Date date) {
        this.date = date;
        if (this.date.before(new Date())) {
            this.status = STATUS_OPEN;
        } else {
            this.status = STATUS_CLOSED;
        }
    }
    public void setBooked(int booked) {
        this.booked = booked;
    }
    public double getTotalPrice() {
        return totalPrice;
    }
    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
        this.price = totalPrice/this.booked;
        this.total = (int) Math.floor(this.booked * totalPrice) / 5;
        if (this.total == this.booked) {
            this.status = STATUS_SOLD_OUT;
        }
//        if (this.status == STATUS_CLOSED) {
//            this.total = this.booked;
//        }
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
        return calcProfit() / calcExpected() * 100;
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
