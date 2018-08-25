/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.payment;

/**
 *
 * @author admin
 */
public class CreditCard {
    /**
     * Checks whether the card number is valid using the Luhn algorithm
     * https://en.wikipedia.org/wiki/Luhn_algorithm
     * @param cardNo Credit card number
     * @return true if the number is valid, false otherwise.
     */
    public static boolean validateCardNumber(String cardNo) {
        /**
         * Luhn Algorithm
         * **************
         *
         * 1. Reverse the order of the digits in the number.
         *
         * 2. Take the first, third, ... and every other odd digit in the
         * reversed digits and sum them to form the partial sum s1
         *
         * 3. Taking the second, fourth ... and every other even digit in the
         * reversed digits:
         *    1) Multiply each digit by two and sum the digits if the answer is
         *       greater than nine to form partial sums for the even digits
         *    2) Sum the partial sums of the even digits to form s2
         *
         * 4. If s1 + s2 ends in zero then the original number is in the form
         * of a valid credit card number as verified by the Luhn test.
         */

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
}
