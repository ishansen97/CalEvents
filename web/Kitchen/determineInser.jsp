<%-- 
    Document   : determineInser
    Created on : Oct 7, 2018, 11:21:53 AM
    Author     : Lini Eisha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            String quantity = request.getParameter("val").toString();
                
        %>
        
        <h1><%=quantity%></h1>
    </body>
</html>
