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
public class Temp {
    public static void main(String[] args) {
        String s = ",1,2,3";
        boolean parts = s.contains(",");
        String[] arr = s.split(",");
        System.out.println(arr.length);
        
        if (parts == true)
            System.out.println("true");
        else
            System.out.println("false");
    }
}
