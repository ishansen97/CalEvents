<%-- 
    Document   : deleteCreateMenu
    Created on : Aug 31, 2018, 10:39:53 AM
    Author     : Sohan
--%>

<%@page import="menu.EventMenu" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete</title>
    </head>
    <body>
        
        
        <% String id = request.getParameter("CM_id");
           
           if (EventMenu.isDeleted(id)) {
        %>
        <script>
            alert("Your record has been successfully deleted");
        </script>
        <%@include file="/Menu/showCreateMenu.jsp" %> 
        <% }else
            out.println("sorry your record cannot be deleted");
        %>
        
        
    </body>
</html>
