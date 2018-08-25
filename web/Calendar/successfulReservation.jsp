<%-- 
    Document   : successfulReservation
    Created on : Aug 24, 2018, 7:55:39 PM
    Author     : DELL
--%>
<%@page import="reservation.Reservation, java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="./Layouts/Styles.jsp" %>
        <%@include file="./Layouts/Scripts.jsp" %>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <style>
            th,td {
                padding: 20px;
            }
        </style>
    </head>
    <body>
        <% //try {
                String customer_name = session.getAttribute("customer_name").toString();
                Reservation obj = (Reservation) session.getAttribute("reservationObj");
                ResultSet result = Reservation.displayReservationDetails(obj);
           
        %>
        <div class="container" style="border: 2px solid blue; text-align: center">
            <div class="row" style="text-align: center">
                <p style="color: #0062cc">Congratulations <span><%=customer_name %></span> Your reservation is successfull</p>
            </div>
            <div class="row">
                <div class="btn btn-group-toggle">
                    <button class="btn btn-success" data-toggle="collapse" data-target="#res_details">View Reservation details</button>
                    <a href="calendar.jsp" class="btn btn-outline-primary">View Calendar</a>
                </div>
            </div>
            <div class="row collapse" id="res_details" style="border: 2px solid red; margin-top: 30px">
                <table class="table table-striped">
                    <tr>
                        <th>Event Name</th>
                        <!--<th>No of seats</th>-->
                        <th>Date</th>
                        <th>Amount</th>
                    </tr>
                    <% while (result.next()) { %>
                    <tr>
                        <td><%=result.getString("event_name") %></td>
                        <td><%=result.getString("date") %></td>
                        <td><%=result.getString("amount") %></td>
                    </tr>
                    <% } %>
                </table>
            </div>
        </div>
        <% // } catch (Exception ex) {
                //out.println(ex.getMessage());
           //}
        %>
    </body>
</html>
