<%-- 
    Document   : eventListRequest
    Created on : Sep 6, 2018, 3:17:34 PM
    Author     : hp
--%>
<%@page import="java.text.SimpleDateFormat"%>
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
<div class="w3-main" style="margin-left:300px;margin-top:43px;">

    <div class="row">
          <div class="col-12">
              
              <p style="color:black;font-size:50px;text-align:center">Private Event List</p>
        <div class="col-4">
            <form action="" method="POST" class="form-group">
                <input type="text" name="searchPEvent" class="form-group" placeholder="search here">
                <button type="submit" class="btn btn-primary">Search</button>
            </form>
        </div>
              
              <% //ResultSet result = Event.getEventDetails();
                 String searchText = null; 
                 searchText = request.getParameter("searchPEvent");
                 
                 ResultSet result = null;
                 
                 if (searchText == null) {
                     result = Private_event.getEventDetails();
                 }
                 else {
                     result = Private_event.searchPrivateEvents(searchText);
                 }
                 
                 
              %>
              <% 
                  SimpleDateFormat datefmt = new SimpleDateFormat("EEE, MMM d ''yy");
                  SimpleDateFormat timefmt = new SimpleDateFormat("HH:mm");
                  ResultSet result1 = Private_event.getEventDetails();
              %>
                <table class="table table-striped">
                    <thead class="thead-dark">
                    <tr>
                        <th>Customer Details</th>
                        <th>Event Details</th>
                        <th>Date and Time</th>
                        <th>crowd expected</th>
                        <th colspan="2"></th>
                    </tr>
                    </thead>
                    <% while (result.next()) { %>
                    <tr>
                        
                        <td>
                            <b><%=result.getString("Customer_name") %></b> <br>
                            <i><%=result.getString("phone_number") %></i> <br>
                            <i><%=result.getString("email") %></i>
                        </td>
                        <td>
                            <%=result.getString("event_Name") %> @ <%=result.getString("location_ID") %> <br>
                            <i>Expected no. of Guests: <%=result.getString("Crowd_expected") %></i>
                        </td>
                        <td>
                            <%=datefmt.format(result.getDate("date")) %> from
                            <%=timefmt.format(result.getTime("start_time")) %> to <%=timefmt.format(result.getTime("end_time")) %>
                        </td>
                        <td>
                            <form method="post" action="<%=request.getContextPath()%>/getEmailServlet">
                                <input type="text" hidden name="eventid"  value="<%=result.getString("event_ID")%>">
                                <input type="submit" value="Confirm" class="btn btn-success">
                            </form>
                        </td>
                        <td>
                            <form method="post" action="<%=request.getContextPath()%>/rejectMail">
                                <input type="text" hidden name="eventid"  value="<%=result.getString("event_ID")%>">
                                <input type="submit" value="Reject" class="btn btn-danger">
                            </form>
                        </td>
                        <!--<td><a href="deleteRequest.jsp?event_id= class="btn btn-danger">Reject</a></td>-->
                    </tr>
                    <% } %>
                </table>
              
          </div>
    </div>
              
     <!-- End page content -->
</div>
<%@ include file="Layouts/Footer.jsp" %>

</body>
</html>         
