<%-- 
    Document   : reports_statistics
    Created on : Sep 9, 2018, 8:58:06 PM
    Author     : DELL
--%>
<%@page import="java.sql.*, java.text.SimpleDateFormat,java.util.Date, reservation.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="./Layouts/Styles.jsp" %>
        <%@include file="./Layouts/Scripts.jsp" %>
        
        <style>
            #summary_table, #seat_summary_table, #available_summary_table {
                color: black;
                padding: 20px;
            }
        </style>
    </head>
    <%@include file="./Layouts/Navigation.jsp" %>
    <body class="w3-light-gray">
        
        <% SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
           SimpleDateFormat month_format = new SimpleDateFormat("yyyy-MM");
           String event_name = null;
           String event_id = null;
           Date date = new Date();
           Date search_date = null;
           String current_date = sdf.format(date);
           String search_month = request.getParameter("search_month");
           
           if (search_month == null) {
               search_month = month_format.format(new Date());
               search_date = new Date();
           }
           else {
               search_month += "-01";
               search_date = sdf.parse(search_month);
           }
           
           ResultSet monthly_summary = ReservationManagement.getReservationSummaryForMonth(search_month);    //to get the total number of reservations for given time
           ResultSet monthly_seat_summary = ReservationManagement.getTotalSeatsSummary(search_month);
           ResultSet available_seat_summary = ReservationManagement.getMonthlyAvailableSeatSummary(search_month);
           
           int no_of_reservations = ReservationManagement.getTotalNoOfReservationsForMonth(search_month);    //to get the total number of seats reserved for given time
           int no_of_seats = ReservationManagement.getTotalSeatsReserved(search_month);
           int no_of_available_seats = ReservationManagement.getNoOfAvailableSeats(search_month);
           
           ResultSet event_details = ReservationManagement.getMostPopularEventForMonth(search_month);
           String most_popular_date = ReservationManagement.getDateWithMostReservations(search_month);
           
           if (most_popular_date == null) {
               most_popular_date = "N/A";
           }
           
        %>
        
        <div class="w3-main" style="margin-top: 50px; margin-left: 300px">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <span class="modal-title" style="color: blue; font-size: 35px">Welcome to Reports and Statistics page</span>
                        
                        <form action="" method="GET">
                            <div class="input-group col-4">
                                 <input name="search_month" type="month" value="<%=search_month %>" class="form-control" id="date_month">
                                 <div class="input-group-append">
                                    <button class="form-control btn btn-primary">Search</button>
                                 </div>
                            </div>
                        </form>
                        
                        <div class="card bg-white" style="margin-top: 20px; height: 600px">
                            <div class="card-header">
                                <h2>Statistics for <span><%= new SimpleDateFormat("MMMM yyyy").format(search_date)%></span></h2>
                            </div>
                            <div class="card-group w3-blue" style="height: 600px">
                                <div class="col-4">
                                    <div class="card">
                                        <div class="card-header bg-success">
                                            <h1>Total Reservations</h1>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-6">
                                                    <span style="color: red; font-size: 30px"><%=no_of_reservations %></span>
                                                </div>
                                                <div class="col-6">
                                                    <button type="button" class="btn btn-outline-success" data-toggle="collapse" data-target="#summary_table">View in details</button>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12">
                                                    <table class="table table-striped table-hover collapse" id="summary_table">
                                                        <tr>
                                                            <th>Event ID</th>
                                                            <th>No of Reservations</th>
                                                        </tr>
                                                        <% while (monthly_summary.next()) { %>
                                                        <tr>
                                                            <td><%=monthly_summary.getString("event_id") %></td>
                                                            <td><%=monthly_summary.getString("COUNT(*)") %></td>
                                                        </tr>
                                                        <% } %>
                                                        </table>
                                                    
                                                        <!--<form action="<%=request.getContextPath() %>/ReservationReportManagementServlet" method="POST">-->
                                                            <!--<input type="hidden" name="current_date" value="<%=current_date %>">-->
                                                            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#reservation_report">Create Report</button>
                                                        
                                                        <!--</form>-->
                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="card">
                                        <div class="card-header bg-warning">
                                            <h1>No of seats Booked</h1>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-6">
                                                    <span style="color: blue; font-size: 30px"><%=no_of_seats %></span>
                                                </div>
                                                <div class="col-6">
                                                    <button type="button" class="btn btn-outline-warning" data-toggle="collapse" data-target="#seat_summary_table">View in details</button>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12">
                                                    <table class="table table-active table-hover collapse" id="seat_summary_table">
                                                        <tr>
                                                            <th>Event ID</th>
                                                            <th>No of booked seats</th>
                                                        </tr>
                                                        <% while (monthly_seat_summary.next()) { %>
                                                        <tr>
                                                            <td><%=monthly_seat_summary.getString("event_id") %></td>
                                                            <td><%=monthly_seat_summary.getString("COUNT(*)") %></td>
                                                        </tr>
                                                        <% } %>
                                                    </table>
                                                    <!--<form action="<%=request.getContextPath() %>/BookedSeatsReportServlet" method="POST">-->
                                                            <!--<input type="hidden" name="current_date" value="<%=current_date %>">-->
                                                            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#booked_seat_report">Create Report</button>
                                                        
                                                    <!--</form>-->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="card">
                                        <div class="card-header bg-danger">
                                            <h1>No of Available seats</h1>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-6">
                                                    <span style="color: red; font-size: 30px"><%=no_of_available_seats %></span>
                                                </div>
                                                <div class="col-6">
                                                    <button type="button" class="btn btn-outline-danger" data-toggle="collapse" data-target="#available_summary_table">View in details</button>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12">
                                                    <table class="table table-striped table-hover collapse" id="available_summary_table">
                                                        <tr>
                                                            <th>Event ID</th>
                                                            <th>No of available seats</th>
                                                        </tr>
                                                        <% while (available_seat_summary.next()) { %>
                                                        <tr>
                                                            <td><%=available_seat_summary.getString("event_ID") %></td>
                                                            <td><%=available_seat_summary.getString("available_seats") %></td>
                                                        </tr>
                                                        <% } %>
                                                    </table>
                                                    <!--<form action="<%=request.getContextPath() %>/AvailableSeatReportServlet" method="POST">-->
                                                            <!--<input type="hidden" name="current_date" value="<%=current_date %>">-->
                                                            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#available_seat_report">Create Report</button>
                                                        
                                                    <!--</form>-->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="card">
                                        <div class="card-header bg-success">
                                            <h1>Most Popular Event</h1>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-8">
                                                    <% while (event_details.next()) { %>
                                                    <a href="reservation_details.jsp?event_id=<%=event_details.getString("event_ID") %>" style="color: red; font-size: 30px"><%=event_details.getString("event_name") %></a>
                                                    <% } %>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="card">
                                        <div class="card-header bg-warning">
                                            <h1>Date with most number of reservations</h1>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-8">
                                                    <span style="color: blue; font-size: 30px"><%=most_popular_date %></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
                                                
        <!-- Report Renaming modals -->
        <div class="modal fade" id="reservation_report">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title">Rename Report As</h1>
                    </div>
                    <div class="modal-body">
                        <form action="<%=request.getContextPath() %>/ReservationReportManagementServlet" method="POST">
                            <table>
                                <tr>
                                    <td><input type="hidden" name="current_date" value="<%=current_date %>"></td>
                                    <td><input type="text" name="report_name" class="input-group" placeholder="Name your report"></td>
                                    <td><button type="submit" class="btn btn-danger">Generate</button></td>
                                </tr>
                            </table>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
                                    
        <!--Booked Seat Report modal -->                            
        <div class="modal fade" id="booked_seat_report">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title">Rename Report As</h1>
                    </div>
                    <div class="modal-body">
                        <form action="<%=request.getContextPath() %>/BookedSeatsReportServlet" method="POST">
                            <table>
                                <tr>
                                    <td><input type="hidden" name="current_date" value="<%=current_date %>"></td>
                                    <td><input type="text" name="report_name" class="input-group" placeholder="Name your report"></td>
                                    <td><button type="submit" class="btn btn-danger">Generate</button></td>
                                </tr>
                            </table>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
            
        <!--Available Seat Report modal -->                            
        <div class="modal fade" id="available_seat_report">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title">Rename Report As</h1>
                    </div>
                    <div class="modal-body">
                        <form action="<%=request.getContextPath() %>/AvailableSeatReportServlet" method="POST">
                            <table>
                                <tr>
                                    <td><input type="hidden" name="current_date" value="<%=current_date %>"></td>
                                    <td><input type="text" name="report_name" class="input-group" placeholder="Name your report"></td>
                                    <td><button type="submit" class="btn btn-danger">Generate</button></td>
                                </tr>
                            </table>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
                                    
    </body>
</html>
