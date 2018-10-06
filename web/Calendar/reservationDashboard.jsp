<%-- 
    Document   : reservationDashboard
    Created on : Sep 4, 2018, 9:18:07 PM
    Author     : DELL
--%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="reservation.ReservationManagement" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="./Layouts/Styles.jsp" %>
        <%@include file="./Layouts/Scripts.jsp" %>
        <script src="scripts/canvasjs.js"></script>
        <title>JSP Page</title>
        
        <style>
            td {
                color : red;
            }
        </style>
    </head>
    <body class="w3-light-grey" onload="reservationGraph()">
        <%@include file="./Layouts/Navigation.jsp" %>
        
        <%  try {   
               SimpleDateFormat year_month_format = new SimpleDateFormat("yyyy-MM");
               SimpleDateFormat year_month_date_format = new SimpleDateFormat("yyyy-MM-dd");

               String reqDate = request.getParameter("date_month");
                if (reqDate == null) {
                    reqDate = year_month_format.format(new Date());
                }
                Date dateObj = year_month_format.parse(reqDate);
        %>
        
        <script>
            function changeType() {
                var type = document.getElementById("Date_type").value;
                document.getElementById("date_month").attributes["type"].value = type;
                
            }
        </script>
        
        
        <div class="w3-main" style="margin-left: 300px; margin-top: 50px">
            
            <div class="container">
                <form method="GET" class="row" id="search_payments" style="padding:0">
          <div class="col-8">
            <h2>Reservations - <small><i><%= new SimpleDateFormat("MMMM yyyy").format(dateObj)%></i></small></h2>
            <span style="font-size: 20px">Search By - 
                <select id="Date_type">
                    <option value="date">date</option>
                    <option value="month">month</option>
                </select>
                <button type="button" class="btn btn-secondary" onclick="changeType()">confirm</button>
            </span>
          </div>
           
          <div class="col-4">
            <div class="input-group">
              <input name="date" type="month" value="<%=reqDate %>" class="form-control" id="date_month">
              <div class="input-group-append">
                <button class="form-control btn btn-primary">Search</button>
              </div>
            </div>
          </div>

        </form>
                <hr>
                <% String requestedType = request.getParameter("date");
                   ResultSet reservationResult = ReservationManagement.getEventReservationSummary(requestedType);
                   String reservationData = "";

                   while (reservationResult.next()) {
                       reservationData += " { y: " +reservationResult.getInt("COUNT(*)")+ ", label: \"" +reservationResult.getString("event_name")+ "\"},";
                   }
                   reservationData += "";

                   StringBuilder builder = new StringBuilder(reservationData);
                   int index = reservationData.lastIndexOf(",");
                   builder.deleteCharAt(index);
                   
                %>
                
                <script>
                  function reservationGraph() {

                    var chart = new CanvasJS.Chart("reservationGraph", {
                    animationEnabled: true,
                    theme: "light2", // "light1", "light2", "dark1", "dark2"
                    title:{
                            text: "Reservation chart"
                    },
                    axisY: {
                            title: "#Reservations"
                    },
                    data: [{        
                            type: "column",  
                            showInLegend: true, 
                            legendMarkerColor: "grey",
                            legendText: "reservations",
                            dataPoints: [<%=builder %>]
                    }]
                });
                chart.render();

           };
                </script>
                <div class="row" style="margin-bottom: 20px; padding: 0">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header bg-success" style="color: white; margin-bottom: 5px; font-size: 25px">Reservation Summary</div>
                            <div class="card-body bg-light">
                                <h1 style="color: black">Statistics</h1>
                                <div class="card-group bg-white">
                                    <h2 class="h2"><%=requestedType %></h2>
                                    <div id="reservationGraph" style="height: 370px; width: 100%"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <% ResultSet result = ReservationManagement.getSeatAvailability();
                   ResultSet pastEvents = ReservationManagement.getPastEventDetails();
                %>
                
<!--                <div class="row" style="padding: 0">
                    <div class="col-6" style="overflow: scroll">
                        <div class="card bg-primary">
                            <div class="card-header">
                                <a href="#" style="color: white; font-size: 30px">Upcoming events</a>
                            </div>
                            <div class="card-body">
                                <table class="flex-nowrap table table-striped bg-light">
                                    <tr>
                                        <th>Event id</th>
                                        <th>Total seats</th>
                                        <th>#Booked Seats</th>
                                        <th>#Available Seats</th>
                                        <th>date</th>
                                    </tr>
                                    <% while (result.next()) { %>
                                    <tr>
                                        <td><%=result.getString("event_ID") %></td>
                                        <td><%=result.getString("total_seats") %></td>
                                        <td><%=result.getString("booked_seats") %></td>
                                        <td><%=result.getString("available_seats") %></td>
                                        <td><%=result.getString("date") %></td>
                                        <td><a href="reservation_details.jsp?event_id=<%=result.getString("event_ID") %>" class="btn btn-success">View more</a></td>
                                    </tr>
                                    <% } %>
                                </table>
                            </div>
                        </div>
                    </div>
                                
                    <div class="col-6" style="overflow: scroll">
                        <div class="card bg-danger">
                            <div class="card-header">
                                <h1>Past Events</h1>
                            </div>
                            <div class="card-body bg-light">
                                <table class="table table-striped">
                                    <tr>
                                        <th>Event id</th>
                                        <th>Total seats</th>
                                        <th>Booked seats</th>
                                        <th>date</th>
                                    </tr>
                                    <% while (pastEvents.next()) { %>
                                    <tr>
                                        <td><%=pastEvents.getString("event_ID") %></td>
                                        <td><%=pastEvents.getString("total_seats") %></td>
                                        <td><%=pastEvents.getString("booked_seats") %></td>
                                        <td><%=pastEvents.getString("date") %></td>
                                        <td><a href="past_reservation_details.jsp?event_id=<%=pastEvents.getString("event_ID") %>" class="btn btn-success">View more</a></td>
                                    </tr>
                                    <% } %>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>-->
        </div>
        <% } catch (Exception ex) {%>
        <div class="row">
          <div class="alert alert-danger" role="alert">
            No results found for your search
          </div>
        </div>
        <% } finally { %>
            <% ResultSet result = ReservationManagement.getSeatAvailability();
                   ResultSet pastEvents = ReservationManagement.getPastEventDetails();
                %>
                
                <div class="row" style="padding: 0">
                    <div class="col-6" style="overflow: scroll">
                        <div class="card bg-primary">
                            <div class="card-header">
                                <a href="#" style="color: white; font-size: 30px">Upcoming events</a>
                            </div>
                            <div class="card-body">
                                <table class="flex-nowrap table table-striped bg-light">
                                    <tr>
                                        <th>Event id</th>
                                        <th>Total seats</th>
                                        <th>#Booked Seats</th>
                                        <th>#Available Seats</th>
                                        <th>date</th>
                                    </tr>
                                    <% while (result.next()) { %>
                                    <tr>
                                        <td><%=result.getString("event_ID") %></td>
                                        <td><%=result.getString("total_seats") %></td>
                                        <td><%=result.getString("booked_seats") %></td>
                                        <td><%=result.getString("available_seats") %></td>
                                        <td><%=result.getString("date") %></td>
                                        <td><a href="reservation_details.jsp?event_id=<%=result.getString("event_ID") %>" class="btn btn-success">View more</a></td>
                                    </tr>
                                    <% } %>
                                </table>
                            </div>
                        </div>
                    </div>
                                
                    <div class="col-6" style="overflow: scroll">
                        <div class="card bg-danger">
                            <div class="card-header">
                                <h1>Past Events</h1>
                            </div>
                            <div class="card-body bg-light">
                                <table class="table table-striped">
                                    <tr>
                                        <th>Event id</th>
                                        <th>Total seats</th>
                                        <th>Booked seats</th>
                                        <th>date</th>
                                    </tr>
                                    <% while (pastEvents.next()) { %>
                                    <tr>
                                        <td><%=pastEvents.getString("event_ID") %></td>
                                        <td><%=pastEvents.getString("total_seats") %></td>
                                        <td><%=pastEvents.getString("booked_seats") %></td>
                                        <td><%=pastEvents.getString("date") %></td>
                                        <td><a href="past_reservation_details.jsp?event_id=<%=pastEvents.getString("event_ID") %>" class="btn btn-success">View more</a></td>
                                    </tr>
                                    <% } %>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%}%>
    </body>
</html>
