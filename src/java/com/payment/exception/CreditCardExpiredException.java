/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.payment.exception;

/**
 *
 * @author DELL
 */
public class CreditCardExpiredException extends Throwable {
    public CreditCardExpiredException() {
        super("Credit card is expired!");
    }
}
