<%-- 
    Document   : editReservation
    Created on : Aug 4, 2018, 10:42:28 AM
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
            #seats {
                font-size: 40px;
                color: red;
            }
        </style>
    </head>
    <body>
        
        <script>
            function update(obj) {
                var i;
                
                var seat = document.getElementById(obj).checked;
                var num = 3;
                //var checked_seats = document.getElementById("checked_seats").innerHTML;
                var unchecked_seats = document.getElementById("unchecked_seats").innerHTML;
                //var price = document.getElementById("price");
                
                //var check_arr = [checked_seats];
                var uncheck_arr = [unchecked_seats];

                if (seat === true) {
                    alert("okay " + obj);
                    //price = price + 1000;
                    check_arr[check_arr.length] = obj;
                    //document.getElementById("checked_seats").innerHTML = check_arr;
                }
                else {
                    alert("not okay " + obj);
                    //price = price - 1000;
                    uncheck_arr[uncheck_arr.length] = obj;
                    document.getElementById("unchecked_seats").innerHTML = uncheck_arr;
                }
                //document.getElementById("price").innerHTML = price;
            }
            
            function confirm() {
                var seat_arr = document.getElementById("unchecked_seats").innerHTML;
                document.getElementById("final_seats").value = seat_arr;
            }
            
            function checking_seats() {
                var seats = document.getElementById("final_seats").value;
                
                if (seats === "") {
                    alert("Please confirm your final seat numbers");
                    return false;
                }
            }
        </script>
        
        <% String reservation = request.getParameter("id");
           ResultSet result = Reservation.getReservedSeats(reservation);
        %>
        <div class="row">
            <div class="container d-md-block pl-5 jumbotron">
                <a href="handleReservation.jsp" class="btn btn-info">Back to reservation list</a>
                <h1>Your seat reservations</h1>
                <div id="seats">
                <% while (result.next()) { 
                    int seat = Integer.parseInt(result.getString("seat_num"));
                %>
                <input type="checkbox" id="<%=seat %>" value="<%=seat %>" checked="true" style="padding: 10px" onclick="update(this.id)"><%=seat %>
                <% } %>
                <button type="button" id="btn" class="btn btn-success" onclick="confirm()">Confirm</button>
                </div>
                <form action="<%=request.getContextPath() %>/updateReservationServlet" method="post" onsubmit="return checking_seats()">
                    <!--<h1>checked seats</h1>
                    <p id="checked_seats"></p>-->
                    <h1>unchecked seats</h1>
                    <p id="unchecked_seats"></p>
                    <input type="text" id="final_seats" name="final_seats" value="">
                    <input type="text" name="reservation" value="<%=reservation %>">
                    <button type="submit" name="submit">Submit</button>
                </form>
            </div>
                
        </div>
        
        
        
        <script src="../External/Bootstrap/js/bootstrap.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <script src="../External/Bootstrap/js/bootstrap.js"></script>
    </body>
</html>
