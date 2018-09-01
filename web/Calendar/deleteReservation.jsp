<%-- 
    Document   : deleteReservation
    Created on : Aug 4, 2018, 7:37:49 PM
    Author     : DELL
--%>

<%@page import="reservation.Reservation" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% String res_id = request.getParameter("id");
           String customer_id = session.getAttribute("customer_id").toString();
        
           if (Reservation.isDeleted(res_id)) {
               response.sendRedirect("handleReservation.jsp?customer_id=" + customer_id);
        %>
        
        <script>
            alert("You record has been deleted successfully");
        </script>
        
        
        <% } else { 
            out.println("cannot be deleted");
        }
        %>
           
    </body>
</html>
