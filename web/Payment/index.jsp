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
  <form action="" class="container" id="search_payments" style="padding:0">
   <div class="input-group">
      <input type="text" class="form-control" placeholder="Event" style="width:40%">
      <input type="date" class="form-control" >
      <select name="" id="" class="form-control">
        <option value="">Method</option>
      </select>
      <div class="input-group-append">
        <button class="form-control btn btn-primary">Search</button>
      </div>
   </div>
  </form>
<!--  <div class="container card">
    <%--<%@include file="payment.jsp"%>--%>
  </div>-->
  <br>
  <div class="container card" style="padding: 0">
    <% try {
        ResultSet rs = Payment.getAllPayments(); %>
    <table class="table table-striped" style="margin:0">
      <thead class="thead-dark">
        <th>#</th>
        <th width="30%">Customer</th>
        <th colspan="2">Event name</th>
        <!--<th>Event Description</th>-->
        <th class="text-center">Amount</th>
        <th class="text-center">Method</th>
        <th>Paid Date</th>
        <th class="text-center">Details</th>
      </thead>
      <tbody>
        <% while(rs.next()) { %>
        <tr>
          <th><%= rs.getString("pay_id") %></th>
          <td>Customer Name</td>
          <td><%= rs.getString("event_name") %></td>
          <td class="text-right"><small>Reserved: <%= rs.getString("res_date") %></small></td>
          <td class="text-center">$<%= rs.getString("amount") %></td>
          <td class="text-center"><%= rs.getString("method") %></td>
          <td><%= rs.getString("pay_date") %></td>
          <td class="text-center"><a href="#">View</a></td>
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
  <br>
  <%@ include file="Layouts/Footer.jsp" %>
<!-- End page content -->
</div>

<%@ include file="Layouts/Scripts.jsp" %>
</body>
</html>