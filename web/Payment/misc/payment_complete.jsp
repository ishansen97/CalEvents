<%--
    Document   : payment_complete.js
    Created on : Aug 12, 2018, 10:29:30 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link href="../External/Bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
  </head>
  <body>
    <br>
    <div class="container">
      <h3>Invoice #0001</h3>
      <hr>
      <div>
        <b>Customer Name</b>
      </div>
      <br>
      <table class="table table-bordered table-sm" style="width: 300px">
        <tr>
          <th class="table-active">Reservation ID</th>
          <td>R001</td>
        </tr>
        <tr>
          <th class="table-active">Event ID</th>
          <td>E001</td>
        </tr>
        <tr>
          <th class="table-active">Date</th>
          <td>2018-08-09 21:05:21</td>
        </tr>

      </table>
      <table class="table table-bordered">
        <thead class="thead-light">
          <th width="80%">Event</th>
          <th class="text-right" width="15%">Rate</th>
          <th class="text-left">Amount</th>
        </thead>
        <tr>
          <td>exhibition 1</td>
          <td class="text-right">1 seat x $30.00</td>
          <td class="text-left">$30.00</td>
        </tr>
        <tr>
          <td colspan="1" style="border-width: 0 1px"></td>
          <th class="text-right">Sub Total: </th>
          <td class="text-left">$30.00</td>
        </tr>
        <tr>
          <td colspan="1" style="border-width: 0 1px"></td>
          <td class="text-right">Tax (10%): </td>
          <td class="text-left">$3.00</td>
        </tr>
        <tr>
          <td colspan="1" style="border-width: 0 1px"></td>
          <th class="text-right">Total: </th>
          <td class="text-left">$33.00</td>
        </tr>
        <tr>
          <td colspan="1" style="border-width: 0 1px"></td>
          <th class="text-right">Amount Paid: </th>
          <th class="text-left">$33.00</th>
        </tr>
        <tr>
          <td class="table-active" colspan="2" style="padding:0"></td>
          <td class="table-active" style="padding:0"><button class="btn btn-secondary  btn-block">Print</button></td>
        </tr>
      </table>
    </div>
  </body>
</html>
