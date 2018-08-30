<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.math.RoundingMode"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.payment.Payment"%>
<!DOCTYPE html>
<html>
  <title>Payment</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <%@ include file="Layouts/Styles.jsp" %>
  <%
      SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM");
      String reqDate = request.getParameter("date");
      if (reqDate == null) {
          reqDate = fmt.format(new Date());
      }
      Date dobj = fmt.parse(reqDate);
  %>

  <body class="w3-light-grey">

    <%@ include file="Layouts/Navigation.jsp" %>

    <!-- !PAGE CONTENT! -->
    <div class="w3-main" style="margin-left:300px;margin-top:43px;">
      <div class="container">
        <br>
        <br>
        <form method="GET" class="row" id="search_payments" style="padding:0">
          <div class="col-8">
            <h2>Payments - <small><i><%= new SimpleDateFormat("MMMM yyyy").format(dobj) %></i></small></h2>
          </div>
          <div class="col-4">
            <div class="input-group">
              <input name="date" type="month" value="<%= reqDate%>" class="form-control" >
              <div class="input-group-append">
                <button class="form-control btn btn-primary">Search</button>
              </div>
            </div>
          </div>

        </form>
              <hr>
        <br>
        <div class="row" style="padding: 0">
          <%
              SimpleDateFormat datefmt = new SimpleDateFormat("dd/MM/yy");
              try {
                  ResultSet rs = Payment.getPaymentsForMonth(reqDate);
                  if (rs.next()) {
                      rs.previous();
          %>

          <div class="col-12">
            <div class="card">
              <table class="table table-striped" style="margin:0">
                <thead class="thead-dark">
                <th>Invoice</th>
                <th>Customer</th>
                <th width="100%">Event</th>
                <th></th>
                <th class="text-center">Date</th>
                <th class="text-center">Method</th>
                <th class="text-center">Total</th>
                </thead>
                <tbody>
                  <%
                      double total = 0;
                      while (rs.next()) {
                          double amount = rs.getDouble("amount");
                          Date date = rs.getDate("pay_date");
                          total += amount;
                  %>
                  <tr>
                    <th><%= String.format("%05d", rs.getInt("pay_id"))%></th>
                    <td>Customer Name</td>
                    <td><%= rs.getString("event_name")%></td>
                    <td class="text-right">
                      <a class="btn btn-sm btn-outline-secondary" href="invoice.jsp?id=<%= String.format("%05d", rs.getInt("pay_id"))%>">View</a>
                    </td>
                    <td class="text-center"><%= datefmt.format(date)%></td>
                    <td class="text-center"><%= rs.getString("method")%></td>
                    <td class="text-center">$<%= String.format("%.2f", amount)%></td>
                  </tr>
                  <% }%>
                </tbody>
                <tfoot class="table-active">
                  <tr>
                    <th colspan="5"></th>
                    <th>Total Sum: </th>
                    <th>$<%= String.format("%.2f", total)%></th>
                  </tr>
                </tfoot>
              </table>
            </div>
          </div>

          <%} else {
          %>
          <div class="col-12 alert alert-info" role="alert">
            No payments found for <%= reqDate %>
          </div>
          <%
              }
          } catch (Exception e) { %>
          <div class="alert alert-danger" role="alert">
            Error while loading page! Please retry
          </div>
          <% }%>
        </div>
        <br>
        <%@ include file="Layouts/Footer.jsp" %>
        <!-- End page content -->
      </div>
    </div>

    <%@ include file="Layouts/Scripts.jsp" %>
  </body>
</html>