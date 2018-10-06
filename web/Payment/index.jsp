<%@page import="com.payment.utils.Graphs"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.payment.PaymentDao"%>
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
    <%@ include file="Layouts/Styles.jsp" %>
    <script src="scripts/Chart.bundle.min.js" type="text/javascript"></script>
    <script src="scripts/charts.js" type="text/javascript"></script>
  </head>
  <body class="w3-light-grey">
    <%@ include file="Layouts/Navigation.jsp" %>
    <!-- !PAGE CONTENT! -->
    <div class="w3-main" style="margin-left:300px;margin-top:43px;">
      <br>
      <div class="container">
        <div>
          <h2>Overview</h2>
          <hr>
        </div>
        <div class="row" style="padding: 0">
          <% try {
                  HashMap<Integer, String> sum = Graphs.getIndexSummary(); %>
          <div class="col-10">
            <div class="card">
              <div class="card-header">Cashflow</div>
              <div class="card-body">
                <canvas id="incomeChart" width="600" height="200"></canvas>
              </div>
            </div>
          </div>
          <div class="col-2">
            <div class="card">
              <div class="card-header">
                Summary
              </div>
              <div class="card-body">
                <div>
                  <small class="text-secondary">Income</small>
                  <h5 class="text-success">$<%= sum.get(Graphs.PAYMENT_SUM)%></h5>
                </div>
                <hr>
                <div>
                  <small class="text-secondary">Expenses</small>
                  <h5 class="text-danger">$<%= sum.get(Graphs.EXPENSE_SUM)%></h5>
                </div>
                <hr>
                <div>
                  <small class="text-secondary">Balance</small>
                  <h4 class="text-primary">$<%= sum.get(Graphs.PAYMENT_EXPENSE_BALANCE)%></h4>
                </div>
              </div>
            </div>
          </div>
          <script>
            window.addEventListener("DOMContentLoaded", function () {
              initIndexGraph("incomeChart", [<%= sum.get(Graphs.EXPENSE_SUMMARY)%>], [<%= sum.get(Graphs.PAYMENT_SUMMARY)%>]);
            });
          </script>
        </div>
        <% } catch (Exception e) {%>
        <div class="alert alert-danger" role="alert">
          Error while loading page! Please retry <%= e%>
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