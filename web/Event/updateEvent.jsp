<%-- 
    Document   : updateEvent
    Created on : Oct 7, 2018, 12:10:56 AM
    Author     : hp
--%>

<%-- 
    Document   : updateEvent
    Created on : Aug 28, 2018, 1:24:37 PM
    Author     : hp
--%>
<%@page import="java.sql.*, Event.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Event</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <%@ include file="Layouts/Styles.jsp" %>

    </head>
    <body class="w3-light-grey">

        <%@ include file="Layouts/Navigation.jsp" %>

        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:300px;margin-top:43px;">

            <div class="row">
                <div class="col-12">



                    <% String event_id = request.getParameter("event_id");
                        ResultSet result = Event.displayThisEvent(event_id);
                    %>

                    <div class="w3-main" style="margin-left:300px;margin-top:43px;">


                        <div class="container-fluid"  style="padding-top:22px">
                            <!-- Breadcrumbs-->
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item">
                                    <a href="Dashboard">Dashboard</a>
                                </li>
                                <li class="breadcrumb-item active">Update Public Event</li>
                            </ol>

                            <div class="container-fluid mb-3 bg-white">
                                <p style="color:black;font-size:50px;text-align:center">Update Public Events</p>
                                <form action="<%=request.getContextPath()%>/UpdateEventServelet" method="post" class="eventForm">
                                    <% while (result.next()) {%>

                                    <p style="color:black;font-size:20px;text-align:left">Event name:</p>    
                                    <div class='form-row mb-2'>
                                        <div class='form-group col-lg-12'>
                                            <div class='input-group'>
                                                <div class='input-group-prepend'>

                                                    <div class='input-group-text rounded-0'><i class='fa fa-calendar-check'></i></div>
                                                </div>
                                                <input type="text" name="event_name" value="<%=result.getString("event_name")%>"id="event" placeholder="Event Name">
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
                                                <textarea input type="text" name="description" id="desc" placeholder="Event Description" ><%=result.getString("description")%></textarea>
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
                                                <select type="text" name="location" id="loc" required>
                                                    <option>Choose Location</option>
                                                    <option>H001</option>
                                                    <option>H002</option>
                                                    <option>H003</option>

                                                </select>
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
                                                <input type="text" name="date" value="<%=result.getString("date")%>" id="start">
                                                <input type="date" name="newDate">
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
                                                <input type="text" name="start_time" value="<%=result.getString("start_time")%>" >
                                                <<input type="time" name="new_start_time" >>
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
                                                <input type="text" name="end_time" value="<%=result.getString("end_time")%>" readonly >
                                                <input type="time" name="new_end_time" >
                                            </div>
                                        </div>
                                    </div>




                                    <div class="row">
                                        <table class="table table-striped">

                                            <tr>
                                                <td><input type="hidden" name="event_ID" value="<%=result.getString("event_ID")%>"></td>
                                                <td><input type="submit" name="submit" value="Update"></td>
                                            </tr>
                                            <% }%>
                                        </table>
                                </form>

                            </div>
                        </div>   
                                        
                        </div>
                        <!-- End page content -->
                    </div>
                </div> 
            </div>
        </div>
                                       
                    <%@ include file="Layouts/Footer.jsp" %>
                    <%@ include file="Layouts/Scripts.jsp" %>
                    </body>
                    </html>       