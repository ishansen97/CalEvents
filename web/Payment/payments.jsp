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
            SimpleDateFormat datefmt = new SimpleDateFormat("dd/MM/yy");
            try {
                ResultSet rs = Payment.getPaymentsForMonth(reqDate);
                if (rs.next()) {
                    rs.previous();
                    ResultSet paymentSummary = Payment.getPaymentSummaryForMonth(reqDate);
                    String paymentData = "";
                    double paymentTotal = 0;
                    double paymentSum;
                    while (paymentSummary.next()) {
                        paymentSum = paymentSummary.getDouble("sum(amount)");
                        paymentTotal += paymentSum;
                        paymentData += "{ "
                                + "x: '" + paymentSummary.getString("date(date_time)") + "', "
                                + "y: " + paymentSum + ", "
                                + "},";
                    }

                    ResultSet eventsSummary = Payment.getEventsSummary(reqDate);
                    String eventsLabels = "";
                    String eventsData = "";
                    int eventsTotal = 0;
                    int eventsCount;
                    while (eventsSummary.next()) {
                        eventsCount = eventsSummary.getInt("count(event_id)");
                        eventsTotal += eventsCount;
                        eventsLabels += "'" + eventsSummary.getString("event_id") + "', ";
                        eventsData += eventsCount + ", ";
                    }
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
                      Total Income: <b>$<%= String.format("%.2f", paymentTotal)%></b> <small>(from a total of <%= eventsTotal%> payments)</small>
                    </span>
                  </div>
                </div>

                <script>
                  var paymentsGraph = document.getElementById("paymentsGraph").getContext("2d");
                  var paymentData = [<%= paymentData%>];
                  var paymentsLineGraph = new Chart(paymentsGraph, {
                    type: 'line',
                    data: {
                      datasets: [
                        {
                          data: paymentData,
                          borderColor: "rgb(120, 200, 40)",
                          backgroundColor: "rgba(120, 200, 40, 0.2)",
                        },
                      ],
                    },
                    options: {

                      title: {
                        display: true,
                        text: 'Income',
                      },
                      legend: {
                        display: false,
                      },
                      scales: {
                        barValueSpacing: 2,
                        xAxes: [{
                            type: "time",
                            time: {
                              unit: 'day',
                              format: "YYYY-MM-DD",
                              tooltipFormat: 'll',
                            },
                          }],
                      },
                      elements: {
                        line: {
                          tension: 0, // disables bezier curves
                        }
                      }
                    }
                  });

                  var eventsPie = document.getElementById("eventsPie").getContext("2d");
                  var eventsData = [<%= eventsData%>];
                  var eventsLabel = [<%= eventsLabels%>];
                  var eventsPieChart = new Chart(eventsPie, {
                    type: 'doughnut',
                    data: {
                      labels: eventsLabel,
                      datasets: [{
                          label: "Most popular events",
                          data: eventsData,
                          backgroundColor: palette('cb-Pastel2', eventsData.length).map(function (hex) {
                            return '#' + hex;
                          }),
                        }],
                    },
                    options: {
                      title: {
                        display: true,
                        text: 'Most popular events',
                      },
                      legend: {
                        display: true,
                        position: 'bottom',
                        labels: {
                          boxWidth: 20
                        },
                      },
                    }
                  });
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
                        while (rs.next()) {
                            double amount = rs.getDouble("amount");
                            Date date = rs.getDate("pay_date");
                    %>
                    <tr>
                      <th><%= String.format("%05d", rs.getInt("pay_id"))%></th>
                      <td>Customer Name</td>
                      <td><%= rs.getString("event_name")%> (<a href="#"><%= rs.getString("event_id")%></a>)</td>
                      <td class="text-right">
                        <a class="btn btn-sm btn-outline-secondary" href="invoice.jsp?id=<%= String.format("%05d", rs.getInt("pay_id"))%>">View</a>
                      </td>
                      <td class="text-center"><%= datefmt.format(date)%></td>
                      <td class="text-center"><%= rs.getString("pay_method")%></td>
                      <td class="text-center">$<%= String.format("%.2f", amount)%></td>
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