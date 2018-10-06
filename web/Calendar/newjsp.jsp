<%-- 
    Document   : newjsp
    Created on : Oct 2, 2018, 10:06:43 PM
    Author     : DELL
--%>
<%@page import="reservation.ReservationManagement, java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% ResultSet result = ReservationManagement.getBookedEventID(); %>
    </body>
</html>
