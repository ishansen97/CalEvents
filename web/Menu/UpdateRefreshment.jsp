<%-- 
    Document   : UpdateRefreshment
    Created on : Aug 5, 2018, 9:47:26 PM
    Author     : Sohan
--%>
<%@page import="menu.Refreshments,java.sql.*" %>
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
    <a href="Refreshments.jsp" class="btn btn-danger">Add new Refreshments</a>
    
    <% ResultSet res = Refreshments.getRefreshment(); %>
    <table>
        <tr>
            <th>Refreshments Name </th>
            <th>Ingredients </th>
            <th>Price</th>
        </tr>
        <tr>
            <% while (res.next()) { %>
            <td><%=res.getString("R_name") %></td>
            <td><%=res.getString("Ingredient") %></td>
            <td><%=res.getString("Price") %></td>
            <td><a href="editrefresh.jsp?ref_id=<%=res.getString("R_id") %>" class="btn btn-success">Edit</a></td>
            <td><a href="deleterefresh.jsp?ref_id=<%=res.getString("R_id") %>" class="btn btn-danger">Delete</a></td>
        </tr>
        <% } %>
    </table>
    
    <!-- Type your code Here -->

    <%@ include file="Layouts/Footer.jsp" %>
<!-- End page content -->
</div>

<%@ include file="Layouts/Scripts.jsp" %>
</body>
