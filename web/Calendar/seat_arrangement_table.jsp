<%-- 
    Document   : seat_arrangement_table
    Created on : Oct 2, 2018, 4:17:15 AM
    Author     : DELL
--%>

<%@page import="reservation.ReservationManagement, java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="./Layouts/Styles.jsp" %>
        <%@include file="./Layouts/Scripts.jsp" %>
    </head>
    <%@include file="./Layouts/Navigation.jsp" %>
    <body class="w3-light-gray">
        <div class="w3-main" style="margin-top: 50px; margin-left: 300px">
        <% ResultSet seat_arrangements = null;
           String search_arr = null;
           search_arr = request.getParameter("search_arr");
           
           try {
              if (search_arr == null) {
                  seat_arrangements = ReservationManagement.viewSeatArrangements();
              }
              else {
                  seat_arrangements = ReservationManagement.searchSeatArrangement(search_arr);
              }
        %>
        
        <div class="container bg-white">
                <div class="row">
                    <h1 style="color: black">create seat arrangements</h1>
                </div>
                <div class="row" style="margin-left: 20px">
                    <div class="col-8">
                        <a href="create_seat_arrangement.jsp" class="btn btn-outline-primary">Create Seat Arrangement</a>
                        <a href="seat_arrangement_table.jsp" class="btn btn-outline-primary" id="view_arr">View Seat Arrangement details</a>
                    </div>
                    <div class="col-4">
                        <form action="seat_arrangement_table.jsp" method="GET">
                            <input name="search_arr" type="text" id="date_month">
                            <button type="submit" class="btn btn-primary">Search</button>
                        </form>
                    </div>
                </div>
                <div class="row" style="margin-top: 20px; margin-left: 20px; color: black">
                    <table class="table table-striped">
                        <tr>
                            <th>Event ID</th>
                            <th>Columns</th>
                            <th>Sub_columns</th>
                            <th>Sub_rows</th>
                        </tr>
                        <% while (seat_arrangements.next()) { %>
                        <tr>
                            <td><%=seat_arrangements.getString("event_ID") %></td>
                            <td><%=seat_arrangements.getString("columns") %></td>
                            <td><%=seat_arrangements.getString("x_columns") %></td>
                            <td><%=seat_arrangements.getString("y_columns") %></td>
                            <td><a href="seat_arrangement_delete.jsp?seat_arr_id=<%=seat_arrangements.getString("seat_arranegement_id") %>" class="btn btn-danger">Delete</a></td>
                        </tr>
                        <% } %>
                    </table>
                </div>
            </div>

        </div>
    </body>
    <% } catch (Exception ex) { %>
        <div class="row">
          <div class="alert alert-danger" role="alert">
            No results found for your search
          </div>
        </div>
    <% } %>
</html>
