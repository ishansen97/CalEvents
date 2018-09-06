<%-- 
    Document   : deleteFacility
    Created on : Sep 1, 2018, 11:54:24 AM
    Author     : Lini Eisha
--%>

<%@page import="event.facilities.Tents"%>
<%@page import="event.facilities.Facility"%>
<%@page import="event.facilities.Facility"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Faciities</title>

    </head>
    <body>
              <%  String f_ID = request.getParameter("event_id");
                  Facility tent = new Tents();
                  if (tent.remove_Facility(f_ID)) {
                      response.sendRedirect("delete.jsp");
                  }
                  else {
                      out.println("Error");
                  }
                      %>
        
              
           
    </body>
</html>
