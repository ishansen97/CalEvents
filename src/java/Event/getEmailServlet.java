/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Event;

import Connection.ServerConnection;
import static Event.EmailUtil.sendEmail;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 *
 * @author hp
 */
@WebServlet(name = "getEmailServlet", urlPatterns = {"/getEmailServlet"})
public class getEmailServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet getEmailServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet getEmailServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
            
            String email ="";
            String id = request.getParameter("eventid");
            try
            {
                Connection con = DBConnect.getInstance().getCon();
                
                
                
                String query = "SELECT * FROM private_events WHERE event_ID= '"+id+"'";
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(query);

                while(rs.next())
                {
                    email = rs.getString("email");
                }
                
            }
            catch(Exception ex)
            {
                out.println("Error occured");
            }
            
            //String body = "Mail";
            String msg = "Dear Customer,\n\n This is regarding the request you have made through our website for an event, In-order to proceed futher with your request Please contact the manager.\n\n\n Thank you! \n Simcoe Blues & Jazz Management.";
            
            String username = "bocmetro@gmail.com";
            String password = "boc123456";        
                    
            out.println(email);
            out.println("SSL Email Started");
            String sub = "Event Request Confirmation";
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
               return new javax.mail.PasswordAuthentication(username, password);
         }
         
        });
        
        try{
            
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("databaser4@gmail.com"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject(sub);
            message.setText(msg);
            
            Transport.send(message);
            out.println("Mail Sent");
        }catch(Exception e){
            
            out.println("Error occured!");
            
            
        }
        
        
        
        } catch (IOException ex) {
            Logger.getLogger(getEmailServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
            processRequest(request, response);
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
