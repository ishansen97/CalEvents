/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package reservation;
import java.util.Arrays;
import java.sql.*;

/**
 *
 * @author DELL
 */
public class Temp {
    public static void main(String[] args) {
        int[] intArr1 = {1,2,3,4,5};
        int[] intArr2 = {5,4,2,3,1};
        int temp;
        
        for (int i = 0; i < intArr2.length; i++) {
            for (int j = i + 1; j < intArr2.length; j++) {
                if (intArr2[i] > intArr2[j]) {
                    temp = intArr2[i];
                    intArr2[i] = intArr2[j];
                    intArr2[j] = temp;
                }
            }
        }
        
        System.out.print("Ascending order : ");
        for (int i = 0; i < intArr2.length; i++) {
            System.out.print(intArr2[i] + ",");
        }
        System.out.println();
        
        
    }
}
