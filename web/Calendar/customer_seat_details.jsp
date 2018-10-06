<%-- 
    Document   : customer_seat_details
    Created on : Sep 8, 2018, 9:57:15 AM
    Author     : DELL
--%>
<%@page import="java.sql.*, reservation.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <style>
            td {
                padding: 10px;
            }
        </style>
    </head>
    <body>
        <%  String event_id = request.getParameter("event_id");
            int seat_num = Integer.parseInt(request.getParameter("seat_num"));
            ResultSet result = ReservationManagement.getCustomerDetailsForSeat(event_id, seat_num);
        %>
        <table>
            <% while (result.next()) { %>
            <tr>
                <td>Customer ID</td>
                <td><%=result.getString("cus_id") %></td>
            </tr>
            <tr>
                <td>Name</td>
                <td><%=result.getString("name") %></td>
            </tr>
            <tr>
                <td>Address</td>
                <td><%=result.getString("address") %></td>
            </tr>
            <tr>
                <td>Contact Number</td>
                <td><%=result.getString("contact_number") %></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><%=result.getString("email") %></td>
            </tr>
            <% } %>
        </table>
    </body>
</html>
