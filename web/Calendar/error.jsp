<%-- 
    Document   : error
    Created on : Jul 15, 2018, 6:16:19 PM
    Author     : DELL
--%>

<%@page import="reservation.ErrorHandling" %> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
           String message = ErrorHandling.showMessage();
        %>
        
        <p><%=message %></p>
           
    </body>
</html>
