<%-- 
    Document   : deleterefresh
    Created on : Aug 5, 2018, 9:49:58 PM
    Author     : Sohan
--%>

<%@page import="menu.Refreshments"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <% String id = request.getParameter("ref_id");
           
           if (Refreshments.isDeleted(id)) {
        %>
        <script>
            alert("Your record has been successfully deleted");
        </script>
        <%@include file="/Menu/UpdateRefreshments.jsp" %> 
        <% }else
            out.println("sorry your record cannot be deleted");
        %>
    </body>
</html>
