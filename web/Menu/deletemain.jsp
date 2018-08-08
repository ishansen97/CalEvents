<%-- 
    Document   : deletemain
    Created on : Aug 5, 2018, 1:58:53 PM
    Author     : Sohan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
                <% String id = request.getParameter("main_id");
           
           if (MainDish.isDeleted(id)) {
        %>
        <script>
            alert("Your record has been successfully deleted");
        </script>
        <%@include file="/Menu/UpdateMainDish.jsp" %> 
        <% }else
            out.println("sorry your record cannot be deleted");
        %>
    </body>
</html>
