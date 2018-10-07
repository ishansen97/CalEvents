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
  <%
        SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM");
        String reqEvent = Fmt.nullIfBlank(request.getParameter("event"));
        String reqDate = Fmt.nullIfBlank(request.getParameter("date"));
        String reqDept = Fmt.nullIfBlank(request.getParameter("dept"));
        String reqMethod = Fmt.nullIfBlank(request.getParameter("method"));
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
            <h2>Expenses</h2>
          </div>
          <% if (searched) { %>
          <div class="col text-right">
            <a href="payments.jsp" class="btn btn-danger">Clear</a>
          </div>
          <% } %>
        </div>
        <form method="GET" class="row justify-content-end" id="search_payments" style="padding:0">
          <div class="input-group col-12" style="font-size: 0.95em">
            <input name="description" type="text" placeholder="Description" value="<%= reqEvent == null ? "" : reqEvent%>" class="form-control">
            <div class="input-group-append">
              <select name="dept" id="" class="form-control" style="min-width: 150px;">
                <option value="" disabled selected>Department...</option>
                <option value="Facility">Facility</option>
                <option value="Kitchen">Kitchen</option>
              </select>
              <select name="method" id="" class="form-control" style="min-width: 150px;">
                <option value="" disabled selected>Method...</option>
                <option value="cash">Cash</option>
                <option value="credit">Credit</option>
              </select>
              <input name="date" type="month" value="<%= searchDate%>" class="form-control" >
              <button class="form-control btn btn-primary">Search</button>
            </div>
          </div>
          <div class="input-group col-3 mt-2">
            <select name="sort" id="" class="form-control form-control-sm">
              <option value="" disabled selected>Sort by...</option>
              <option value="sort_date">Date</option>
              <option value="sort_invoice">Invoice</option>
              <option value="sort_amount">Amount</option>
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
                  ArrayList<Expense> expenses = ExpenseDao.expensesSearch(reqEvent, reqDept, reqMethod, reqDate, reqSort, reqOrder);
                  if (!expenses.isEmpty()) {
                      if (reqEvent == null && reqDept == null && reqMethod == null) {
                        HashMap<Integer, String> summary = Graphs.getExpensesSummary(ExpenseDao.getExpensesSummaryForMonth(reqDate));
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
            <script>
              window.addEventListener('DOMContentLoaded', function () {
                initExpensesAllGraph("expensesGraph", [<%= summary.get(Graphs.SUMMARY_GRAPH)%>]);
                initExpensesPie("expensesPie", [<%= summary.get(Graphs.SUMMARY_PIE_DATA)%>], [<%= summary.get(Graphs.SUMMARY_PIE_LABELS)%>]);
              });
            </script>
          </div>
          <%}%>
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
                    <th>Department</th>
                    <th class="text-left"width="100%">Description</th>
                    <th>Date</th>
                    <th>Method</th>
                    <th class="text-right">Total</th>
                    <th></th>
                    </thead>
                    <tbody>
                      <% for (Expense exp : expenses) {
                          String notes = exp.getNotes() != null ? "<div class='text-muted'>"+exp.getNotes()+"</div>" : "";
                      %>
                      <tr>
                        <th class="text-left"><%= String.format("%05d", exp.getId())%></th>
                        <th><%= Fmt.toTitleCase(exp.getDept())%></th>
                        <td class="text-left"><%= exp.getDesc()%> <%= notes%></td>
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