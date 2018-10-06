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
          <%
              SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM");
              String reqDate = request.getParameter("date");
              if (reqDate == null) {
                  reqDate = fmt.format(new Date());
              }
              Date dobj = fmt.parse(reqDate);

              try {
//                  throw new Exception("sasdasdasfa");
                  ResultSet rs = PaymentDao.getPaymentSummary();
                  double incomeSum = 0;
                  double expenseSum = 0;
                  String data1 = "";
                  String data2 = "";

                  while (rs.next()) {
                      String date = rs.getString("year") + "-" + rs.getString("month");
                      double sum = rs.getDouble("sum");
                      double rand = Math.random() * 15;
                      data1 += "{ x: '" + date + "', "
                              + "y:" + String.format("%.0f", sum) + " }, ";

                      data2 += "{ x: '" + date + "', "
                              + "y:" + String.format("%.0f", rand) + " }, ";

                      expenseSum += rand;
                      incomeSum += sum;
                  }
          %>
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
                  <h5 class="text-success">$<%= String.format("%.2f", incomeSum)%></h5>
                </div>
                <hr>
                <div>
                  <small class="text-secondary">Expenses</small>
                  <h5 class="text-danger">$<%= String.format("%.2f", expenseSum)%></h5>
                </div>
                <hr>
                <div>
                  <small class="text-secondary">Balance</small>
                  <h4 class="text-primary">$<%= String.format("%.2f", (incomeSum - expenseSum))%></h4>
                </div>
              </div>
            </div>
          </div>
          <script>
            var ctx = document.getElementById("incomeChart").getContext('2d');
            var myChart = new Chart(ctx, {
              type: 'line',
              data: {
                datasets: [
                  {
                    label: "Expenses",
                    data: [<%= data2%>],
                    borderColor: "rgb(200, 40, 40)",
                    backgroundColor: "rgba(200, 40, 40, 0.2)",
                  },
                  {
                    label: "Income",
                    data: [<%= data1%>],
                    borderColor: "rgb(120, 200, 40)",
                    backgroundColor: "rgba(120, 200, 40, 0.2)",
                  },
                ],
              },
              options: {
                responsive: true,

                scales: {
                  barValueSpacing: 5,
                  legend: {
                    display: true,
                    position: 'bottom',
                  },
                  xAxes: [{
                      type: "time",
                      time: {
                        unit: 'month',
                        format: "YYYY/MM",
                        tooltipFormat: 'll',
                      },
                      stacked: true,
                    }],
                }
              }
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