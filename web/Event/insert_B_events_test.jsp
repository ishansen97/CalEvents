<%-- 
    Document   : insert_B_events_test
    Created on : Sep 13, 2018, 7:01:04 PM
    Author     : hp
--%>
<%@page import="java.sql.*, Event.*" %>
<!DOCTYPE html>
<html>
    <title>Event</title>
    <meta charset="UTF-8">
    <meta    name="viewport" content="width=device-width, initial-scale=1">
    <script class="jsbin" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>



    <script>
        function date_validate() {
            var date = document.getElementById("start").value;
//            var time1 = document.getElementById("start_time").value;
//            var time2 = document.getElementById("end_time").value;

            var ev_date = new Date(date);
            var cur_date = new Date();
//            var start_time = new Date(time1);
//            var end_time = new Date(time2);

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
//            var date = document.getElementById("start").value;
            var date = document.getElementById("start").value;
        var time1 = document.getElementById("start_time").value;
        var time2 = document.getElementById("end_time").value;
        
        var strtime1 = time1.toString();
        var strtime2 = time2.toString();
        
        var start_arr = strtime1.split(":");
        
        var ev_date = new Date(date);
        var cur_date = new Date();
        var start_time = new Date(time1);
        var end_time = new Date(time2);
        
         if(time1 > time2) {
            alert("start time should be less than end time");
            return false;
        }
        else {
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
            //        alert(date_validation);

            // return false;

            //return time_validation && date_validation;
        }

//        function eventChange() {
//            var event = document.getElementById("start_time").value;
//            var min = document.getElementById("start_time").attributes["min"].value;
//
//            if (event < min) {
//                document.getElementById("demo").innerHTML = "<span><font color=red>Enter a time after " + min + "</font></span>";
//            } else {
//                document.getElementById("demo").innerHTML = "<span><font color=green>valid time</font></span>";
//            }
//
//
//        }

        //    $(document).ready(function() {
        //        $("#start").change(function() {
        //            var location = $("#loc").val();
        //            var date = $(this).val();
        //            alert(date);
        //            
        //            $.post("<%=request.getContextPath()%>/CheckAvailability", {location : location, date : date}, function(data) {
        //                $("#isAvailable").html(data);)
        //            });
        //        });
        //     });

        function display() {
            var date = document.getElementById("start").value;
            var location = document.getElementById("loc").value;
            location = location.toString();
            date = date.toString();
            alert("date : " + date);
            alert("location : " + location);

            $.post("CheckAvailability.jsp", {location: location, date: date}, function (data) {
                $("#display_start").html(data);
                //document.getElementById("start_time").attributes["min"].value = <%--=start_time --%>
            });
        }

        function checkStartTime() {
            var start = document.getElementById("start_time").value;
            var date = document.getElementById("start").value;
            var location = document.getElementById("loc").value;

            $.post("CheckAvailability.jsp", {start_time: start, date: date, location: location}, function (data) {
                $("#display_start").html(data);
            });
        }

//        function checkTimeAvailable() {
//            var location = document.getElementById("loc").value;
//            var date = document.getElementById("start").value;
//            var start = document.getElementById("start_time").value;
//            var end = document.getElementById("end_time").value;
//
//            $.post("<%=request.getContextPath()%>/CheckAvailability", {loc: location, date: date, start: start, end: end}, function (data) {
//                alert(data);
//            });
//        }
    </script>

    <style>
        .formField
        {
            width:200%;
            height:auto;
        }

        .formField input[type=text],.formField input[type=time],.formField input[type=date]
        {
            width:100%;
            margin:2px;
            border-radius:10px;
            outline:none;
            font-size:18px;
            font-family: Calibri;
            border:1px solid black;
            padding:5px;
            background: transparent;
        }
        .formField input[type=submit]
        {
            margin-left: 100%;
            width:50%;
            font-size:18px;
            padding:5px;
            border:2px solid dimgrey;
            background: whitesmoke;
            outline:none;
            border-radius:5px;
            font-family: Calibri;
            margin:5px;
            color:dimgray;
            transition-duration: 0.5s;
        }

        .formField input[type=submit]:hover
        {
            background: dimgray;
            color:white;
            border-radius:10px;
        }
    </style>

    <%@ include file="Layouts/Styles.jsp" %>

    <body class="w3-light-grey">

        <%@ include file="Layouts/Navigation.jsp" %>

        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:300px;margin-top:43px;">


            <div class="container-fluid"  style="padding-top:22px">
                <!-- Breadcrumbs-->
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <a href="Dashboard">Dashboard</a>
                    </li>
                    <li class="breadcrumb-item active">New booked Event</li>
                </ol>

                <div class="container-fluid mb-3 bg-white">
                    <p style="color:black;font-size:50px;text-align:center">Insert Booked Events</p>
                    <form action="<%=request.getContextPath()%>/MyServletBook" method="post" onsubmit="return validation()">

                        <%  try { //do modifications later

                                String id = "";
                                if (id != null) {
                                    String next_time = null;
                                    //                        ResultSet result = Event.Next_start_time();
                                    //                        if (result.next()) {
                                    //                            next_time = result.getString("Next_start_time");
                                    //                        }
                        %>

                        <div class="row">

                            <div class="col-md-6 px-5 pb-5">
                                <% request.setAttribute("start_time", "00:00");
                                    String start_time = request.getAttribute("start_time").toString();%>



                                <p style="color:black;font-size:20px;text-align:left">Event name:</p>    
                                <div class='form-row mb-2'>
                                    <div class='form-group col-lg-12'>
                                        <div class='input-group'>
                                            <div class='input-group-prepend'>

                                                <div class='input-group-text rounded-0'><i class='fa fa-calendar-check'></i></div>
                                            </div>
                                            <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg'  name="B_eventName" id="event" placeholder="Event Name" required>
                                        </div>
                                    </div>
                                </div> 

                                <p style="color:black;font-size:20px;text-align:left">Event Description:</p>
                                <div class='form-row mb-2'>
                                    <div class='form-group col-lg-12'>
                                        <div class='input-group'>
                                            <div class='input-group-prepend'>
                                                <div class='input-group-text rounded-0'><i class='fa fa-list-alt'></i></div>
                                            </div>
                                            <textarea rows="4" class='form-control rounded-0 border border-left-0 form-control-lg' name="B_description" id="desc" placeholder="Event Description" required></textarea>
                                        </div>
                                    </div>
                                </div>  
                                
                                                                <p style="color:black;font-size:20px;text-align:left">Category:</p>
                                <div class='form-row mb-2'>
                                    <div class='form-group col-lg-12'>
                                        <div class='input-group'>
                                            <div class='input-group-prepend'>
                                                <div class='input-group-text rounded-0'><i class='fa fa-building'></i></div>
                                            </div>
                                            <select class="form-control border border-left-0 form-control-lg rounded-0" name="B_category" id="loc">
                                                <option>Choose Category</option>
                                                <option>Musical show</option>
                                                <option>Entertainment</option>
                                                <option>other</option>

                                            </select>
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
                                            <select class="form-control border border-left-0 form-control-lg rounded-0" name="B_location" id="loc">
                                                <option>Choose Location</option>
                                                <option>H001</option>
                                                <option>H002</option>
                                                <option>H003</option>

                                            </select>
                                        </div>
                                    </div>
                                </div> 

                                <p style="color:black;font-size:20px;text-align:left">Date:</p>
                                <div class='form-row mb-2'>
                                    <div class='form-group col-lg-12'>
                                        <div class='input-group'>
                                            <div class='input-group-prepend'>
                                                <div class='input-group-text rounded-0'><i class='fa fa-calendar'></i></div>
                                            </div>
                                            <input type='date' class='form-control rounded-0 border border-left-0 form-control-lg' name="B_start" id="start" placeholder="Date" onchange="display()" required>
                                            <p id="isAvailable"></p>
                                        </div>
                                    </div>
                                </div>

                                <div class='form-row mb-2'>
                                    <div class='form-group col-lg-6'>
                                        <label style="color:black;font-size:20px;text-align:left">Start Time: </label> 
                                        <div class='input-group'>
                                            <div class='input-group-prepend'>
                                                <div class='input-group-text rounded-0'><i class='fa fa-clock'></i></div>
                                            </div>
                                            <input type='time' min="00:00" max="23:59" class='form-control rounded-0 border border-left-0 form-control-lg' name="B_start_time" id="B_s_time" placeholder="Start Time" onchange="checkStartTime()" required>
                                        </div>
                                    </div>

                                    <div class='form-group col-lg-6'>
                                        <label style="color:black;font-size:20px;text-align:left">End Time: </label> 
                                        <input type='time' class='form-control rounded-0 form-control-lg' name="B_end_time" id="B_e_time" placeholder="End Time" required>
                                        <%--<a onclick="checkTimeAvailable()">
                                            Check Time
                                        </a>--%>
                                    </div>  
                                </div>
                                    
                                <p style="color:black;font-size:20px;text-align:left">Seat Allocation:</p>
                                <div class='form-row mb-2'>
                                    <div class='form-group col-lg-12'>
                                        <div class='input-group'>
                                            <div class='input-group-prepend'>
                                                <div class='input-group-text rounded-0'><i class='fa fa-flag-checkered'></i></div>
                                            </div>
                                            <input type='number' class='form-control rounded-0 border border-left-0 form-control-lg' name="seats" min="1" max="500" placeholder="Seat allocation" required>
                                            <p id="isAvailable"></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row mb-2">
                                    <div class="col-12">
                                        <div id="display_start"></div>
                                    </div>    
                                </div>

                                <div class="row">
                                    <!--<div class="col-md-6"></div>-->
                                    <div class="col-12 align-content-center"><button type="submit" style="margin: auto" name="action" value="add_employee" class="btn btn-lg btn-outline-success rounded-0 mt-4">Add booked event</button>
                                    </div>
                                </div>


                            </div>

                            <div class="col-md-6 text-center pb-5 bg-light">

                                <%@page import="com.dhtmlx.planner.extensions.DHXExtension" %>
                                <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
                                <%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
                                <div id="planner" class="planner"><%=getPlanner(request)%></div>
                                <%@page import="com.dhtmlx.planner.*,com.dhtmlx.planner.data.*,java.util.Date" %>
                                <%! String getPlanner(HttpServletRequest request) throws Exception {
                                        DHXPlanner p1 = new DHXPlanner("./codebase/", DHXSkin.TERRACE);
                                        p1.setWidth(500);
                                        p1.setInitialDate(new Date());
                                        p1.calendars.attachMiniCalendar();
                                        p1.load("events.jsp", DHXDataFormat.JSON);
                                        p1.data.dataprocessor.setURL("events.jsp");

                                        return p1.render();
                                    }
                                %>
                                <!--                                <script class="jsbin" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
                                                                <div class="file-upload">
                                
                                                                    <div class="image-upload-wrap px-5">
                                                                        <input class="file-upload-input" onchange="readURL(this);" type="file" name="avatar" size="4000000" accept="image/x-png,image/jpg,image/jpeg">
                                                                        <div class="drag-text py-5">
                                                                            <img src="../External/images/event.jpg" alt="avatar" class="img-fluid pb-5" style="max-height: 400px">
                                                                            <h3>choose avatar to upload</h3>
                                                                            <h3>Or</h3>
                                                                            <h3>Drag and drop</h3>
                                                                        </div>
                                                                    </div>
                                                                    <div class="file-upload-content">
                                                                        <img class="file-upload-image" alt="your image">
                                                                        <div class="image-title-wrap">
                                                                            <button type="button" onclick="removeUpload()" class="remove-image">Remove Image</button>
                                                                        </div>
                                                                    </div>
                                                                </div>-->
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6"></div>
                            <div class="col-md-6 bg-light py-2"></div>
                        </div>

                    </form>
                </div> 
            </div>
            <%  }
                } catch (Exception ex) {
                    out.println("exception occcured");
                }
            %>

            <!-- End page content 
            
            <%@ include file="Layouts/Footer.jsp" %>
            <%@ include file="Layouts/Scripts.jsp" %>
            </body>
            </html>
                 