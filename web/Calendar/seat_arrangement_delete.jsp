<%-- 
    Document   : seat_arrangement_delete
    Created on : Oct 5, 2018, 4:49:46 AM
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
        <% String seat_arr_id = request.getParameter("seat_arr_id");
           int arr_id = Integer.parseInt(seat_arr_id);
           if (ReservationManagement.isSeatArrangementDeleted(arr_id)) {
               response.sendRedirect("seat_arrangement_table.jsp");
           }
           else {
               response.sendRedirect("arrangement404.jsp");
           }
        %>
    </body>
</html>
