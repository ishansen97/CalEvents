<%@page import="com.payment.utils.Graphs"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.payment.utils.Fmt"%>
<%@page import="com.payment.ExpenseDao"%>
<%@page import="com.payment.Expense"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.math.RoundingMode"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.payment.Payment"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Payment</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@ include file="./Layouts/Styles.jsp" %>
    <script src="scripts/Chart.bundle.min.js" type="text/javascript"></script>
    <script src="scripts/palette.js" type="text/javascript"></script>
    <script src="scripts/charts.js" type="text/javascript"></script>
  </head>
  <body class="w3-light-grey">
    <%@ include file="./Layouts/Navigation.jsp" %>
    <!-- !PAGE CONTENT! -->
    <div class="w3-main" style="margin-left:300px;margin-top:43px;">
      <br>
      <div class="container">
        <div class="container">
          <br>
          <br>
          <form method="GET" class="row" id="search_payments" style="padding:0">
            <div class="col-8">
              <h2>Expenses</h2>
            </div>
          </form>
          <hr>
          <%
              try {
                  ArrayList<Expense> expenses = ExpenseDao.getAllExpenses();
                  if (!expenses.isEmpty()) {
                      HashMap<Integer, String> summary = Graphs.getExpensesSummary(ExpenseDao.getExpensesSummary());
          %>
          <div class="row">
            <div class="col-12">
              <div class="card">
                <div class="card-header">Summary</div>
                <div class="card-body">
                  <div class="row">
                    <div class="col-9"><canvas id="expensesGraph" height="150" width="500"></canvas></div>
                    <div class="col-3"><canvas id="expensesPie" height="100" width="100"></canvas></div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <br>
          <div class="row">
            <div class="col-12">
              <div class="card">
                <div class="card-header">
                  Details
                </div>
                <div class="card-body" style="padding:0">
                  <table class="table table-striped text-center" style="margin:0">
                    <thead class="">
                    <th class="text-left">Invoice</th>
                    <th class="text-left"width="100%">Description</th>
                    <th>Department</th>
                    <th>Date</th>
                    <th>Method</th>
                    <th class="text-right">Total</th>
                    <th></th>
                    </thead>
                    <tbody>
                      <% for (Expense exp : expenses) {%>
                      <tr>
                        <th class="text-left"><%= String.format("%05d", exp.getId())%></th>
                        <td class="text-left"><%= exp.getDesc()%></td>
                        <td><%= Fmt.toTitleCase(exp.getDept())%></td>
                        <td><%= Fmt.toShortDate(exp.getDate())%></td>
                        <td><%= Fmt.toTitleCase(exp.getMethod())%></td>
                        <td class="text-right">$<%= Fmt.toDec(exp.getAmount())%></td>
                        <td class="text-right">
                          <a class="btn btn-sm btn-outline-secondary" href="invoice_expense.jsp?id=<%= exp.getId()%>">View</a>
                        </td>
                      </tr>
                      <% }%>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
          <script>
            window.addEventListener('DOMContentLoaded', function () {
              initExpensesAllGraph("expensesGraph", [<%= summary.get(Graphs.SUMMARY_GRAPH)%>]);
              initExpensesPie("expensesPie", [<%= summary.get(Graphs.SUMMARY_PIE_DATA)%>], [<%= summary.get(Graphs.SUMMARY_PIE_LABELS)%>]);
            });
          </script>
          <% } else {%>
          <div class="row">
            <div class="col-12 alert alert-info" role="alert">
              No expenses found!
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
      </div>
      <br>
    </div>
    <%@ include file="./Layouts/Footer.jsp" %>
    <%@ include file="./Layouts/Scripts.jsp" %>
  </body>
</html>