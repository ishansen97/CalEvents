<%-- 
    Document   : CheckAvailability
    Created on : Sep 10, 2018, 12:14:46 PM
    Author     : hp
--%>
<%@page import="java.sql.*, Event.Event" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% String location = request.getParameter("location");
           String date = request.getParameter("date");
           Class.forName("com.mysql.jdbc.Driver");
           Connection con  = DriverManager.getConnection("jdbc:mysql://localhost:3306/calendartest","root","");
           Statement st = con.createStatement();
           String sql = "SELECT * FROM public_events WHERE date='"+date+"' AND location_ID='"+location+"'";
           ResultSet result = st.executeQuery(sql);
           
           if(result.next()) {
               result.previous();
           %>
           <h5 class="text-danger">There is an event on this location </h4>
            <% while (result.next()) { %>
<%--                out.println("<span><font color=red>There is an event on this location</font></span>");
                out.println("<span><font color=red>Start Time: "+result.getString("start_time")+"</font></span><br/>");
                out.println("<span><font color=red>End Time: "+result.getString("end_time")+"</font></span><br/>"); --%>
                <p class="existing-times" data-id="<%= result.getString("event_id") %>" >Event from <time class="start_time"><%= result.getString("start_time")%></time> to <time class="end_time"><%= result.getString("end_time")%></time></p>
            <%}
            } else {
                %>
            <h5 class="text-success">No Events on this day for this location</h4>
                <%
            }
//            else {
//                out.println("<span><font color=green>Available</font></span>");
//            } 
        %>
        <p style="color: red"><%--=location --%></p>
        <p style="color: red"><%--=date --%></p>
        
        <%--  String location = request.getParameter("location");
           String date = request.getParameter("date");
           Class.forName("com.mysql.jdbc.Driver");
           Connection con  = DriverManager.getConnection("jdbc:mysql://localhost:3306/calendartest","root","");
           Statement st = con.createStatement();
           String sql = "SELECT ADDTIME(end_time, '2:00:00') AS 'next_start_time' FROM public_events WHERE date = '" +date+ "' AND location_ID = '" +location+ "' ORDER BY end_time DESC LIMIT 1";
           ResultSet result = st.executeQuery(sql);
           
           //RequestDispatcher dispatcher = request.getRequestDispatcher("insertEvent.jsp");
           
           if (result.next()) {
               request.setAttribute("start_time", result.getString("next_start_time"));
               //dispatcher.forward(request, response);
               out.println("working");
               out.println("Result : " + result.getString("next_start_time"));
               
           }
           else {
               request.setAttribute("start_time", "00:00");
               out.println("problem");
           }
            
        --%>
    </body>
</html>
