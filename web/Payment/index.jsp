<%@page import="java.sql.ResultSet"%>
<%@page import="com.payment.Payment"%>
<!DOCTYPE html>
<html>
<title>Payment</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%@ include file="Layouts/Styles.jsp" %>

<body class="w3-light-grey">

<%@ include file="Layouts/Navigation.jsp" %>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">

  <br>
  <div class="container">
    <%@include file="payment.jsp"%>
    <% try {
        ResultSet rs = Payment.getAllPayments(); %>
    <table class="table table-striped table-bordered">
      <thead class="thead-dark">
        <th>#</th>
        <th>Reservation</th>
        <th>Payment Amount</th>
        <th>Payment Date</th>
        <th>Payment Method</th>
      </thead>
      <tbody>
        <% while(rs.next()) { %>
        <tr>
          <td><%= rs.getString("pay_id") %></td>
          <td><%= rs.getString("res_id") %></td>
          <td><%= rs.getString("amount") %></td>
          <td><%= rs.getString("date_time") %></td>
          <td><%= rs.getString("method") %></td>
        </tr>
        <% } %>
      </tbody>
    </table>
    <% } catch (Exception e) { %>
    <div class="alert alert-danger" role="alert">
      Error while loading page! Please retry
    </div>
    <% } %>
  </div>
  <%@ include file="Layouts/Footer.jsp" %>
<!-- End page content -->
</div>

<%@ include file="Layouts/Scripts.jsp" %>
</body>
</html>