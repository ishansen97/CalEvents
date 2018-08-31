<%-- 
    Document   : showCreateMenu
    Created on : Aug 31, 2018, 10:33:09 AM
    Author     : Sohan
--%>

<%@page import="menu.EventMenu,java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
    th, td {
        padding: 40px;
        
    }
</style>
        <title> Created Menu </title>
    <meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%@ include file="Layouts/Styles.jsp" %>


<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
  <style>
  .fakeimg {
      height: 200px;
      background: #aaa;
  }
  </style>



<body class="w3-light-grey">
 
<%@ include file="Layouts/Navigation.jsp" %>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">
<!--    <a href="Appertizer.jsp" class="btn btn-danger">Add new Appertizer</a>-->
    
    <% ResultSet res = EventMenu.getCreateMenu(); %>
    <table>
        <tr>
            <th> Created Menu ID </th>
            <th> Appetizer </th>
            <th> Main-Dish </th>
            <th> Desert </th>
            <th> Refreshment </th>
        </tr>
        <tr>
            <% while (res.next()) { %>
            <td><%=res.getString("create_menu_id") %></td>
            <td><%=res.getString("appetizer") %></td>
            <td><%=res.getString("main_dish") %></td>
            <td><%=res.getString("deserts") %></td>
            <td><%=res.getString("refreshments") %></td>
            
            <!--<td><a href="deleteCreateMenu.jsp?CM_id=<%=res.getString("create_menu_id") %>" class="btn btn-danger">Delete</a></td>-->
        </tr>
        <% } %>
    </table>
    
    <!-- Type your code Here -->

    <%@ include file="Layouts/Footer.jsp" %>
<!-- End page content -->
</div>

<%@ include file="Layouts/Scripts.jsp" %>
</body>