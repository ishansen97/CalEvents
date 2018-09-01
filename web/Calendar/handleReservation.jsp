<%-- 
    Document   : handleReservation
    Created on : Aug 4, 2018, 8:19:42 AM
    Author     : DELL
--%>

<%@page import="reservation.Reservation, java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../External/Jquery/jquery.min.js" type="text/javascript"></script>
        <!--<link href="../External/Bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>-->
        <!--<script src="../External/Bootstrap/js/bootstrap.js" type="text/javascript"></script>-->
        <link href="../External/Bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../External/Bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <title>JSP Page</title>
        
        <style>
            th,td {
                padding: 20px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-lg-10" style="border: 2px solid green">
                    <a href="calendar.jsp" class="btn btn-success">Calendar view</a>
                    <!--<a href="button" class="btn btn-danger">Make reservation</button>-->
                </div>
            </div>
            
            <%  try {
                    String cus_id = request.getParameter("customer_id");
                    ResultSet result = Reservation.getReservationDetails(cus_id);
                    int i = 0;
            %>
            
            <div class="row">
                <div class="col-lg-10" style="border: 2px solid green">
                    <table class="table table-hover table-striped" >
                        <tr>
                            <th>Reservation No.</th>
                            <th>Event Name</th>
                            <th>Date</th>
                        </tr>
                        <% while (result.next()) { %>
                        <tr>
                            <td><%=++i %></td>
                            <td><%=result.getString("event_name") %></td>
                            <td><%=result.getString("date") %></td>
                            <td><a href="editReservation.jsp?id=<%=result.getString("res_id") %>" class="btn btn-success">Edit</a></td>
                            <td><a href="deleteReservation.jsp?id=<%=result.getString("res_id") %>" class="btn btn-danger" onclick="return confirm('Are you sure?')">Delete</a></td>
                        </tr>
                        <% } %>
                    </table>
                </div>
            </div>
        </div>
        <% } catch (Exception ex) {
                response.sendRedirect("404.jsp");
           } 
        %>
        
        
        
        <script src="../External/Bootstrap/js/bootstrap.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <script src="../External/Bootstrap/js/bootstrap.js"></script>
    </body>
</html>
