/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package email;
import javax.mail.*;
import java.util.*;
import javax.activation.*;
import javax.mail.internet.*;

/**
 *
 * @author DELL
 */
public class EmailNotification {
    
    public static void main(String[] args) {
        String to = "abishaanr99@gmail.com";
        String from = "ishanksen@gmail.com";
        //get system properties
        Properties properties = new Properties();
        
        //assign objects for certain parameters
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", 587);
        
        Session session = Session.getDefaultInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("ishanksen@gmail.com", "fepyzoeedqavflwc");
            }
});
        
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject("Message number 2");
            message.setContent("<h1>Hello Abishaan...sorry to bother you again</h1>", "text/html");
            
            //sending the email
            Transport.send(message);
            System.out.println("Message sent successfully");
        }
        catch (MessagingException ex) {
            ex.printStackTrace();
        }
    }
    
    
}
