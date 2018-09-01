<%-- 
    Document   : deleteBookedEvent
    Created on : Aug 31, 2018, 2:10:10 PM
    Author     : hp
--%>

<%@page import="java.sql.*, Event.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>Event</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="Layouts/Styles.jsp" %>


<body class="w3-light-grey">
 
<%@ include file="Layouts/Navigation.jsp" %>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">

    <div class="row">
          <div class="col-12">
              
              <p style="color:black;font-size:50px;text-align:center">Update Public Event</p>
              <%  String event_id = request.getParameter("event_id");
              
                  if (Booked_Event.isDeleted(event_id)) {
                      response.sendRedirect("eventListB.jsp");
                  }
                  else {
                      out.println("Error");
                  }
                      %>
        
              
              
     <!-- End page content -->
          </div>
</div>
</div>
<%@ include file="Layouts/Footer.jsp" %>
<%@ include file="Layouts/Scripts.jsp" %>
</body>
</html>       