<%-- 
    Document   : eventListP
    Created on : Aug 28, 2018, 10:53:50 AM
    Author     : hp
--%>
<%@include file="dbconfig.jsp" %>
<%@page import="java.sql.*, Event.*" %>
<!DOCTYPE html>
<html>
<title>Event</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="Layouts/Styles.jsp" %>
<%@ include file="Layouts/Scripts.jsp" %>
<style>
    th,td {
        padding : 20px;
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
<div class="w3-main" style="margin-left:300px; margin-top: 43px">

    <div class="container-fluid bg-white mx-3">
        <div class="row mt-5">
            <div class="col-8">
                <p style="color:black;font-size:50px;text-align:center">Public Event List</p>
            </div>
            <div class="col-4">
                <form action="" method="POST" class="form-group">
                    <input type="text" name="searchPEvent" class="form-group" placeholder="search here">
                    <button type="submit" class="btn btn-primary">Search</button>
                </form>
            </div>
        </div>
              
              <% //ResultSet result = Event.getEventDetails();
                 String searchText = null; 
                 searchText = request.getParameter("searchPEvent");
                 
                 ResultSet result = null;
                 
                 if (searchText == null) {
                     result = Event.getEventDetails();
                 }
                 else {
                     result = Event.searchPublicEvents(searchText);
                 }
                 
                 
              %>
         
          <div class="row">
              <div class="col">
                <table class="table table-striped">
                    <tr>
                        <th>Event ID</th>
                        <th>Event Name</th>
                        <th>Location ID</th>
                        <th>Description</th>
                        <th>Date</th>
                        <th>Start time</th>
                        <th>End time</th>
                    </tr>
                    <% while (result.next()) { %>
                    <tr>
                        <td><%=result.getString("event_ID") %></td>
                        <td><%=result.getString("event_name") %></td>
                        <td><%=result.getString("location_ID") %></td>
                        <td><%=result.getString("description") %></td>
                        <td><%=result.getString("date") %></td>
                        <td><%=result.getString("start_time") %></td>
                        <td><%=result.getString("end_time") %></td>
                        <td><a href="updateEvent.jsp?event_id=<%=result.getString("event_ID") %>" class="btn btn-success">Update</a></td>
                        <td><a href="deleteEvent.jsp?event_id=<%=result.getString("event_ID") %>" class="btn btn-danger">Delete</a></td>
                    </tr>
                    <% } %>
                </table>
              </div>
              
          </div>
    </div>

</div>
              
     <!-- End page content -->
<!--</div>-->
<%@ include file="Layouts/Footer.jsp" %>

</body>
</html>         
