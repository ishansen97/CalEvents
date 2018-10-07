/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Event;

import static Event.EmailUtil.sendEmail;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;

/**
 *
 * @author hp
 */
public class MailSender 
{
    public static void main(String args[])
    {
        String to = "abishaanr99@gmail.com";
        String sub = "Hello";
        String msg = "I'm Abishaan ";
        //SendEmail t = new SendEmail(to,sub,msg);
        
        System.out.println("SSL Email Started");
        Properties props = new Properties();
        props.put("mail.smtp.host","smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth","true");
        props.put("mail.smtp.port","465");
        
        Authenticator auth = new Authenticator()
        {
            protected PasswordAuthentication getPasswordAuthentication(){
                return new PasswordAuthentication("databaser4@gmail.com","tankionline");
            }
        };
        
        Session s = Session.getDefaultInstance(props,auth);
        System.out.println("Session Created");
        
        sendEmail(s,to,sub,msg);
    }
}
