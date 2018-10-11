<%-- 
    Document   : deleteapp
    Created on : Aug 2, 2018, 3:26:29 PM
    Author     : Sohan
--%>

<%@page import="menu.MenuItems"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu - Delete item</title>
        <%@ include file="Layouts/Styles.jsp" %>
    </head>
    <body>
        <div class="d-flex align-content-center align-items-center justify-content-center" style="height:100vh">
            <%
                try {
                    int id = Integer.parseInt(request.getParameter("id"));
                    if (MenuItems.isDeleted(id)) {
            %>
            <div class="alert alert-info">
                <h2>The item has been removed!</h2> 
                <a class="btn btn-sm btn-primary" href="menu.jsp">Return to menu</a>
            </div>
            <% } else {
            %>
            <div class="alert alert-danger">
                <h2>The item cannot be removed!</h2> 
                <a class="btn btn-sm btn-danger" href="menu.jsp">Return to menu</a>
            </div>
            <%
                }
            } catch (Exception e) {
            %>
            <div class="alert alert-danger">
                <h2>The item cannot be removed! <b><%= e%></b></h2> 
                <a class="btn btn-sm btn-danger" href="menu.jsp">Return to menu</a>
            </div>
            <%
                }
            %>
        </div>
    </body>
</html>
