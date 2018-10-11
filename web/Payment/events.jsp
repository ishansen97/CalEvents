<%@page import="java.util.ArrayList"%>
<%@page import="com.payment.example.EventDetails"%>
<%@page import="com.payment.example.Expenses"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Events</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@ include file="Layouts/Styles.jsp" %>
    <link href="Layouts/events.css" rel="stylesheet" type="text/css"/>
    <script src="scripts/Chart.bundle.min.js" type="text/javascript"></script>
  </head>
  <body class="w3-light-grey">
    <%@ include file="Layouts/Navigation.jsp" %>
    <!-- !PAGE CONTENT! -->
    <div class="w3-main" style="margin-left:300px;margin-top:43px;">
      <br>
      <%
          /*
          EventDetails[] events = {
              new EventDetails("Event 1", new Date(118, 9, 1), EventDetails.STATUS_OPEN, 10, 50, 10.00, new Expenses(10.0, 30.0)),
              new EventDetails("Event 2", new Date(118, 9, 10), EventDetails.STATUS_OPEN, 9, 30, 5.00, new Expenses(51.0, 61.0)),
              new EventDetails("Event 3", new Date(118, 9, 11), EventDetails.STATUS_OPEN, 100, 100, 5.99, new Expenses(20.0, 65.0)),
              new EventDetails("Event 4", new Date(118, 8, 11), EventDetails.STATUS_CLOSED, 50, 60, 2.99, new Expenses(65.0, 15.0)),
              new EventDetails("Event 5", new Date(118, 12, 11), EventDetails.STATUS_OPEN, 180, 200, 10.99, new Expenses(100.0, 150.0)),
              new EventDetails("Event 5", new Date(118, 12, 11), EventDetails.STATUS_CLOSED, 2, 3, 50.99, new Expenses(300.0, 200.0)),
          };*/

          ArrayList<EventDetails> events = EventDetails.getEventDetails();

          try {
      %>
      <br>
      <div class="container">
        <div>
          <h2>Events</h2>
          <hr>
        </div>
        <div class="card">
          <div class="card-header">Details</div>
          <div class="card-body" style="padding:0">
            <table class="table">
              <thead>
                <tr>
                  <th class="event-details" width="60%">Event</th>
                  <th class="event-statistics" width="30%">Reservations</th>
                  <th class="event-income">Income</th>
                  <th></th>
                </tr>
              </thead>
              <% for (EventDetails event : events) {%>
              <tr class="event event--<%= event.getStatusClass()%>">
                <td class="event-details">
                  <div class="event-name"><span href="" class="event-text"><span style="opacity:0.8; text-transform: uppercase"><%= event.getId()%> - </span> <%= event.getName()%></span></div>
                  <div class="event-date d-flex justify-content-between">
                    <span class="text-muted"><%= event.getDate()%></span>
                    <small class="text-muted">Ticket Price: <b><%=event.getPrice()%></b></small>
                  </div>
                </td>
                <td class="event-statistics">
                  <div class="event-stats">
                    <span class="event-status"><i class="fa fa-circle"></i> <%= event.getStatus()%></span>
                    <span class="event-booked text-muted">
                      <span class="event-text"><%= event.getBooked()%></span>/<%= event.getTotal()%>
                    </span>
                  </div>
                  <div class="progress" title="<%= event.getBookedTitle() %>">
                    <div class="progress-bar event-progress" role="progressbar" style="width: <%= event.getPercentage() %>%"></div>
                  </div>
                </td>
                <td class="event-income text-success"><%= event.getIncome()%></td>
                <td><a class="event-button btn btn-sm btn-outline-secondary " href="payments.jsp?event=<%= event.getName()%>">Details</a></td>
              </tr>
              <!-- EVENT DETAILS -->
              <%--
              <tr class="event event-details" style="display:none">
                <td colspan="2">

                </td>
                <td colspan="6">
                  <div class="d-flex">
                    <div class="font-weight-bold pr-4">Expenses: </div>
                    <div>
                      <div class="pb-2 border-bottom">
                        <div><b class="text-secondary">Facility: </b><%= event.expenses.getFacility()%></div>
                        <div class="ml-3 text-muted text-right">
                          ...
                          <br>
                          ...
                          <br>
                        </div>
                      </div>
                      <div class="pt-2">
                        <div><b class="text-secondary">Kitchen: </b><%= event.expenses.getKitchen()%></div>
                        <div class="ml-3 text-muted text-right">
                          ...
                          <br>
                          ...
                          <br>
                        </div>
                      </div>
                    </div>
                  </div>
                </td>
              </tr>
              --%>
              <% } %>
            </table>
          </div>
        </div>
      </div>
      <% } catch (Exception e) {
              e.printStackTrace();
              out.println(e);
          }%>
      <br>
      <%@ include file="Layouts/Footer.jsp" %>
      <%@ include file="Layouts/Scripts.jsp" %>
      <script type="text/javascript">
        $(function () {
          $('.event-button').on('click', function () {
            $(this).closest('.event').next('.event-details').toggle();
          });
        });
      </script>
  </body>
</html>