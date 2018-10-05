/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.payment.utils;

import com.payment.exception.CreditCardNumberInvalidException;
import com.payment.exception.CreditCardExpiredException;
import java.util.Date;

/**
 *
 * @author muammar
 */
public class CreditCardValidator {
    private String cardNo, CCV, name;
    private Date expiry;

    /**
     * Create new credit card object.
     * Throws exceptions if credit card is invalid
     * @param cardNo Credit card number
     * @param name Name on credit card
     * @param CCV
     * @param expiry Card expiry date
     */
    public CreditCardValidator(String cardNo, String name, String CCV, Date expiry) {
        this.cardNo = cardNo;
        this.CCV = CCV;
        this.name = name;
        this.expiry = expiry;
    }

    /**
     * Checks whether the card number is valid using the Luhn algorithm
     * @param cardNo Credit card number
     * @return true if the number is valid, false otherwise.
     */
    private boolean validateCardNumber(String cardNo) {
        int s1 = 0, s2 = 0;

        // reverse card number
        String reverse = new StringBuffer(cardNo).reverse().toString();

        for (int i = 0; i < reverse.length(); i++) {
            int digit = Character.digit(reverse.charAt(i), 10);

            // odd index (algorithm is 1-indexed)
            if (i % 2 == 0) {
                s1 += digit;
            }
            else {
                // double the digit and add to sum
                s2 += 2 * digit;

                // if digit is between 5 - 9, subtract 9 from the sum
                if (digit >= 5) {
                    s2 -= 9;
                }
            }
        }

        return (s1 + s2) % 10 == 0;
    }

    /**
     * Check if card is valid. Throws exceptions if it is not
     * @throws CreditCardExpiredException
     * @throws CreditCardNumberInvalidException
     */
    public void validate() throws CreditCardExpiredException, CreditCardNumberInvalidException {
        Date now = new Date();
        // check if current date is before expiry date
        if (now.compareTo(expiry) > 0) {
            throw new CreditCardExpiredException();
        }

        // check if card is valid
        if (!validateCardNumber(cardNo)) {
            throw new CreditCardNumberInvalidException();
        }
    }
}
