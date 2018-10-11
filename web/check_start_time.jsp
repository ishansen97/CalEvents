<%-- 
    Document   : check_start_time
    Created on : Sep 11, 2018, 3:11:41 PM
    Author     : hp
--%>
<%@page import="java.sql.*, Event.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%-- String location = request.getParameter("location");
           String date = request.getParameter("date");
           //String start_time = request.getParameter("start_time");
           ResultSet last_time = Event.getLastEndTime(location, date);
           
           if (last_time.next()) {
               out.println("<span><font color=red>Your start time should be greater than "+last_time.getString("next_start_time") +"</font></span>");
           }
           else {
               out.println("<span><font color=green>Available</font></span>");
           }
           
        --%>
        <% String location = "H001";
           String date = "2018-09-19";
           
           
        %>
    </body>
</html>
