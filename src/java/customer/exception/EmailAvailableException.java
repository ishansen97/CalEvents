/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package customer.exception;

/**
 *
 * @author DELL
 */
public class EmailAvailableException extends Exception {
    
    public EmailAvailableException() {
        super("This email address already exists in our system");
    }
}
