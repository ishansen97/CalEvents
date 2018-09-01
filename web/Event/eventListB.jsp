<%-- 
    Document   : eventListB
    Created on : Aug 30, 2018, 12:20:05 PM
    Author     : hp
--%>
<%@include file="dbconfig.jsp" %>
<%@page import="java.sql.*,Event.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>Event</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="Layouts/Styles.jsp" %>
<%@ include file="Layouts/Scripts.jsp" %>
<style>
    th,td {
        padding : 10px;
    }
</style>

<body class="w3-light-grey">
    <script>
        $(document).ready(function() {
            $("a.btn-danger").click(function() {
               var response = confirm("Do you want to delete");
               if (response === false) {
                   return false;
               }
               else {
                   return true;
               }
            });
        });
    </script>
 

    
 
<%@ include file="Layouts/Navigation.jsp" %>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">

    <div class="row">
          <div class="col-12">
              
              <p style="color:black;font-size:50px;text-align:center">Booked Event List</p>
              
              <% ResultSet result = Booked_Event.getBookedEventDetails();
              %>
              <table class="table table-striped">
                  <tr>
                      <th>Event ID</th>
                      <th>Event Name</th>
                      <th>Category</th>
                      <th>Description</th>
                      <th>Date</th>
                      <th>Start Time</th>
                      <th>End Time</th>
                      <th>Location ID</th>
                      <th>Number of seats</th>
                  </tr>
                  <% while (result.next()) { %>
                  <tr>
                      <td><%=result.getString("event_ID")%></td>
                      <td><%=result.getString("event_Name")%></td>
                      <td><%=result.getString("Category")%></td>
                      <td><%=result.getString("description")%></td>
                      <td><%=result.getString("Date")%></td>
                      <td><%=result.getString("start_time")%></td>
                      <td><%=result.getString("end_time")%></td>
                      <td><%=result.getString("location_id")%></td>
                      <td><%=result.getString("no_seats")%></td>
                      <td><a href="updateBookedEvent.jsp?event_id=<%=result.getString("event_ID") %>" class="btn btn-success">Update</a></td>
                      <td><a href="deleteBookedEvent.jsp?event_id=<%=result.getString("event_ID") %>" class="btn btn-danger">Delete</a></td>
                      <td></td>
                  </tr>
                  <%}%>
              </table>
          </div>
    </div>
</div>
                
<%@ include file="Layouts/Footer.jsp" %>
<%@ include file="Layouts/Scripts.jsp" %>
</body>
</html>