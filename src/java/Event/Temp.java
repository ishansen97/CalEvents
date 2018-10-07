/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Event;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.swing.JOptionPane;

/**
 *
 * @author Faizur Rahman
 */
public class Temp {
    
    private String user ="serviceandrepair007@gmail.com";
    private String pass ="service007";
    
    public Temp(String to,String sub,String msg)
    {
        Properties prop = new Properties();
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        prop.put("mail.smtp.auth", true);
        prop.put("mail.smtp.starttls.enable", true);
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        
        Session session = Session.getInstance(prop, new javax.mail.Authenticator()
        {
         protected javax.mail.PasswordAuthentication getPasswordAuthentication()
         {
               return new javax.mail.PasswordAuthentication(user, pass);
         }
         
        });
        
        try{
            
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("serviceandrepair007@gmail.com"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(sub);
            message.setText(msg);
            
            Transport.send(message);
            System.out.println("Sent");
            //JOptionPane.showMessageDialog(null, "Email Sent");
        }catch(Exception e){
            
            //JOptionPane.showMessageDialog(null, "Email Sending Unsuccessful. Check your Internet Connection or Email Address");
            //JOptionPane.showMessageDialog(null, e);
            System.out.println("Error: "+e);
            
        }
        
        
    }
    
}
