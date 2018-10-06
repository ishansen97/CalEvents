<%@page import="com.dhtmlx.planner.extensions.DHXExtension"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : calendar
    Created on : Jul 7, 2018, 4:58:16 PM
    Author     : DELL
--%>
<%@page import="java.sql.*,reservation.EventViewer" %>


<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
<!--        <link href="../External/Bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../External/Bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>-->

        <%@include file="./Layouts/Styles.jsp" %>
        <%@include file="./Layouts/Scripts.jsp" %>
        <style>
            body{
                overflow-x: hidden;
            }
            .card {
                font-size: 20px;
            }
            .card:hover {
                color: white;
                background-color: lightgrey;
            }
        </style>
    </head>
    <body>
        <div class="row">
        <!--<div id="container" class="col-lg-9 d-none d-md-block pl-4 bg-dark">-->
            <div id="content-container">

                <div id="planner" class="planner"><%=getPlanner(request) %></div>
                <%@ page import="com.dhtmlx.planner.*,com.dhtmlx.planner.data.*,java.util.Date"%>
                <%! String getPlanner(HttpServletRequest request) throws Exception {
                        DHXPlanner pl = new DHXPlanner("./codebase/", DHXSkin.TERRACE);
                        pl.setWidth(1100);
                        pl.setInitialDate(new Date()); 
                        pl.calendars.attachMiniCalendar();
                        pl.load("events.jsp", DHXDataFormat.JSON);
                        pl.data.dataprocessor.setURL("events.jsp");

                        return pl.render();
                } 
                %>
            </div>
        <!--</div>-->
            <%
                   ResultSet res = EventViewer.getEventView();
                   int i = 1;
            %>
            <div class="col bg-primary">
                <div id="eventList" class="col" style="border: 1px solid black; margin: auto; background-color: white">
                    <h1>Upcoming Events</h1>
                    <%while (res.next()) { %>
                    <div id="e" class="card">
                        <div class="card-header">
                            <h1 class="modal-title">#<%=i %></h1>
                        </div>
                        <div class="card-body">
                            <a href="event_reservation.jsp?id=<%=res.getString("event_ID") %>"><%=res.getString("event_name") %></a>
                            <p><%=res.getString("date") %></p>
                        </div>
                    </div>
                    <% i++; %>    
                    <% } %>
                    <div id="view_more">
                        <center><a href="event_reservation.jsp?id=E006">View more</a><center>
                    </div>
                    <!--<div id="e1">
                        <a href="test.jsp">Event 2</a>
                        <p>Exhibition</p>
                    </div>
                    <div id="e2">
                        <a href="test.jsp">Event 3</a>
                        <p>Booking Event</p>
                    </div>
                    <div id="e3">
                        <a href="test.jsp">Event 4</a>
                        <p>private Event</p>
                    </div>
                    <div id="e4">
                        <a href="test.jsp">Event 5</a>
                        <p>Workshop</p>
                    </div>
                    <div id="e5">
                        <a href="test.jsp">Event 6</a>
                        <p>Exhibition</p>
                    </div>
                    <div id="e6">
                        <a href="test.jsp">Event 7</a>
                        <p>Bridal show</p>
                    </div>-->
                </div>
            </div>    
        </div>
            
            <!--JQuery libraries -->
            <script src="Bootstrap/js/bootstrap.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
            <script src="Bootstrap/js/bootstrap.js"></script>
    </body>
    
</html>
