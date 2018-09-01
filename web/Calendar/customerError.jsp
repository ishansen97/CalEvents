<%-- 
    Document   : customerError
    Created on : Sep 1, 2018, 6:11:32 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <script>
            alert("something wrong with the customer details.Please try again later");
        </script>
        
        <% String event_id = session.getAttribute("event_id").toString();
           String url = "test.jsp?id=" +event_id;
           response.sendRedirect(url);
        %>
    </body>
</html>
