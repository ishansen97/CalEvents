<%@page import="java.util.HashMap"%>
<%@page import="com.payment.utils.*"%>
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
    <title>Payment - Income</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="scripts/Chart.bundle.min.js" type="text/javascript"></script>
    <script src="scripts/palette.js" type="text/javascript"></script>
    <script src="scripts/charts.js" type="text/javascript"></script>
    <%@ include file="Layouts/Styles.jsp" %>
    <%
        SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM");
        String reqEvent = Fmt.nullIfBlank(request.getParameter("event"));
        String reqDate = Fmt.nullIfBlank(request.getParameter("date"));
        String reqSort = Fmt.nullIfBlank(request.getParameter("sort"));
        String reqOrder = Fmt.nullIfBlank(request.getParameter("order"));

        boolean searched = true;
        String searchDate = reqDate != null ? reqDate : "";
        String searchString = "Search for: ";
        if (reqEvent != null) {
            searchString += "'" + reqEvent + "' ";
        }
        if (reqDate != null) {
            searchString += "on " + reqDate + " ";
        }
        if (searchString.equals("Search for: ")) {
            searched = false;
            searchString = "All";
        }
    %>
  </head>
  <body class="w3-light-grey">

    <%@ include file="Layouts/Navigation.jsp" %>

    <!-- !PAGE CONTENT! -->
    <div class="w3-main" style="margin-left:300px;margin-top:43px;">
      <div class="container">
        <br>
        <br>
        <div class="row justify-content-between" style="padding: 0">
          <div class="col mb-2">
            <h2>Payments - <small><i><%= searchString%></i></small></h2>
          </div>
          <% if (searched) { %>
          <div class="col text-right">
            <a href="payments.jsp" class="btn btn-danger">Clear</a>
          </div>
          <% } %>
        </div>
        <form method="GET" class="row justify-content-end" id="search_payments" style="padding:0">
          <div class="input-group col-12" style="font-size: 0.95em">
            <input name="event" type="text" placeholder="Event name" value="<%= reqEvent == null ? "" : reqEvent%>" class="form-control">
            <div class="input-group-append">
              <input name="date" type="month" value="<%= searchDate%>" class="form-control" >
              <button class="form-control btn btn-primary">Search</button>
            </div>
          </div>
          <div class="input-group col-3 mt-2">
            <select name="sort" id="" class="form-control form-control-sm">
              <option value="" disabled selected>Sort by...</option>
              <option value="sort_date">Date</option>
              <option value="sort_event">Event</option>
              <option value="sort_price">Price</option>
            </select>
            <div class="input-group-append">
              <select name="order" id="order" class="form-control form-control-sm">
                <option value="desc">Descending</option>
                <option value="asc">Ascending</option>
              </select>
            </div>
          </div>
        </form>
        <hr>
        <br>
        <%
            try {
//                ArrayList<Payment> rs = PaymentDao.getPaymentsForMonth(reqDate);
                ArrayList<Payment> rs = PaymentDao.paymentSearch(reqEvent, reqDate, reqSort, reqOrder);
                if (!rs.isEmpty()) {

                    if (reqEvent == null) {
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
        <%}%>
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
                    <% for (Payment p : rs) {%>
                    <tr>
                      <th><%= String.format("%05d", p.getId())%></th>
                      <td><%= p.getEvent().getCusName()%></td>
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
            No payments found for query
          </div>
        </div>
        <%
            }
        } catch (Exception e) {
          e.printStackTrace();
        %>
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