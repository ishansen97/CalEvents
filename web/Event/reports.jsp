<%-- 
    Document   : reports
    Created on : Oct 5, 2018, 4:42:58 PM
    Author     : hp
--%>

<%@page import="java.sql.*, Event.*" %>
<!DOCTYPE html>
<html>
    <title>Event</title>
    <meta charset="UTF-8">
    <meta    name="viewport" content="width=device-width, initial-scale=1">
    <script class="jsbin" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <style>
        td {
            padding: 10px;
        }
    </style>
    
    <script>
        function hallReportValidate() {
            var event_type = document.getElementById("eventHall").value;
            var hall_month = document.getElementById("hall_month").value;
            var hall_report_name = document.getElementById("hall_report_name").value;
            
            if ((event_type === "") || (hall_month === "") || (hall_report_name === "")) {
                alert("Please fill the fields");
                return false;
            }
            else {
                return true;
            }
        }
        
        function eventReportValidate() {
            var event_type = document.getElementById("event").value;
            var event_report_month = document.getElementById("event_report_month").value;
            var event_report_name = document.getElementById("event_report_name").value;
            
            if ((event_type === "") || (event_report_month === "") || (event_report_name === "")) {
                alert("Please fill the fields");
                return false;
            }
            else {
                return true;
            }
        }
    </script>



    <%@ include file="Layouts/Styles.jsp" %>

    <body class="w3-light-grey">

        <%@ include file="Layouts/Navigation.jsp" %>
        
        <div class="container" style="margin-top: 50px; margin-left: 300px">
            <div class="row">
                <h1 style="color: blue">Report Generation and Statistics</h1>
            </div>
            <div class="row">
                <div class="card col-6">
                    <div class="card-header">
                        <h1 class="modal-header">Event Reports</h1>
                    </div>
                    <div class="card-body">
                        <form action="<%=request.getContextPath() %>/EventReport" method="POST" onsubmit="eventReportValidate()">
                            <table>
                                <tr>
                                    <td>Event Type :</td>
                                    <td><select name="eventType" id="event">
                                            <option value="">-----</option>
                                            <option value="Public">Public</option>
                                            <option value="Booked">Booked</option>
                                            <option value="Private">Private</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Select Month : </td>
                                    <td><input type="month" name="event_report_month" id="event_report_month"></td>
                                </tr>
                                <tr>
                                    <td>Report Name : </td>
                                    <td><input type="text" name="event_report_name" id="event_report_name"></td>
                                </tr>
                                <tr>
                                    <td><button type="submit" class="btn btn-success">Create Report</button></td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>
         
                            
                <div class="card col-6">
                    <div class="card-header">
                        <h1 class="modal-header">Hall Reports</h1>
                    </div>
                    <div class="card-body">
                        <form action="<%=request.getContextPath() %>/HallReport" method="POST" onsubmit="hallReportValidate()">
                            <table>
                                <tr>
                                    <td>Event Type :</td>
                                    <td><select name="event_hall_type" id="eventHall">
                                            <option value="">-----</option>
                                            <option value="Public">Public</option>
                                            <option value="Booked">Booked</option>
                                            <option value="Private">Private</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Select month</td>
                                    <td><input type="month" name="hall_month" id="hall_month"></td>
                                </tr>
                                <tr>
                                    <td>Report Name : </td>
                                    <td><input type="text" name="hall_report_name" id="hall_report_name"></td>
                                </tr>
                                <tr>
                                    <td><button type="submit" class="btn btn-success">Create Report</button></td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>   
            </div>
            <!--</div>-->
        </div>

        <!-- !PAGE CONTENT! -->
        
            <!-- End page content 
            
            <%@ include file="Layouts/Footer.jsp" %>
            <%@ include file="Layouts/Scripts.jsp" %>
            </body>
            </html>
           