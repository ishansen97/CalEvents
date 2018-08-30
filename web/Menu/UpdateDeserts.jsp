<%-- 
    Document   : UpdateDeserts
    Created on : Aug 5, 2018, 3:30:42 PM
    Author     : Sohan
--%>
<%@page import="menu.Deserts,java.sql.*" %>
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
    <a href="Deserts.jsp" class="btn btn-danger">Add new Deserts</a>
    
    <% ResultSet res = Deserts.getDeserts(); %>
    <table>
        <tr>
            <th>Desert Name </th>
            <th>Ingredients </th>
            <th>Price(in $) </th>
        </tr>
        <tr>
            <% while (res.next()) { %>
            <td><%=res.getString("D_name") %></td>
            <td><%=res.getString("Ingredient") %></td>
            <td><%=res.getString("Price") %></td>
            <td><a href="editdes.jsp?des_id=<%=res.getString("D_id") %>" class="btn btn-success">Edit</a></td>
            <td><a href="deletedes.jsp?des_id=<%=res.getString("D_id") %>" class="btn btn-danger">Delete</a></td>
        </tr>
        <% } %>
    </table>
    
    <!-- Type your code Here -->

    <%@ include file="Layouts/Footer.jsp" %>
<!-- End page content -->
</div>

<%@ include file="Layouts/Scripts.jsp" %>
</body>

