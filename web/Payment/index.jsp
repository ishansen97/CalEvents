<%@page import="com.payment.ExpenseDao"%>
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
    <script src="scripts/palette.js" type="text/javascript"></script>
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

        <% try {
                HashMap<Integer, String> sum = Graphs.getIndexSummary();%>
        <div class="row" style="padding: 0">
          <div class="col">
            <div class="card">
              <div class="card-header">Cashflow</div>
              <div class="card-body">
                <div class="row">
                  <div class="col-10">
                    <canvas id="incomeChart" width="600" height="200"></canvas>
                  </div>
                  <div class="col-2">
                    <div><h4>Summary</h4></div>
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
                  </div
                </div>
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
      <br>
      <% HashMap<Integer, String> summary = Graphs.getPaymentSummary(null);%>
      <div class="row" style="padding: 0">
        <div class="col-12">
          <div class="card">
            <div class="card-header">Income</div>
            <div class="card-body">
              <div class="row">
                <div class="col-9"><canvas id="paymentsGraph" height="150" width="500"></canvas></div>
                <div class="col-3"><canvas id="paymentsPie" height="100" width="100"></canvas></div>
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
                  initEventsPie("paymentsPie", [<%= summary.get(Graphs.PAYMENT_PIE_LABEL)%>], [<%= summary.get(Graphs.PAYMENT_PIE_DATA)%>]);
                })
              </script></div>
          </div>
        </div>
      </div>
      <br>
      <% HashMap<Integer, String> esummary = Graphs.getExpensesSummary(ExpenseDao.getExpensesSummaryForMonth(null));%>
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header">Expenses Summary</div>
            <div class="card-body">
              <div class="row">
                <div class="col-9"><canvas id="expensesGraph" height="150" width="500"></canvas></div>
                <div class="col-3"><canvas id="expensesPie" height="100" width="100"></canvas></div>
              </div>
            </div>
          </div>
        </div>
        <script>
          window.addEventListener('DOMContentLoaded', function () {
            initExpensesAllGraph("expensesGraph", [<%= esummary.get(Graphs.SUMMARY_GRAPH)%>]);
            initExpensesPie("expensesPie", [<%= esummary.get(Graphs.SUMMARY_PIE_DATA)%>], [<%= esummary.get(Graphs.SUMMARY_PIE_LABELS)%>]);
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
