<%@page import="com.payment.ExpenseDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.payment.Expense"%>
<%@page import="com.payment.utils.Fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Invoice</title>
    <%@ include file="Layouts/Styles.jsp" %>
  </head>
  <body>
    <br>
    <div class="container">
      <%
          String id = request.getParameter("id");
          try {
              Expense expense = ExpenseDao.getExpense(id);

              if (expense != null) {
      %>

      <div class="d-flex justify-content-between align-items-center">
        <h3>Invoice #<%= String.format("%05d", expense.getId())%></h3>
        <date><%= Fmt.toDetailedDate(expense.getDate())%></date>
      </div>
      <hr>
      <br>

      <table class="table">
        <thead>
          <tr>
            <th>Descripton</th>
            <th style="width: 13%">Department</th>
            <th style="width: 13%">Date</th>
            <th class="text-right" style="width: 10%">Method</th>
            <th class="text-right" style="width: 10%">Amount</th>
          </tr>
        </thead>
        <tr>
          <td class="text-left"><%= expense.getDesc()%></td>
          <td><%= Fmt.toTitleCase(expense.getDept())%></td>
          <td><%= Fmt.toLongDate(expense.getDate())%></td>
          <td class="text-right"><%= Fmt.toTitleCase(expense.getMethod())%></td>
          <td class="text-right">$ <%= Fmt.toDec(expense.getAmount())%></td>
        </tr>
        <tfoot class="text-right">
          <tr>
            <td colspan="3"></td>
            <th>Total</th>
            <th style="font-size: 1.2em">$ <%= Fmt.toDec(expense.getAmount())%></th>
          </tr>
        </tfoot>
      </table>
      <br>
      <footer class="d-print-none">
        <hr>
        <div class="d-flex justify-content-end">
          <a class="btn btn-sm btn-primary mr-2" href="#" onclick="window.print()">Print</a>
          <!-- ADMIN ONLY -->
          <a class="btn btn-sm btn-danger" href="#" onclick="confirmDelete('<%= expense.getId()%>')">Delete</a>
        </div>
      </footer>
      <%} else {
                  out.println("invoice not found!");
              }
          } catch (Exception e) {
              e.printStackTrace();
              out.println(e);
          }%>
    </div>
  </body>
</html>
