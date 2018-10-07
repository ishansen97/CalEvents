<%-- 
    Document   : updateBookedEvent
    Created on : Aug 30, 2018, 3:46:08 PM
    Author     : hp
--%>
<%@page import="java.sql.*, Event.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <title>Event</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script>
        function date_validate() {
            var date = document.getElementById("st_date").value;
            var time1 = document.getElementById("st_STime").value;
            var time2 = document.getElementById("ed_Time").value;

            var ev_date = new Date(date);
            var cur_date = new Date();
            var start_time = new Date(time1);
            var end_time = new Date(time2);

            if (ev_date.getTime() < cur_date.getTime()) {
                alert("enter a day after current date");
                return false;
            } else
                return true;

            //  if(start_time.getHours() > end_time.getHours()) {
            //  alert("srart time should be less than end time");
            //    return false;
            //  }
            //    else
            //        return true;
        }
        function time_validate() {
            var date = document.getElementById("st_date").value;
            var time1 = document.getElementById("st_STime").value;
            var time2 = document.getElementById("ed_Time").value;

            var strtime1 = time1.toString();
            var strtime2 = time2.toString();

            var start_arr = strtime1.split(":");

            var ev_date = new Date(date);
            var cur_date = new Date();
            var start_time = new Date(time1);
            var end_time = new Date(time2);

            if (time1 > time2) {
                alert("start time should be less than end time");
                return false;
            } else {
                //alert("start_time " + time1);
                return true;
            }
        }


        function validation() {
            var time_validation = time_validate();
            var date_validation = date_validate();

            if (time_validation == true)
            {
                if (date_validation == true)
                {
                    return true;
                } else
                {
                    return false;
                }
            } else
            {
                return false;
            }

            //alert(time_validation);
            alert(date_validation);

            // return false;

            //return time_validation && date_validation;
        }
    </script>
    <%@ include file="Layouts/Styles.jsp" %>
    <style>
        .eventForm input[type=text], .eventForm input[type=date], .eventForm input[type=time]
        {
            width:100%;
            border:1px solid black;
            font-size:18px;
            padding:5px;
            font-family: Calibri;
            outline:none;
            border-radius:10px;
        }
        .eventForm input[type=text]:focus, .eventForm input[type=date]:focus, .eventForm input[type=time]:focus
        {
            border:1px solid #007bff;
        }
        .eventForm input[type=submit]
        {
            width:50%;
            border:1px solid whitesmoke;
            color:whitesmoke;
            font-size:18px;
            background-color: #007bff;
            font-family: Calibri;
            border-radius:10px;
            padding:5px;
            transition-duration: 0.5s;
        }
        .eventForm input[type=submit]:hover
        {
            background-color: whitesmoke;
            color:#007bff;
            border:1px solid #007bff;
        }
    </style>


    <body class="w3-light-grey">

        <%@ include file="Layouts/Navigation.jsp" %>

        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:300px;margin-top:43px;">

            <div class="row">
                <div class="col-12">


                    <% String event_id = request.getParameter("event_id");
                        ResultSet result = Booked_Event.displayThisBookedEvent(event_id);
                    %>

                    <div class="w3-main" style="margin-left:300px;margin-top:43px;">


                        <div class="container-fluid"  style="padding-top:22px">
                            <!-- Breadcrumbs-->
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item">
                                    <a href="Dashboard">Dashboard</a>
                                </li>
                                <li class="breadcrumb-item active">Update Booked Event</li>
                            </ol>

                            <div class="container-fluid mb-3 bg-white">
                                <p style="color:black;font-size:50px;text-align:center">Update Public Events</p>

                                <form action="<%=request.getContextPath()%>/UpdateBookedEventServelet" method="post" class="eventForm" onsubmit="return validation()">
                                    <% while (result.next()) {%>
                                    <table class="table table-striped">

                                        <p style="color:black;font-size:20px;text-align:left">Event name:</p>    
                                        <div class='form-row mb-2'>
                                            <div class='form-group col-lg-12'>
                                                <div class='input-group'>
                                                    <div class='input-group-prepend'>

                                                        <div class='input-group-text rounded-0'><i class='fa fa-calendar-check'></i></div>
                                                    </div>
                                                    <input type="text" name="B_event_name" value="<%=result.getString("event_name")%>">
                                                </div>
                                            </div>
                                        </div> 
                                        <p style="color:black;font-size:20px;text-align:left">Category:</p>    
                                        <div class='form-row mb-2'>
                                            <div class='form-group col-lg-12'>
                                                <div class='input-group'>
                                                    <div class='input-group-prepend'>

                                                        <div class='input-group-text rounded-0'><i class='fa fa-calendar-check'></i></div>
                                                    </div>
                                                    <input type="text" name="B_category" value="<%=result.getString("Category")%>" >
                                                </div>
                                            </div>
                                        </div> 
                                        <p style="color:black;font-size:20px;text-align:left">Description:</p>    
                                        <div class='form-row mb-2'>
                                            <div class='form-group col-lg-12'>
                                                <div class='input-group'>
                                                    <div class='input-group-prepend'>

                                                        <div class='input-group-text rounded-0'><i class='fa fa-calendar-check'></i></div>
                                                    </div>
                                                    <input type="text" name="B_description" value="<%=result.getString("description")%>">
                                                </div>
                                            </div>
                                        </div> 
                                        <p style="color:black;font-size:20px;text-align:left">Date:</p><p style="color:black;font-size:20px;">New Date:</p>
                                        <div class='form-row mb-2'>
                                            <div class='form-group col-lg-12'>
                                                <div class='input-group'>
                                                    <div class='input-group-prepend'>
                                                        <div class='input-group-text rounded-0'><i class='fa fa-calendar'></i></div>
                                                    </div>
                                                    <input type="text" name="B_date" value="<%=result.getString("Date")%>" id="start">
                                                    <input <input type="date" name="B_newDate" id="st_date">
                                                </div>
                                            </div>
                                        </div>
                                        <p style="color:black;font-size:20px;text-align:left">start time :&nsbp</p>
                                        <div class='form-row mb-2'>
                                            <div class='form-group col-lg-12'>
                                                <div class='input-group'>
                                                    <div class='input-group-prepend'>
                                                        <div class='input-group-text rounded-0'><i class='fa fa-calendar'></i></div>
                                                    </div>
                                                    <input type="text" name="B_start_time" value="<%=result.getString("start_time")%>" >
                                                    <input type="time" name="new_B_start_time" id="st_STime" >
                                                </div>
                                            </div>
                                        </div>

                                        <p style="color:black;font-size:20px;text-align:left">End time :</p>
                                        <div class='form-row mb-2'>
                                            <div class='form-group col-lg-12'>
                                                <div class='input-group'>
                                                    <div class='input-group-prepend'>
                                                        <div class='input-group-text rounded-0'><i class='fa fa-calendar'></i></div>
                                                    </div>
                                                    <input type="text" name="B_end_time" value="<%=result.getString("end_time")%>" readonly >
                                                    <input type="time" name="new_B_end_time" id="ed_Time" >
                                                </div>
                                            </div>
                                        </div>

                                        <p style="color:black;font-size:20px;text-align:left">Location:</p>
                                        <div class='form-row mb-2'>
                                            <div class='form-group col-lg-12'>
                                                <div class='input-group'>
                                                    <div class='input-group-prepend'>
                                                        <div class='input-group-text rounded-0'><i class='fa fa-building'></i></div>
                                                    </div>
                                                    <select type="text" name="B_location" id="loc" required>
                                                        <option>Choose Location</option>
                                                        <option>H001</option>
                                                        <option>H002</option>
                                                        <option>H003</option>

                                                    </select>
                                                </div>

                                            </div>
                                        </div>
                                        <p style="color:black;font-size:20px;text-align:left">Number of seats:</p>
                                        <div class='form-row mb-2'>
                                            <div class='form-group col-lg-12'>
                                                <div class='input-group'>
                                                    <div class='input-group-prepend'>
                                                        <div class='input-group-text rounded-0'><i class='fa fa-calendar'></i></div>
                                                    </div>
                                                    <input type="number" name="B_seats" value="<%=result.getInt("no_seats")%>" >

                                                </div>
                                            </div>
                                        </div>

                                        
                                      
                                            <td><input type="hidden" name="B_event_ID" value="<%=result.getString("event_ID")%>"></td>
                                            <td><input type="submit" name="submit" value="Update"></td>
                                        </tr>
                                        <% }%>
                                    </table>
                                </form>

                            </div>
                        </div>            
                        <!-- End page content -->
                    </div>
                    <%@ include file="Layouts/Footer.jsp" %>
                    <%@ include file="Layouts/Scripts.jsp" %>
                    </body>
                    </html>         