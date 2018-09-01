<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.payment.PaymentDB"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.math.RoundingMode"%>
<%@page import="java.math.BigDecimal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.payment.Payment"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Invoice</title>
    <%@ include file="Layouts/Styles.jsp" %>
  </head>
  <body>
    <br>
    <%
        String id = request.getParameter("id");
        try {
            ResultSet rs = Payment.getPaymentById(id);
            SimpleDateFormat datefmt = new SimpleDateFormat("MMMM dd, yyyy");
            if (rs.next()) {
                NumberFormat decimal = new DecimalFormat("#0.00");
                double amount_paid = rs.getDouble("amount");
                String amountPaidStr = String.format("%.2f", amount_paid);
                Date dateRes = rs.getDate("res_date");
                Date datePay = rs.getDate("pay_date");
                
                String query = "SELECT * FROM customer "
                + "WHERE cus_id = ?";

                Connection con = PaymentDB.getConnection();
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, rs.getString("cus_id"));

                ResultSet customerDetails = ps.executeQuery();
                if (!customerDetails.next()) {
                    throw new Exception("Customer not found");
                }
    %>
    <div class="container">
      <div class="d-flex justify-content-between align-items-center">
        <h3>Invoice #<%= String.format("%05d", rs.getInt("pay_id"))%></h3>
        <time><%= rs.getString("pay_date")%></time>
      </div>
      <hr>
      <br>
      <div class="d-flex justify-content-between align-items-top">
        <table class="table-sm">
          <tr>
            <th colspan="2"><%= customerDetails.getString("name") %></th>
          </tr>
          <tr>
            <td>
              <i class="fa fa-envelope mr-2"></i>
            </td>
            <td>
              <%= customerDetails.getString("email") %>
            </td>
          </tr>
          <tr>
            <td width="2">
              <i class="fa fa-phone mr-2"></i>
            </td>
            <td>
              <%= customerDetails.getString("contact_number") %>
            </td>
          </tr>
          <tr>
            <td></td>
            <td>
              <%= customerDetails.getString("address").replaceAll("\r?\n", "<br>") %>
            </td>
          </tr>
        </table>
        <table class="table-sm" style="width: 300px">
          <tr>
            <th class="text-right pr-2">Reservation ID</th>
            <th class="pl-3"><%= rs.getString("res_id")%></th>
          </tr>
          <tr>
            <th class="text-right pr-2">Booked Date</th>
            <td class="pl-3"><%= datefmt.format(dateRes)%></td>
          </tr>
          <tr>
            <th class="text-right pr-2">Paid Date</th>
            <td class="pl-3"><%= datefmt.format(datePay)%></td>
          </tr>
          <tr>
            <th class="text-right pr-2">Payment Method</th>
            <td class="pl-3"><%= rs.getString("pay_method")%></td>
          </tr>
          <tr>
            <th class="text-right pr-2">Amount Paid</th>
            <td class="pl-3">$<%= amountPaidStr%></td>
          </tr>
        </table>
      </div>
      <br>
      <table class="table border">
        <thead class="table-active">
        <th class="border-right-0" width="80%">Reservation</th>
        <th class="border-left-0" width="0"></th>
        <th class="text-center">Seats</th>
        <th class="text-right">Price</th>
        <th class="text-right">Total</th>
        </thead>
        <tr>
          <td class="border-right-0">
            <b><%=rs.getString("event_name")%></b>
            <small class="text-small">
              -- <%= rs.getString("event_id")%>
            </small>
          </td>
          <td class="border-left-0"></td>
          <td class="text-center">1</td>
          <td class="text-right">$<%= amountPaidStr%></td>
          <td class="text-right">$<%= amountPaidStr%></td>
        </tr>
        <!--Payment Details-->
        <tr class="border-top">
          <!--SubTotal-->
          <td class="border-0" colspan="2"></td>
          <td class="text-secondary text-right border-top-0 border-bottom-0" colspan="2">Sub Total: </td>
          <th class="text-right no-border-top" style="border-width: 0 1px">$<%= amountPaidStr%></th>
        </tr>
        <tr class="">
          <!--Tax-->
          <td class="border-0" colspan="2"></td>
          <td class="text-secondary text-right border-top-0 border-bottom-0" colspan="2">Discount: </td>
          <th class="text-right border-top-0 border-bottom-0">$0.00</th>
        </tr>
        <tr class="">
          <!--Total-->
          <td class="border-0" colspan="2"></td>
          <td class="text-secondary text-right border-bottom-0" colspan="2">Total: </td>
          <th class="text-right border-bottom-0" style="font-size: 120%">$<%= amountPaidStr%></th>
        </tr>
      </table>
      <br>
      <footer class="d-print-none">
        <hr>
        <div class="d-flex justify-content-end">
          <a class="btn btn-sm btn-primary mr-2" href="#" onclick="window.print()">Print</a>
          <!-- ADMIN ONLY -->
          <a class="btn btn-sm btn-danger" href="#" onclick="confirmDelete('<%= rs.getInt("pay_id")%>')">Delete</a>
        </div>
      </footer>
    </div>
    <%}
    } catch (Exception e) {
        e.printStackTrace();
    %>
    <%= e%>
    <%}%>
  </body>
</html>
