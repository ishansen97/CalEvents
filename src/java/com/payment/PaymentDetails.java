/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.payment;

import java.util.Date;

/**
 *
 * @author admin
 */
public class PaymentDetails {

    private String eventId, eventName;
    private Date resDate, eventDate;

    public PaymentDetails() {

    }

    public Date getEventDate() {
        return eventDate;
    }

    public void setEventDate(Date eventDate) {
        this.eventDate = eventDate;
    }

    public java.sql.Date getSQLEventDate() {
        return new java.sql.Date(eventDate.getTime());
    }

    public void setEventDate(java.sql.Date eventDateSQL) {
        this.eventDate = new Date(eventDateSQL.getTime());
    }

    public String getEventId() {
        return eventId;
    }

    public void setEventId(String eventId) {
        this.eventId = eventId;
    }

    public String getEventName() {
        return eventName;
    }

    public void setEventName(String event_name) {
        this.eventName = event_name;
    }

    public Date getResDate() {
        return resDate;
    }

    public void setResDate(Date resDate) {
        this.resDate = resDate;
    }

    public void setResDate(java.sql.Date resSQLDate) {
        this.resDate = new Date(resSQLDate.getTime());
    }

    public java.sql.Date getSQLResDate() {
        return new java.sql.Date(resDate.getTime());
    }
}
