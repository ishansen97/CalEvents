/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.payment.exception;

/**
 *
 * @author admin
 */
public class CreditCardNumberInvalidException extends Exception {

    public CreditCardNumberInvalidException() {
        super("Credit card number is invalid!");
    }

}
