<%-- 
    Document   : deleteapp
    Created on : Aug 2, 2018, 3:26:29 PM
    Author     : Sohan
--%>

<%@page import="menu.Appertizer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <% String id = request.getParameter("app_id");
           
           if (Appertizer.isDeleted(id)) {
        %>
        <script>
            alert("Your record has been successfully deleted");
        </script>
        <%@include file="/Menu/UpdateAppertizer.jsp" %> 
        <% }else
            out.println("sorry your record cannot be deleted");
        %>
    </body>
</html>
