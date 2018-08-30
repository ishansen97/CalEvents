<%-- 
    Document   : UpdateAppertizer
    Created on : Aug 2, 2018, 1:10:18 PM
    Author     : Sohan
--%>
<%@page import="menu.Appertizer,java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
    th,td {
        padding: 40px;
    }
</style>

<title>Update</title>
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
    <a href="Appertizer.jsp" class="btn btn-danger">Add new Appertizer</a>
    
    <% ResultSet res = Appertizer.getApperizer(); %>
    <table>
        <tr>
            <th>Appertizer Name </th>
            <th>Ingredients </th>
            <th>Price(in $) </th>
        </tr>
        <tr>
            <% while (res.next()) { %>
            <td><%=res.getString("A_name") %></td>
            <td><%=res.getString("Ingredient") %></td>
            <td><%=res.getString("Price") %></td>
            <td><a href="editapp.jsp?app_id=<%=res.getString("A_id") %>" class="btn btn-success">Edit</a></td>
            <td><a href="deleteapp.jsp?app_id=<%=res.getString("A_id") %>" class="btn btn-danger">Delete</a></td>
        </tr>
        <% } %>
    </table>
    
    <!-- Type your code Here -->

    <%@ include file="Layouts/Footer.jsp" %>
<!-- End page content -->
</div>

<%@ include file="Layouts/Scripts.jsp" %>
</body>
