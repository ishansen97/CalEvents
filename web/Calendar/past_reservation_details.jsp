<%-- 
    Document   : past_reservation_details
    Created on : Sep 9, 2018, 7:24:18 PM
    Author     : DELL
--%>

<%@page import="java.sql.*, reservation.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="./Layouts/Styles.jsp" %>
        <%@include file="./Layouts/Scripts.jsp" %>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        
        <style>
            td {
                font-size: 20px;
            }
            #eventTable td {
                color: red;
            }
            .price {
                color : red;
            }
        </style>
    </head>
    <body class="w3-light-gray">
        <%@include file="./Layouts/Navigation.jsp" %>
        
        <script>
            function showModal(obj,obj1) {
                var seat = obj;
                var event_id = obj1;
                event_id = event_id.toString();
                
                $.post("customer_seat_details.jsp", {seat_num : seat, event_id : event_id}, function(data) {
                    $("#customer_seat_details .modal-body").html(data);
                });
//                $("#customer_seat_details .modal-title").html(obj);
//                $("#customer_seat_details .modal-body").html(obj1);
                $("#customer_seat_details").modal();
            }
            
            function isUpdatable() {
                var booked_seats = document.getElementById("no_of_seats").value;
                
                if (booked_seats === "0") {
                    $("#test").modal();
                    return true;
                }
                else {
                    alert("You cannot update the ticket prices because there are already made bookings");
                    return false;
                }
            }
            
            $(document).ready(function() {
                $("#test #price1").keyup(function() {
                    var first_price = $(this).val();
                    if (first_price > 100) {
                        $("#test .status1").html("<font color=red>invalid number</font>");
                    }
                    else {
                        $("#test .status1").html("<font color=green>valid number</font>");
                    }
                });
                $("#test #price2").keyup(function() {
                    var second_price = $(this).val();
                    if (second_price > 100) {
                        $("#test .status2").html("<font color=red>invalid number</font>");
                    }
                    else {
                        $("#test .status2").html("<font color=green>valid number</font>");
                    }
                });
                $("#test #price3").keyup(function() {
                    var third_price = $(this).val();
                    if (third_price > 100) {
                        $("#test .status3").html("<font color=red>invalid number</font>");
                    }
                    else {
                        $("#test .status3").html("<font color=green>valid number</font>");
                    }
                });
            });
            
        </script>
        
        <% String event_id = request.getParameter("event_id");
           EventViewer ev = new EventViewer(event_id);
           ResultSet event_details = ev.getEventDetails(); //to display the basic event details
           ResultSet getEventName = EventViewer.getEventName(event_id); //to get the event name
           
           String total_no_of_seats = ReservationManagement.getTotalNoOfSeats(event_id); //to get the total number of seats for an event
           String booked_no_of_seats = ReservationManagement.getBookedNoOfSeats(event_id); //to get the booked number of seats for an event
           String available_no_of_seats = ReservationManagement.getAvailableNoOfSeats(event_id); //to get the availble number of seats for an event
           
           ResultSet total_seat_numbers = ev.getEventSeats(event_id); //to get the total seat numbers for a given event
           ResultSet booked_seat_numbers = ReservationManagement.getBookedSeatNumbers(event_id); //to get the booked seat numbers for a given event
           ResultSet available_seat_numbers = ReservationManagement.getAvailableSeatNumbers(event_id); //to get the available seat numbers for a given event
           
           ResultSet[] ticketPrices = new ResultSet[3];
           
           ticketPrices = ReservationManagement.getTicketPrices(event_id);
           
           String event_name = null;
           String booked_seats = null;
           
           while (getEventName.next()) {
               event_name = getEventName.getString("event_name");
           }
        %>
        <div class="w3-main" style="margin-top: 50px; margin-left: 300px">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="card bg-success">
                            <div class="card-header">
                                <% if (event_name.contains("Music")) { %>
                                    <h1><i class="fa fa-music"><%=event_name %></i></h1>
                                <% } else if (event_name.contains("exhibition")) { %>
                                    <h1><i class="fa fa-bathtub"><%=event_name %></i></h1>
                                <% } else if (event_name.contains("workshop")) { %>
                                    <h1><i class="fa fa-smile"><%=event_name %></i></h1>
                                <% } else if (event_name.contains("annual")) { %>
                                    <h1><i class="fa fa-search"><%=event_name %></i></h1>
                                <% } %>
                            </div>
                            <div class="card-body bg-light">
                                <!--<canvas width="900" height="300" style="background-color: white">-->
                                <table class="table table-hover" id="eventTable">
                                        <tr>
                                            <th>Event name</th>
                                            <th>Description</th>
                                            <th>date</th>
                                            <th>start time</th>
                                            <th>end time</th>
                                        </tr>
                                        <% while (event_details.next()) { %>
                                        <tr>
                                            <td><%=event_details.getString("event_name") %></td>
                                            <td><%=event_details.getString("description") %></td>
                                            <td><%=event_details.getString("date") %></td>
                                            <td><%=event_details.getString("start_time") %></td>
                                            <td><%=event_details.getString("end_time") %></td>
                                        </tr>
                                        <% } %>
                                    </table>
                                <!--</canvas>-->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" style="margin-top: 10px">
                    <div class="col-3">
                        <div class="card bg-warning">
                            <div class="card-header">
                                <h1>Total Seats</h1>
                            </div>
                            <div class="card-body bg-light">
                                <h2 style="color: red">Total No of seats</h2>
                                <p style="font-size: 30px;"><%=total_no_of_seats %></p>
                                <button type="button" class="btn btn-outline-warning" data-toggle="collapse" data-target="#total_seats">view seats</button>
                                
                                <div id="total_seats" class="collapse" style="margin-top: 10px">
                                    <% while (total_seat_numbers.next()) { %>
                                    <button class="btn btn-info"><%=total_seat_numbers.getString("seat_num") %></button>
                                    <% } %>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="card bg-secondary">
                            <div class="card-header">
                                <h1>Booked Seats</h1>
                            </div>
                            <div class="card-body bg-light">
                                <h2 style="color: blue">Booked No of seats</h2>
                                <p style="font-size: 30px;"><%=booked_no_of_seats %></p>
                                <button type="button" class="btn btn-outline-secondary" data-toggle="collapse" data-target="#booked_seats">view seats</button>
                                
                                <div id="booked_seats" class="collapse" style="margin-top: 10px">
                                    <% while (booked_seat_numbers.next()) { %>
                                    <% booked_seats = booked_seat_numbers.getString("seat_num");  %>
                                    <button type="button" class="btn btn-info" name="<%=event_id %>" id="<%=booked_seats %>" onclick="showModal(this.id,this.name)"><%=booked_seat_numbers.getString("seat_num") %></button>
                                    <% } %>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="card bg-primary">
                            <div class="card-header">
                                <h1>Available Seats</h1>
                            </div>
                            <div class="card-body bg-light">
                                <h2 style="color: green">Available No of seats</h2>
                                <p style="font-size: 30px;"><%=available_no_of_seats %></p>
                                <button type="button" class="btn btn-outline-primary" data-toggle="collapse" data-target="#available_seats">view seats</button>
                                
                                <div id="available_seats" class="collapse" style="margin-top: 10px">
                                    <% while (available_seat_numbers.next()) { %>
                                    <button class="btn btn-info"><%=available_seat_numbers.getString("seat_num") %></button>
                                    <% } %>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-3" style="margin: auto">
                        <div class="card">
                            <div class="card-header">
                                <h1>ticket prices</h1>
                            </div>
                            <div class="card-body">
                                <table class="table table-success table-hover">
                                    <tr>
                                        <th>Seat range</th>
                                        <th>Price(in $)</th>
                                    </tr>
                                    <tr>
                                        <td>1 - 5</td>
                                        <% if (ticketPrices[0].next()) { %>
                                        <td class="price"><%=ticketPrices[0].getDouble("AVG(price)") %></td>
                                        <% } %>
                                    </tr>
                                    <tr>
                                        <td>6 - 10</td>
                                        <% if (ticketPrices[1].next()) { %>
                                        <td class="price"><%=ticketPrices[1].getDouble("AVG(price)") %></td>
                                        <% } %>
                                    </tr>
                                    <tr>
                                        <td>11 - 15</td>
                                        <% if (ticketPrices[2].next()) { %>
                                        <td class="price"><%=ticketPrices[2].getDouble("AVG(price)") %></td>
                                        <% } %>
                                    </tr>
                                    <tr>
                                        <td><input type="hidden" id="no_of_seats" value="<%=booked_no_of_seats %>"></td>
                                        <!--<td><button type="button" class="btn btn-success" onclick="return isUpdatable()">Update</button></td>-->
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                                    
                   
                   <!--customer-seat modal -->
                   
                   <div class="modal fade" id="customer_seat_details">
                       <div class="modal-dialog">
                           <div class="modal-content">
                               <div class="modal-header">
                                   <h1 class="modal-title">Customer details</h1>
                                   <button type="button" class="close" data-dismiss="modal">&times;</button>
                               </div>
                               <div class="modal-body" style="color: blue">
                               </div>
                               <div class="modal-footer">
                                   <button type="button" class="btn btn-danger" data-dismiss="modal">close</button>
                               </div>
                           </div>
                       </div>
                   </div>
                   <!--end of customer-seat modal -->
                   
                </div>
            </div>
        </div>
        
    </body>
</html>
