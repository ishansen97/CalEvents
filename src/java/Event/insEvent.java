package Event;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author hp
 */
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class insEvent extends HttpServlet {
    private static final long serialVerionUID = 1L;
    
    public insEvent()
    {
        super();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("served at: ").append(request.getContextPath());
        
    } 
        
    protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
        PrintWriter out = response.getWriter();
        try{
            String event_name = request.getParameter("eventName");
            String description = request.getParameter("description");
            String location = request.getParameter("location");
            String date = request.getParameter("start");
            String start_time = request.getParameter("start_time");
            String end_time = request.getParameter("end_time");
            Date start_date = Date.valueOf(date);
            Time start = Time.valueOf(start_time);
            Time end = Time.valueOf(end_time);
            Event event = new Event(event_name,description,location,start_date,start,end);
             
        } catch (Exception ex) {
            out.println(ex.getMessage());
            Logger.getLogger(insEvent.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }
        
    
}
