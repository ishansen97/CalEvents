<%@page import="java.util.HashMap"%>
<%@page import="com.payment.utils.Graphs"%>
<%@page import="com.payment.utils.Fmt"%>
<%@page import="com.payment.PaymentDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.math.RoundingMode"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.payment.Payment"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Payment</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="scripts/Chart.bundle.min.js" type="text/javascript"></script>
    <script src="scripts/palette.js" type="text/javascript"></script>
    <script src="scripts/charts.js" type="text/javascript"></script>
    <%@ include file="Layouts/Styles.jsp" %>
    <%
        SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM");
        String reqDate = request.getParameter("date");
        if (reqDate == null) {
            reqDate = fmt.format(new Date());
        }
        Date dobj = fmt.parse(reqDate);
    %>
  </head>
  <body class="w3-light-grey">

    <%@ include file="Layouts/Navigation.jsp" %>

    <!-- !PAGE CONTENT! -->
    <div class="w3-main" style="margin-left:300px;margin-top:43px;">
      <div class="container">
        <br>
        <br>
        <form method="GET" class="row" id="search_payments" style="padding:0">
          <div class="col-8">
            <h2>Payments - <small><i><%= new SimpleDateFormat("MMMM yyyy").format(dobj)%></i></small></h2>
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
        <%
            try {
                ArrayList<Payment> rs = PaymentDao.getPaymentsForMonth(reqDate);
                if (!rs.isEmpty()) {
                    HashMap<Integer, String> summary = Graphs.getPaymentSummary(reqDate);
        %>
        <div class="row" style="padding: 0">
          <div class="col-12">
            <div class="card">
              <div class="card-header">Summary</div>
              <div class="card-body">
                <div class="row">
                  <div class="col-9"><canvas id="paymentsGraph" height="150" width="500"></canvas></div>
                  <div class="col-3"><canvas id="eventsPie" height="100" width="100"></canvas></div>
                </div>
                <br>
                <div class="row">
                  <div class="col-12">
                    <span class="text-secondary">
                      Total Income: <b>$<%= summary.get(Graphs.PAYMENT_TOTAL)%></b> <small>(from a total of <%= summary.get(Graphs.PAYMENT_EVENT_TOTAL)%> payments)</small>
                    </span>
                  </div>
                </div>

                <script>
                  window.addEventListener("DOMContentLoaded", function () {
                    initPaymentsGraph("paymentsGraph", [<%= summary.get(Graphs.PAYMENT_SUMMARY)%>]);
                    initEventsPie("eventsPie", [<%= summary.get(Graphs.PAYMENT_PIE_LABEL)%>], [<%= summary.get(Graphs.PAYMENT_PIE_DATA)%>]);
                  })
                </script></div>
            </div>
          </div>
        </div>
        <br>
        <div class="row" style="padding: 0">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                Details
              </div>
              <div class="card-body" style="padding:0">
                <table class="table table-striped" style="margin:0">
                  <thead class="">
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
                        for (Payment p : rs) {
                    %>
                    <tr>
                      <th><%= Fmt.toDec(p.getAmount())%></th>
                      <td>Customer Name</td>
                      <td><%= p.getEvent().getEventName()%> (<a href="#"><%= p.getEvent().getEventId()%></a>)</td>
                      <td class="text-right">
                        <a class="btn btn-sm btn-outline-secondary" href="invoice.jsp?id=<%= String.format("%05d", p.getId())%>">View</a>
                      </td>
                      <td class="text-center"><%= Fmt.toShortDate(p.getDate())%></td>
                      <td class="text-center"><%= p.getMethod()%></td>
                      <td class="text-center">$<%= Fmt.toDec(p.getAmount())%></td>
                    </tr>
                    <% }%>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
        <% } else {%>
        <div class="row">
          <div class="col-12 alert alert-info" role="alert">
            No payments found for <%= reqDate%>
          </div>
        </div>
        <%
            }
        } catch (Exception e) {%>
        <div class="row">
          <div class="alert alert-danger" role="alert">
            Error while loading page! Please retry <%= e%>
          </div>
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