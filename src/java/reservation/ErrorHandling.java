/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package reservation;

/**
 *
 * @author DELL
 */
public class ErrorHandling {
    private static String message;
    
    public ErrorHandling() {}
    
    public static String showMessage() {
        return message;
    }
    
    public static void setMessage(String m) {
        message = m;
    }
}
