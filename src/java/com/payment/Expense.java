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
public class Expense {

    private int id;
    private String dept;
    private String desc;
    private String method;
    private double amount;
    private Date date;

    public Expense() {
    }

    public Expense(String dept, String desc, String method, double amount) {
        this.desc = desc;
        this.method = method;
        this.dept = dept;
        this.amount = amount;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public void setSQLDate(java.sql.Date date) {
        this.date = new Date(date.getTime());
    }

    public java.sql.Date getSQLDate() {
        return new java.sql.Date(date.getTime());
    }

}
